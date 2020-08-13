package kg.air.cnc.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kg.air.cnc.service.admin.AdminService;
import kg.air.cnc.vo.AdminVO;

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
				if(adminVO.getAdmin_login_status() == 0) {
					adminService.updateLoginStatus(adminId);
					session.setAttribute("admin_session",adminId);
					returnURL = "redirect:salesChart.mdo";
				}else {
					returnURL = "adminLogin";
				}
			}
			return returnURL;
		}
	}

	@RequestMapping(value = "/logout.mdo", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest requset, HttpServletResponse response)throws Exception{
		Object obj = session.getAttribute("admin_session");
		System.out.println(obj);
		if (obj != null) {
			adminService.updateLogoutStatus((String)obj);
			session.invalidate();
		}
		return "adminLogin";
	}
	@RequestMapping("resetLogin.mdo")
	public void resetLogin(HttpSession session) {
		Object obj = session.getAttribute("admin_session");
		adminService.updateLogoutStatus((String)obj);
	}
}