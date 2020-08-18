package kg.air.cnc.controller.reservation;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.common.Utils;
import kg.air.cnc.service.blame.BlameServiceImpl;
import kg.air.cnc.service.comments.CommentsService;
import kg.air.cnc.service.message.MessageService;
import kg.air.cnc.service.reservation.ReservationService;
import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.MessageVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

@Controller
public class ReservationDetailController {

	@Autowired
	CommentsService commentsService;
	@Autowired
	MessageService messageService;
	@Autowired
	ReservationService reservationService;
	@Autowired
	BlameServiceImpl blameService;

	@RequestMapping("myreservation.do")
	public ModelAndView myReservationController(ModelAndView mav) {
		mav.setViewName("myreservation");
		return mav;
	}

	@RequestMapping(value = "reservationHouse.do")
	public ModelAndView reservationDetailController(ReservationHouseDetailVO vo, HttpSession session,
			HttpServletRequest request, ModelAndView mav) {
		Utils util = new Utils();
		if (vo.getHouse_seq() == 0) {
			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			if (redirectMap != null) {
				vo.setHouse_seq(Integer.parseInt((String) redirectMap.get("house_seq")));
				vo.setAccessType((String) redirectMap.get("accessType"));
			}
		}
		System.out.println(vo.getHouse_seq());
		ReservationHouseDetailVO house = null;
		if (vo.getHouse_seq() > 0) {
			house = reservationService.getReservationHouse(vo);
			session.setAttribute("house_detail", house);
			session.setAttribute("house_seq", vo.getHouse_seq());
			house.setReservation_seq(vo.getReservation_seq());
			house.setAccessType(vo.getAccessType());
			house.setCheck_in(vo.getCheck_in());
			house.setCheck_out(vo.getCheck_out());
			house.setHouse_person(vo.getHouse_person());
			if (!util.stringNullCheck((String)session.getAttribute("login_session"))) {
				if (!vo.getAccessType().trim().equals("host")) {
					house.setFavorite_state(reservationService.getFavoriteHouse((String)session.getAttribute("login_session"), vo.getHouse_seq()));
				}
			}
			if (commentsService.getComments(vo).size() > 0) {
				mav.addObject("commentsList", commentsService.getComments(vo));
			}
			mav.addObject("house", house);
			
		}
		mav.setViewName("reservationhouse");
		return mav;
	}

	@RequestMapping("rankpopup.do")
	public String openRankPopupController() {
		return "rankpopup";
	}

	@RequestMapping("insertComments.do")
	public String insertCommentsController(CommentsVO vo, RedirectAttributes ra) {
		commentsService.insertComments(vo);
		ra.addFlashAttribute("accessType", "beforeres");
		ra.addFlashAttribute("house_seq", vo.getComments_house_seq());
		return "redirect:reservationHouse.do";
	}

	@RequestMapping("deleteComments.do")
	public String deleteCommentsController(CommentsVO vo, @RequestParam("accessType") String accessType,
			RedirectAttributes ra) {
		System.out.println(accessType);
		commentsService.deleteComments(vo);
		ra.addFlashAttribute("accessType", accessType);
		ra.addFlashAttribute("house_seq", vo.getComments_house_seq());
		return "redirect:reservationHouse.do";
	}

	@RequestMapping("updateCommentsPage.do")
	public ModelAndView openUpdateComments(CommentsVO vo, ModelAndView mav) {
		mav.addObject("comments", vo);
		System.out.println(vo.getComments_content());
		mav.setViewName("updateComments");
		return mav;
	}

	@RequestMapping("updateComment.do")
	public ModelAndView updateCommentsController(CommentsVO vo, HttpSession session, ModelAndView mav) {
		commentsService.updateComments(vo);
		mav.setViewName("updateComments");
		return mav;
	}

	@RequestMapping("openMessageFromDetail.do")
	public ModelAndView openMessagePopupController(MessageVO vo, ModelAndView mav) {
		mav.addObject("messageVO", vo);
		mav.setViewName("messagepopup");
		return mav;
	}

	@RequestMapping("insertMessageFromDetail.do")
	public ModelAndView insertMessageForDetailController(MessageVO vo, ModelAndView mav) {
		messageService.insertMessage(vo);
		mav.addObject("messageVO", null);
		mav.setViewName("messagepopup");
		return mav;
	}

	@RequestMapping("declaration.do")
	public ModelAndView goToHostBlame(BlameVO vo, ModelAndView mav) {
		mav.addObject("blameVO", vo);
		mav.setViewName("declarationpopup");
		return mav;
	}

	@RequestMapping("insertBlameHost.do")
	public String insertHostBlame(BlameVO vo, ModelAndView mav) {
		reservationService.insertBlameHost(vo);
		return "redirect:declaration.do";
	}

	@RequestMapping(value = "cancelReservation.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteReservationController(ReservationHouseDetailVO vo) {
		reservationService.cancelReservation(vo);
		return "예약이 취소되었습니다.";
	}

	@RequestMapping(value = "addFavoritHouse.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String addFavoritHouse(ReservationHouseDetailVO vo, HttpSession session) {

		CustomerVO customer = new CustomerVO();
		customer.setCustomer_id((String) session.getAttribute("login_session"));
		customer.setFavorite_house(String.valueOf(vo.getHouse_seq()));
		reservationService.addFavoriteHouse(customer);
		return "";
	}

	@RequestMapping(value = "removeFavoritHouse.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String removeFavoriteHous(ReservationHouseDetailVO vo, HttpSession session) {
		System.out.println(vo.getHouse_seq());
		String id = (String) session.getAttribute("login_session");
		String favoriteList = reservationService.getFavoriteHouseNumber(id);
		reservationService.removeFavoriteHouse(id, favoriteList, vo.getHouse_seq());
		return "";
	}

	@RequestMapping(value = "getCertainResDate.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getCertainResDate(HttpSession session) throws JsonProcessingException {
		List<ReservationHouseDetailVO> list = reservationService
				.getResForSpecHouse((Integer) session.getAttribute("house_seq"));
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	@RequestMapping(value = "getHousePhoto.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getHousePhoto(ReservationHouseDetailVO vo) throws JsonProcessingException {
		ArrayList<String> house_list= reservationService.getHousePhoto(vo.getHouse_seq());
		vo.setHouse_photourl_list(house_list);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(vo);
		return jsonStr;
	}
}