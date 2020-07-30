package kg.air.cnc.customer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kg.air.cnc.customer.service.CustomerService;
import kg.air.cnc.customer.vo.CustomerVO;

@Controller
public class CustomerController {

	@Inject
	CustomerService service;

	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/indexView.do", method = RequestMethod.GET)
	public String indexView() {
		return "index";
	}

	@RequestMapping(value = "/registerView.do", method = RequestMethod.GET)
	public String registerView() throws Exception{
		return "SignUp";
	}

	@RequestMapping(value = "/loginView.do", method = RequestMethod.GET)
	public String loginView() throws Exception{
		return "login";
	}

	// 회원가입 컨트롤러.
	@RequestMapping(value = "/registerCheck.do", method = RequestMethod.POST)
	public String regist(CustomerVO vo)throws Exception{
		// 회원가입 시 프로필 사진을 등록안했을때 none처리.
		if (vo.getCustomerImage().equals("")) {
			vo.setCustomerImage("none");
		}
		int result = service.idCheck(vo);
		try {
			if (result == 1) {
				return "SignUp"; 
			}else if (result == 0) {
				String inputPass = vo.getCustomerPassword();
				String pwd = passwordEncoder.encode(inputPass);
				vo.setCustomerPassword(pwd);
				service.register(vo);
			}
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "login";
	}

	// 아이디 중복 여부 검사.
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(CustomerVO vo)throws Exception{
		int result = service.idCheck(vo);
		String result1 = String.valueOf(result);
		return result1;
	}
	
//	// 로그인 확인.
//	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
//	@ResponseBody
//	public int loginCheck(CustomerVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
//		
//		// 아이디 기억하기 값 가져오기.
//		String rememberId = request.getParameter("rememberId"); 
//		
//		// 비밀번호 암호화.
//		String loginPass = vo.getCustomerPassword();
//		String loginPwd = passwordEncoder.encode(loginPass);
//		vo.setCustomerPassword(loginPwd);
//		
//		// 암호화 확인
//		System.out.println("암호화 된 비밀번호 : " + vo.getCustomerPassword());
//		
//		// 로그인 메서드.
//		
//	}
}
