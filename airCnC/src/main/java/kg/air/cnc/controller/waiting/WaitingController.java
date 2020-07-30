package kg.air.cnc.controller.waiting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.waiting.RegisterWaitingServiceImpl;
import kg.air.cnc.service.waiting.RemoveWaitingServiceImpl;
import kg.air.cnc.vo.HouseVO;

@Controller
public class WaitingController {

	@Autowired
	RegisterWaitingServiceImpl houseWaiting;
	@Autowired
	RemoveWaitingServiceImpl removeWaiting;

	// 숙소 등록 대기 페이지
	@RequestMapping(value = "/getRegisterWaitingList.mdo")
	public ModelAndView getHouseWaitingList(HouseVO vo, ModelAndView mav) {
		mav.addObject("houseWaitingList", houseWaiting.getWaitingList(vo));
		mav.setViewName("admin_register_waiting.jsp"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}

	// 숙소 삭제 대기 페이지
	@RequestMapping(value = "/getRemoveWaitingList.mdo")
	public ModelAndView getRemoveWaitingList(HouseVO vo, ModelAndView mav) {
		mav.addObject("houseWaitingList", houseWaiting.getWaitingList(vo));
		mav.setViewName("admin_remove_waiting.jsp"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}

	// 숙소 등록 상세 페이지
	@RequestMapping(value = "/getRegisterHouse.mdo")
	public ModelAndView getRegisterHouse(HouseVO vo, ModelAndView mav) {
		mav.addObject("houseWaitingList", houseWaiting.getHouse(vo));
		mav.setViewName("admin_remove_waiting.jsp"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}

	// 숙소 삭제 상세 페이지
	@RequestMapping(value = "/getRemoveHouse.mdo")
	public ModelAndView getRemoveHouse(HouseVO vo, ModelAndView mav) {
		mav.addObject("removeWaitingList", houseWaiting.getHouse(vo));
		mav.setViewName("admin_remove_waiting"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}
	
	// 숙소 등록 대기 확인
	@RequestMapping(value = "/registerHouse.mdo")
	public ModelAndView registerHouse(HouseVO vo, ModelAndView mav) {
		houseWaiting.registerHouse(vo);
		mav.setViewName("/getRegisterWaitingList.mdo");
		return mav;
	}
}