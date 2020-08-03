package kg.air.cnc.controller.reservation;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.service.reservation.ReservationService;
import kg.air.cnc.vo.HouseVO;

@Controller
public class MyReservationController {
	
	@Autowired
	ReservationService reservationService;
	
	@RequestMapping("reservationPage.do")
	public String reservationPageController() {
		return "myreservation";
	}
	@RequestMapping(value = "myReservation.mdo", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myReservationController(HttpSession session) throws JsonProcessingException {
		session.setAttribute("login_session", "skatn");
		String id = (String)session.getAttribute("login_session");
		List<HouseVO> list = reservationService.getMyReservation(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println(jsonStr);
		return jsonStr;
	}
	@RequestMapping(value = "myReservationBefore.mdo",produces = "application/text; charset=utf8")
	@ResponseBody
	public String myReservationBeforeController(HttpSession session) throws JsonProcessingException {
		String id = (String)session.getAttribute("login_session");
		List<HouseVO> list = reservationService.getMyReservationBefore(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println(jsonStr);
		return jsonStr;
	}
}
