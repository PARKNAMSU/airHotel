package kg.air.cnc.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kg.air.cnc.admin.service.AdminService;
import kg.air.cnc.admin.vo.AdminVO;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@RequestMapping(value = "/adminLoginView.mdo", method = RequestMethod.GET)
	public String adminLoginView() {
		return "adminLogin";
	}
	
	@RequestMapping(value = "/adminLogin.mdo", method = RequestMethod.POST)
	public ModelAndView adminLogin(HttpSession session, AdminVO vo, ModelAndView mav)throws Exception {
		boolean result = adminService.loginCheck(vo, session);
		if (result) {
			mav.setViewName("adminMain");
			mav.addObject("admin_id", session.getAttribute("admin_id"));
			mav.addObject("message", "success");
		}else {
			mav.setViewName("redirect:adminLoginView.mdo");
			mav.addObject("message", "fail");
		}
		return mav;
	}
}