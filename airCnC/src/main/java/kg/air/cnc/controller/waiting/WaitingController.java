package kg.air.cnc.controller.waiting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.waiting.RegisterWaitingServiceImpl;
import kg.air.cnc.service.waiting.RemoveWaitingServiceImpl;
import kg.air.cnc.vo.HouseVO;

@Controller
public class WaitingController {

	@Autowired
	RegisterWaitingServiceImpl registerWaiting;
	@Autowired
	RemoveWaitingServiceImpl removeWaiting;

	// 숙소 등록 대기 페이지
	@RequestMapping(value = "/getRegisterWaitingList.mdo")
	public ModelAndView getHouseWaitingList(ModelAndView mav) {
		mav.addObject("waitingList", registerWaiting.getWaitingList());
		mav.setViewName("getRegisterHouseList"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}

	// 숙소 등록 상세 페이지
	@RequestMapping(value = "/getRegisterHouse.mdo")
	public ModelAndView getRegisterHouse(HouseVO vo, ModelAndView mav) {
		mav.addObject("registerHouse", registerWaiting.getHouse(vo));
		mav.setViewName("waiting"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}
	
	// 숙소 등록 대기 확인
	@RequestMapping(value = "/registerHouse.mdo")
	public ModelAndView registerHouse(HouseVO vo, ModelAndView mav) {
		registerWaiting.registerHouse(vo);
		mav.setViewName("redirect:getRegisterWaitingList.mdo");
		return mav;
	}
	
	// 숙소 등록 대기 취소
	@RequestMapping(value="/cancelRegister.mdo")
	public ModelAndView cancelRegister(HouseVO vo, ModelAndView mav) {
		registerWaiting.cancelRegister(vo);
		mav.setViewName("redirect:getRegisterWaitingList.mdo");
		return mav;
	}
	
	// 숙소 삭제 대기 페이지
	@RequestMapping(value = "/getRemoveWaitingList.mdo")
	public ModelAndView getRemoveWaitingList(ModelAndView mav) {
		mav.addObject("waitingList", removeWaiting.getWaitingList());
		mav.setViewName("getRemoveHouseList"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}

	// 숙소 삭제 상세 페이지
	@RequestMapping(value = "/getRemoveHouse.mdo")
	public ModelAndView getRemoveHouse(HouseVO vo, ModelAndView mav) {
		mav.addObject("removeHouse", removeWaiting.getHouse(vo));
		mav.setViewName("removeWaiting"); // 나중에 페이지 상의 후에 조정 할 수 있음
		return mav;
	}
	
	// 숙소 삭제 허락(삭제)
	@RequestMapping(value = "/updateDate.mdo")
	public ModelAndView updateDate(HouseVO vo, ModelAndView mav) {
		removeWaiting.updateDate(vo);
		mav.setViewName("redirect:getRemoveWaitingList.mdo");
		return mav;
	}
	
	// 숙소 삭제 불허(삭제 불가)
	@RequestMapping(value = "/cancelRemove.mdo")
	public ModelAndView cancelRemove(HouseVO vo, ModelAndView mav) {
		removeWaiting.cancelRemove(vo);
		mav.setViewName("redirect:getRemoveWaitingList.mdo");
		return mav;
	}
	
	//spring quartz를 이용한 실행 메서드
}