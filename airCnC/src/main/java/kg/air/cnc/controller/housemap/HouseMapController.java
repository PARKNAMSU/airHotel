package kg.air.cnc.controller.housemap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.housemap.HouseMapServiceImpl;
import kg.air.cnc.vo.HouseVO;

@Controller
public class HouseMapController {
	@Autowired
	private HouseMapServiceImpl houseMapService;
	
	// getHouseList �� �� api�����ؼ� ��ǥ ����ִ°� , ���� �� ������ �Ѿ�°�
	// getHouse �� �� api ��������
	
	@RequestMapping(value="/getHouseList.do")
	public ModelAndView getHouseList(ModelAndView mav) {
		mav.addObject("houseList",houseMapService.getHouseList());
		mav.setViewName("getHouseList");
		return mav;
	}
	
	@RequestMapping(value="/getHouse.do")
	public ModelAndView getHouse(HouseVO vo, ModelAndView mav) {
		mav.addObject("house",houseMapService.getHouse(vo));
		mav.setViewName("getHouse");
		return mav;
	}
	
}
