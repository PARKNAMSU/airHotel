package kg.air.cnc.controller.waiting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.reservation.ReservationService;
import kg.air.cnc.service.waiting.RegisterWaitingServiceImpl;
import kg.air.cnc.service.waiting.RemoveWaitingServiceImpl;
import kg.air.cnc.vo.House_InfoVO;
import kg.air.cnc.vo.PagingVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

@Controller
public class WaitingController {

	@Autowired
	RegisterWaitingServiceImpl registerWaiting;
	@Autowired
	RemoveWaitingServiceImpl removeWaiting;
	@Autowired
	ReservationService reservationService;

	// 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占� 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/getRegisterWaitingList.mdo")
	public ModelAndView getHouseWaitingList(ModelAndView mav, PagingVO vo, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = registerWaiting.waitingCnt();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "4";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "4";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mav.addObject("paging",vo);
		mav.addObject("waitingList", registerWaiting.getWaitingList(vo));
		mav.setViewName("getRegisterHouseList"); // 占쏙옙占쌩울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占식울옙 占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙占쏙옙
		return mav;
	}

	// 占쏙옙占쏙옙 占쏙옙占� 占쏙옙 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/getRegisterHouse.mdo")
	public ModelAndView getRegisterHouse(ReservationHouseDetailVO vo, ModelAndView mav) {
		ReservationHouseDetailVO house = null;
		System.out.println(vo.getHouse_seq());
		house = reservationService.getReservationHouse(vo);
		System.out.println(house.toString());
		mav.addObject("house", house);
		//mav.addObject("registerHouse", registerWaiting.getHouse(vo));
		mav.setViewName("waiting"); // 占쏙옙占쌩울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占식울옙 占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙占쏙옙
		return mav;
	}
	
	// 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占� 확占쏙옙
	@RequestMapping(value = "/registerHouse.mdo")
	public ModelAndView registerHouse(House_InfoVO vo, ModelAndView mav) {
		registerWaiting.registerHouse(vo);
		mav.setViewName("redirect:getRegisterWaitingList.mdo");
		return mav;
	}
	
	// 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占� 占쏙옙占�
	@RequestMapping(value="/cancelRegister.mdo")
	public ModelAndView cancelRegister(House_InfoVO vo, ModelAndView mav) {
		registerWaiting.cancelRegister(vo);
		mav.setViewName("redirect:getRegisterWaitingList.mdo");
		return mav;
	}
	
	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/getRemoveWaitingList.mdo")
	public ModelAndView getRemoveWaitingList(PagingVO vo, ModelAndView mav, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		int total = removeWaiting.waitingCnt();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "4";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "4";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		mav.addObject("paging",vo);
		mav.addObject("waitingList", removeWaiting.getWaitingList(vo));
		mav.setViewName("getRemoveHouseList"); // 占쏙옙占쌩울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占식울옙 占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙占쏙옙
		return mav;
	}

	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙
	@RequestMapping(value = "/getRemoveHouse.mdo")
	public ModelAndView getRemoveHouse(ReservationHouseDetailVO vo, ModelAndView mav) {
		ReservationHouseDetailVO house = null;
		house = reservationService.getReservationHouse(vo);
		//mav.addObject("removeHouse", removeWaiting.getHouse(vo));
		System.out.println(house.toString());
		mav.addObject("house", house);
		mav.setViewName("removeWaiting"); // 占쏙옙占쌩울옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占식울옙 占쏙옙占쏙옙 占쏙옙 占쏙옙 占쏙옙占쏙옙
		return mav;
	}
	
	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占�(占쏙옙占쏙옙)
	@RequestMapping(value = "/updateDate.mdo")
	public ModelAndView updateDate(House_InfoVO vo, ModelAndView mav) {
		removeWaiting.updateDate(vo);
		mav.setViewName("redirect:getRemoveWaitingList.mdo");
		return mav;
	}
	
	// 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙(占쏙옙占쏙옙 占쌀곤옙)
	@RequestMapping(value = "/cancelRemove.mdo")
	public ModelAndView cancelRemove(House_InfoVO vo, ModelAndView mav) {
		removeWaiting.cancelRemove(vo);
		mav.setViewName("redirect:getRemoveWaitingList.mdo");
		return mav;
	}
	
	//spring quartz占쏙옙 占싱울옙占쏙옙 占쏙옙占쏙옙 占쌨쇽옙占쏙옙
	
}