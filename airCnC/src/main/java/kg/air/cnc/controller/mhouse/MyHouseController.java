package kg.air.cnc.controller.mhouse;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kg.air.cnc.service.mhouse.MyHouseService;
import kg.air.cnc.vo.HouseReservationMemberVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import kg.air.cnc.vo.ReservationVO;

@Controller
public class MyHouseController {
	
	@Autowired
	MyHouseService myHouseService;
	
	@RequestMapping("myHouse.do")
	public String hostHouseList() {
		return "hostHouseList";
	}
	@RequestMapping(value = "myHouseList.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String myHouseListController(HttpSession session) throws JsonProcessingException {
		session.setAttribute("login_session", "host");//로그인 완료 시 제거
		String id = (String)session.getAttribute("login_session");
		List<ReservationHouseDetailVO> list = myHouseService.getHostHouseList(id);
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(list);
		System.out.println(jsonStr);
		return jsonStr;
	}
	@RequestMapping("myHouseResList.do")
	public ModelAndView myHouseResListController(ReservationHouseDetailVO vo,ModelAndView mav) {
		List<HouseReservationMemberVO> list = myHouseService.getHouseResList(vo);
		mav.addObject("resList",list);
		mav.addObject("house_seq",vo.getHouse_seq());
		mav.setViewName("houseResList");
		return mav;
	}
}
