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
	
	// getHouseList 할 때 api연동해서 좌표 찍어주는것 , 지역 값 가지고 넘어가는것
	// getHouse 할 때 api 마찬가지
	
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
