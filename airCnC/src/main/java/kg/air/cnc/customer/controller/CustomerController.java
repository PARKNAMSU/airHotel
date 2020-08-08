package kg.air.cnc.customer.controller;

import java.util.Date;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;
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

	@Inject
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
	public String loginView()throws Exception{
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
	public boolean createEmailCheck(@RequestParam String customer_email, HttpServletRequest request)throws Exception {
		int cnt = -1;
		cnt = service.createEmailCheck(customer_email); // 이메일 중복 체크.
		System.out.println(cnt); // 1이면 중복 이메일 있음. 0이면 중복 없음.

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
//		if(cnt == 0) {
			mailService.send(subject, text, "ljh160791@gmail.com", customer_email);
			return true;
//		}
//		else {
//			return false;
//		}
	}

	@RequestMapping(value = "/emailAuth.do", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuth(@RequestParam String customer_key, HttpSession session)throws Exception{
		String authCode = (String)session.getAttribute("authCode"); // 랜덤 생성한 인증번호.
		System.out.println("랜덤으로 생성된 인증코드 : " + authCode); // 랜덤 생성한 인증번호.
		System.out.println("사용자가 입력한 인증코드 : " + customer_key); // 사용자가 입력한 인증번호.
		if (authCode.equals(customer_key)) {
			return "complate";
		}else {
			return "false";
		}
	}

	// 회원가입 컨트롤러.
	@RequestMapping(value = "/registerCheck.do", method = RequestMethod.POST)
	public String regist(CustomerVO vo)throws Exception{
		// 회원가입 시 프로필 사진을 등록안했을때 none처리.
		if (vo.getCustomer_image().equals("")) {
			vo.setCustomer_image("none");
		}
		int result = service.idCheck(vo);
		try {
			if (result == 1) {
				return "SignUp"; 
			}else if (result == 0) {
				String inputPass = vo.getCustomer_password();
				String pwd = passwordEncoder.encode(inputPass);
				vo.setCustomer_password(pwd);
				vo.setCustomer_key("Y");
				service.register(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";
	}

	// 로그인 처리
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public String loginProcess(HttpSession session, CustomerVO customerVO, HttpServletResponse response)throws Exception{

		String returnURL = "";
		if (session.getAttribute("login_session") != null) {
			session.removeAttribute("login_session"); // login이란 세션값이 존재하면, 기존의 세션을 지움.
		}
			
		String inputId = customerVO.getCustomer_id();
		
		// DB에서 아이디 및 비밀번호를 가져온다.
		CustomerVO customerDbVO = service.customerCheck(inputId);
		String dbPassword = customerDbVO.getCustomer_password();
		String inputPassword = customerVO.getCustomer_password();
		
		// 인증 진행.
		if (!passwordEncoder.matches(inputPassword, dbPassword)) {
			System.out.println("비밀번호가 일치하지 않습니다.");
			return "login";
		}else {
			boolean passwordResult = passwordEncoder.matches(inputPassword, dbPassword);
			System.out.println("비밀번호 일치 결과 : " + passwordResult);
			// 로그인이 성공하면 CustomerVO객체를 반환.
			CustomerVO vo = service.login(customerVO);
			if (vo != null) { // 로그인 성공.
				session.setAttribute("login_session", vo);
				returnURL = "index";
				if (customerVO.isUseCookie()) {
					Cookie cookie = new Cookie("loginCookie", session.getId());
					cookie.setPath("/");
					int amount = 60 * 60 * 24 * 7;
					cookie.setMaxAge(amount);
					response.addCookie(cookie);
					Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
					service.keepLogin(vo.getCustomer_id(), session.getId(), sessionLimit);
				}
			}else {
				returnURL = "login";
			}
			return returnURL;
		}
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
		
		Object obj = session.getAttribute("login_session");
		if (obj != null) {
			CustomerVO vo = (CustomerVO)obj;
			session.removeAttribute("login_session");
			session.invalidate();
			Cookie loginCookie  = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				Date date = new Date(System.currentTimeMillis());
				service.keepLogin(vo.getCustomer_id(), session.getId(), date);
			}
		}
		return "index";
	}
}
