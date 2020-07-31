package kg.air.cnc.controller.waiting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.waiting.RegisterWaitingServiceImpl;
import kg.air.cnc.service.waiting.RemoveWaitingServiceImpl;

@Controller
public class WaitingController {

	@Autowired
	RegisterWaitingServiceImpl registerWaiting;
	@Autowired
	RemoveWaitingServiceImpl removeWaiting;

	// ���� ��� ��� ������
	@RequestMapping(value = "/getRegisterWaitingList.mdo")
	public ModelAndView getHouseWaitingList(ModelAndView mav) {
		mav.addObject("waitingList", registerWaiting.getWaitingList());
		mav.setViewName("getRegisterHouseList"); // ���߿� ������ ���� �Ŀ� ���� �� �� ����
		return mav;
	}

	// ���� ��� �� ������
	@RequestMapping(value = "/getRegisterHouse.mdo")
	public ModelAndView getRegisterHouse(HouseVO vo, ModelAndView mav) {
		mav.addObject("registerHouse", registerWaiting.getHouse(vo));
		mav.setViewName("waiting"); // ���߿� ������ ���� �Ŀ� ���� �� �� ����
		return mav;
	}
	
	// ���� ��� ��� Ȯ��
	@RequestMapping(value = "/registerHouse.mdo")
	public ModelAndView registerHouse(HouseVO vo, ModelAndView mav) {
		registerWaiting.registerHouse(vo);
		mav.setViewName("redirect:getRegisterWaitingList.mdo");
		return mav;
	}
	
	// ���� ��� ��� ���
	@RequestMapping(value="/cancelRegister.mdo")
	public ModelAndView cancelRegister(HouseVO vo, ModelAndView mav) {
		registerWaiting.cancelRegister(vo);
		mav.setViewName("redirect:getRegisterWaitingList.mdo");
		return mav;
	}
	
	// ���� ���� ��� ������
	@RequestMapping(value = "/getRemoveWaitingList.mdo")
	public ModelAndView getRemoveWaitingList(ModelAndView mav) {
		mav.addObject("waitingList", removeWaiting.getWaitingList());
		mav.setViewName("getRemoveHouseList"); // ���߿� ������ ���� �Ŀ� ���� �� �� ����
		return mav;
	}

	// ���� ���� �� ������
	@RequestMapping(value = "/getRemoveHouse.mdo")
	public ModelAndView getRemoveHouse(HouseVO vo, ModelAndView mav) {
		mav.addObject("removeHouse", removeWaiting.getHouse(vo));
		mav.setViewName("removeWaiting"); // ���߿� ������ ���� �Ŀ� ���� �� �� ����
		return mav;
	}
	
	// ���� ���� ���(����)
	@RequestMapping(value = "/updateDate.mdo")
	public ModelAndView updateDate(HouseVO vo, ModelAndView mav) {
		removeWaiting.updateDate(vo);
		mav.setViewName("redirect:getRemoveWaitingList.mdo");
		return mav;
	}
	
	// ���� ���� ����(���� �Ұ�)
	@RequestMapping(value = "/cancelRemove.mdo")
	public ModelAndView cancelRemove(HouseVO vo, ModelAndView mav) {
		removeWaiting.cancelRemove(vo);
		mav.setViewName("redirect:getRemoveWaitingList.mdo");
		return mav;
	}
	
	//spring quartz�� �̿��� ���� �޼���
	
}