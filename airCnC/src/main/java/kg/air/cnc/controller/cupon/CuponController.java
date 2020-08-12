package kg.air.cnc.controller.cupon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.cupon.CuponServiceImpl;

public class CuponController {
	
	//@Autowired
	private CuponServiceImpl cuponService;
	
	//@RequestMapping(value="makeCupon.do")
	public ModelAndView makeCupon(HttpSession session, ModelAndView mav) {
		cuponService.makeCupon(session);
		return mav;
	}
	
	//@RequestMapping(value="getCuponList.do")
	public ModelAndView getCuponList(ModelAndView mav, HttpSession session) {
		mav.addObject("cuponList", cuponService.getCuponList());
		return mav;
	}
	
}
