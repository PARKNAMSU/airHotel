package kg.air.cnc.customer.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kg.air.cnc.customer.service.CustomerService;
import kg.air.cnc.customer.vo.CustomerVO;
import kg.air.cnc.service.mail.MailService;

@Controller
public class CustomerController {

	@Inject
	CustomerService service;

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	@Inject
	JavaMailSender javaMailSender;

	@Autowired
	private MailService mailService;

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

	// 아이디 중복 여부 검사.
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(CustomerVO vo)throws Exception{
		int result = service.idCheck(vo);
		String result1 = String.valueOf(result);
		return result1;
	}

	@RequestMapping(value = "/createEmailCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean createEmailCheck(@RequestParam String customerEmail, HttpServletRequest request)throws Exception {
		int cnt = -1;
		cnt = service.createEmailCheck(customerEmail); // 이메일 중복 체크.

		// 이메일 인증.
		char[] keySet = new char[] { 
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
				'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
				'U', 'V', 'W', 'X', 'Y', 'Z',
				'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
				'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
				'u', 'v', 'w', 'x', 'y', 'z'};
		StringBuffer sb = new StringBuffer();
		for (int i = 0 ; i < 6 ; i++) {
			int idx = (int) (keySet.length * Math.random()); // 62 * 생성된 난수를 Int로 추출 (소숫점제거)
			sb.append(keySet[idx]);
		}
		HttpSession session = request.getSession(true);
		String authCode = String.valueOf(sb); // 랜덤 인증 코드.
		session.setAttribute("authCode", authCode);
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		String text = "귀하의 인증 코드는 " + authCode + " 입니다.";
		if(cnt <= 0) {
			mailService.send(subject, text, "ljh160791@gmail.com", customerEmail);
			return true;
		}
		else {
			return false;
		}
	}

	@RequestMapping(value = "/emailAuth.do", method = RequestMethod.POST)
	public String emailAuth(@RequestParam String customerKey, HttpSession session)throws Exception{
		String authCode = (String)session.getAttribute("authCode"); // 랜덤 생성한 인증번호.
		if (authCode.equals(customerKey)) {
			return "complate";
		}else {
			return "false";
		}
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

	// 로그인 확인.
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int loginCheck(CustomerVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{

		// 아이디 기억하기 값 가져오기.
		String rememberId = request.getParameter("rememberId"); 

		// 비밀번호 암호화.
		String loginPass = vo.getCustomerPassword();
		String loginPwd = passwordEncoder.encode(loginPass);
		vo.setCustomerPassword(loginPwd);

		// 암호화 확인
		System.out.println("암호화 된 비밀번호 : " + vo.getCustomerPassword());

		// 로그인 메서드.
		int result = service.login(vo, session, rememberId, response);
		return result;
	}
}
