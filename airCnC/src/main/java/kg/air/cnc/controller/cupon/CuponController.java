package kg.air.cnc.controller.cupon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.cupon.CuponServiceImpl;

@Controller
public class CuponController {
	
	@Autowired
	private CuponServiceImpl cuponService;
	
	//@RequestMapping(value="makeCupon.do")
	public ModelAndView makeCupon(HttpSession session, ModelAndView mav) {
		//cuponService.makeCupon(session);
		return mav;
	}
	
	@RequestMapping(value="getCuponList.do")
	public ModelAndView getCuponList(HttpSession session, ModelAndView mav) {
		String id = (String)session.getAttribute("login_session");
		if(id==null || id.equals("") || id.equals("null")) {
			mav.setViewName("login");
		}
		else {
			mav.addObject("cuponList", cuponService.getCuponList(id));
			mav.setViewName("cuponList");
		}
		return mav;
	}
	
	@RequestMapping(value="checkNumber")
	public ModelAndView checkNumber(String cuponNumber, ModelAndView mav) {
		System.out.println(cuponNumber);
		mav.addObject("cupon", cuponService.checkNumber(cuponNumber));
		return mav;
	}
	
}
