package kg.air.cnc.controller.cupon;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
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
		System.out.println(id);
		if(id==null || id.equals("") || id.equals("null")) {
			System.out.println("여기");
			mav.setViewName("login");
		}
		else {
			System.out.println("여기까지");
			mav.addObject("cuponList", cuponService.getCuponList(id));
			mav.setViewName("cuponList");
		}
		return mav;
	}
	
}
