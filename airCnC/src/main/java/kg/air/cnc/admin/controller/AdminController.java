package kg.air.cnc.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kg.air.cnc.admin.service.AdminService;
import kg.air.cnc.admin.vo.AdminVO;

@Controller
public class AdminController {

	@Inject
	AdminService adminService;

	@RequestMapping(value = "/adminLoginView.mdo", method = RequestMethod.GET)
	public String adminLoginView() {
		return "adminLogin";
	}

	@RequestMapping(value = "/adminLogin.mdo", method = RequestMethod.POST)
	public String adminLogin(HttpSession session, AdminVO vo, HttpServletResponse response, Model model)throws Exception {
		String returnURL = "";
		if (session.getAttribute("admin_session") != null) {
			session.removeAttribute("admin_session"); // login이란 세션값이 존재하면, 기존의 세션을 지움.
		}
		String adminId = vo.getAdmin_id();
		String adminPw = vo.getAdmin_password();
		AdminVO adminVO = adminService.loginCheck(adminId);
		if (adminVO == null) {
			adminVO = new AdminVO();
			adminVO.setAdmin_id("");
			adminVO.setAdmin_password("");
		}

		if (!adminId.equals(adminVO.getAdmin_id()) || !adminPw.equals(adminVO.getAdmin_password())){
			model.addAttribute("msg","fail");
			return "adminLogin";
		}else {
			if (adminVO != null) { // 로그인 성공.
				session.setAttribute("admin_session", vo);
				returnURL = "redirect:salesChart.mdo";
			}
			return returnURL;
		}
	}

	@RequestMapping(value = "/logout.mdo", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest requset, HttpServletResponse response)throws Exception{
		Object obj = session.getAttribute("admin_session");
		if (obj != null) {
			session.invalidate();
		}
		return "adminLogin";
	}
}