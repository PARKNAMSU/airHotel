package kg.air.cnc.controller.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.service.reservation.ReservationService;
import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

@Controller
public class MyReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping("reservationPage.do")
	public String reservationPageController(HttpSession session) {
		return "myreservation";
	}
	@RequestMapping(value = "myReservation.mdo", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myReservationController(HttpSession session) throws JsonProcessingException {
		//로그인 완료 시 제거
		String id = String.valueOf(session.getAttribute("login_session"));
		List<ReservationHouseDetailVO> list = reservationService.getMyReservation(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	@RequestMapping(value = "myReservationBefore.mdo",produces = "application/text; charset=utf8")
	@ResponseBody
	public String myReservationBeforeController(HttpSession session) throws JsonProcessingException {
		String id = (String)session.getAttribute("login_session");
		List<ReservationHouseDetailVO> list = reservationService.getMyReservationBefore(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		return jsonStr;
	}
	@RequestMapping("rollbackReservationCancel.do")
	public String rollbackReservationCancelController(ReservationHouseDetailVO vo) {
		reservationService.rollbackReservationCancel(vo);
		return "redirect:reservationPage.do";
	}
	@RequestMapping("myFavoriteHouse.do")
	public ModelAndView myFavoriteHouseController(HttpSession session,ModelAndView mav){	
		mav.addObject("favoriteList",reservationService.getMyFavoriteHouse((String)session.getAttribute("login_session")));
		mav.setViewName("myFavoriteHouse");
		return mav;
	}
}
