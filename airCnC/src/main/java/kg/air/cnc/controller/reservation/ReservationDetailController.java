package kg.air.cnc.controller.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.blame.BlameServiceImpl;
import kg.air.cnc.service.comments.CommentsService;
import kg.air.cnc.service.message.MessageService;
import kg.air.cnc.service.reservation.ReservationService;
import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.HouseVO;
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
	@RequestMapping(value = "reservationHouse.do", method = RequestMethod.POST )
	public ModelAndView reservationDetailController(ReservationHouseDetailVO vo,HttpSession session,ModelAndView mav) {
		session.setAttribute("session_login", "skatn"); //로그인 완료 시 제거
		ReservationHouseDetailVO house = reservationService.getReservationHouse(vo);
		house.setReservation_seq(vo.getReservation_seq());
		house.setAccessType(vo.getAccessType());
		mav.addObject("commentsList",commentsService.getComments(vo));
		mav.addObject("house",house);
		mav.setViewName("reservationhouse");
		return mav;
	}
	@RequestMapping("rankpopup.do")
	public String openRankPopupController() {
		return "rankpopup";
	}
	@RequestMapping("insertComments.do")
	public ModelAndView insertCommentsController(CommentsVO vo,ModelAndView mav) {
		System.out.println(vo.getComments_content()+"\n"+vo.getComments_rate()+"\n"+vo.getComments_house_seq()+"\n");
		commentsService.insertComments(vo);
		mav.setViewName("redirect:reservationHouse.do");
		mav.addObject("accessType","beforeres");
		mav.addObject("house_seq",vo.getComments_house_seq());
		return mav;
	}
	@RequestMapping("deleteComments.do")
	public ModelAndView deleteCommentsController(CommentsVO vo,@RequestParam("accessType")String accessType,ModelAndView mav) {
		System.out.println(accessType);
		commentsService.deleteComments(vo);
		mav.setViewName("redirect:reservationHouse.do");
		mav.addObject("accessType",accessType);
		mav.addObject("house_seq",vo.getComments_house_seq());
		return mav;
	}
	@RequestMapping("updateCommentsPage.do")
	public ModelAndView openUpdateComments(CommentsVO vo,ModelAndView mav) {
		mav.addObject("comments",vo);
		System.out.println(vo.getComments_content());
		mav.setViewName("updateComments");
		return mav;
	}
	@RequestMapping("updateComment.do")
	public ModelAndView updateCommentsController(CommentsVO vo,HttpSession session, ModelAndView mav) {
		commentsService.updateComments(vo);
		mav.setViewName("updateComments");
		return mav;
	}
	@RequestMapping("openMessageFromDetail.do")
	public ModelAndView openMessagePopupController(MessageVO vo,ModelAndView mav) {
		mav.addObject("messageVO", vo);
		mav.setViewName("messagepopup");
		return mav;
	}
	@RequestMapping("insertMessageFromDetail.do")
	public ModelAndView insertMessageForDetailController(MessageVO vo,ModelAndView mav) {
		messageService.insertMessage(vo);
		mav.addObject("messageVO", null);
		mav.setViewName("messagepopup");
		return mav;
	}
	@RequestMapping("declaration.do")
	public ModelAndView goToHostBlame(BlameVO vo,ModelAndView mav) {
		mav.addObject("blameVO",vo);
		mav.setViewName("declarationpopup");
		return mav;
	}
	@RequestMapping("insertBlameHost.do")
	public String insertHostBlame(BlameVO vo,ModelAndView mav) {
		reservationService.insertBlameHost(vo);
		return "redirect:declaration.do";
	}
}
