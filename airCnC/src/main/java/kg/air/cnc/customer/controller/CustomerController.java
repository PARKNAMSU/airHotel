package kg.air.cnc.customer.controller;

import java.io.IOException;
import java.util.Date;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;
import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import kg.air.cnc.common.KakaoController;
import kg.air.cnc.common.NaverController;
import kg.air.cnc.customer.service.CustomerService;
import kg.air.cnc.customer.vo.CustomerVO;
import kg.air.cnc.service.mail.MailService;

@Controller
public class CustomerController {

	private NaverController naverController;
	private KakaoController kakaoController;
	private String apiResult = null;
	
	@Autowired
	public void setNaverController(NaverController naverController) {
		this.naverController = naverController;
	}
	
//	@Autowired
//	public void setKakaoController(KakaoController kakaoController) {
//		this.kakaoController = kakaoController;
//	}
	
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

	@RequestMapping(value = "/loginView.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loginView(ModelAndView mav, HttpSession session)throws Exception{
		String naverUrl = naverController.getAuthorizationUrl(session);
		String kakaoUrl = kakaoController.getAuthorizationUrl(session);
		mav.addObject("naverUrl", naverUrl);
		mav.addObject("kakaoUrl", kakaoUrl);
		mav.setViewName("login");
		return mav;
	}
	
	// 비밀번호 찾기.
	@RequestMapping(value = "/forgotPasswordView.do", method = RequestMethod.GET)
	public String forgotPasswordView()throws Exception{
		return "forgotpassword";
	}
	
	// 비밀번호 찾기 이메일 전송.
	@RequestMapping(value = "/findPassword.do", method = RequestMethod.POST)
	@ResponseBody
	public int findPassword(@RequestParam String customer_email, CustomerVO vo, HttpServletRequest request)throws Exception{
		// 0 : 회원가입하지 않은 이메일, 1 : 회원가입이 되어 있는 이메일.
		int resultCnt = 0;
		resultCnt = service.createEmailCheck(customer_email); // 이메일 존재 유무 체크. 
		if (resultCnt == 0) { // 회원가입한 이메일이 아닌 경우. 이메일이 DB에 존재하지 않을 때.
			return 0;
		}else if(resultCnt == 1) { // 회원가입한 이메일 계정일 경우.
			char[] keySet = new char[] { 
					'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
					'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
					'U', 'V', 'W', 'X', 'Y', 'Z',
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
					'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't',
					'u', 'v', 'w', 'x', 'y', 'z'};
			StringBuffer sb = new StringBuffer();
			for (int i = 0 ; i < 11 ; i++) {
				int idx = (int) (keySet.length * Math.random()); // 62 * 생성된 난수를 Int로 추출 (소숫점제거)
				sb.append(keySet[idx]);
			}
			HttpSession session = request.getSession(true);
			String newPassword = String.valueOf(sb); // 랜덤 인증 코드.
			session.setAttribute("newPassword", newPassword);
			String subject = "[AirCnC] 임시 비밀번호 발급 안내.";
			String text = "<div align = 'left'>";
			text += "<h3>임시 비밀번호입니다. 로그인 후 비밀번호를 변경하여 사용하세요.</h3>";
			text += "<h2>임시 비밀번호 : " + newPassword + "</h2>";
			// if(cnt == 0) {
			mailService.send(subject, text, "ljh160791@gmail.com", customer_email);
			vo.setCustomer_password(newPassword);
//			int changePwResult = service.changePassword(vo.getCustomer_password(),customer_email);
			return 1;
			//	}
			//	else {
			//		return false;
			//	}
		} else {
			return -1;
		}
	}

	// 아이디 중복 여부 검사.
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(CustomerVO vo)throws Exception{
		int result = service.idCheck(vo);
		String result1 = String.valueOf(result);
		return result1;
	}

	@RequestMapping(value = "/kakaologin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView kakaoLogin(@RequestParam("code")String code, HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception {
		ModelAndView mav = new ModelAndView();
		// 결과값을 node에 보여줌.
		JsonNode node = kakaoController.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음.
		JsonNode accessToken = node.get("access_token");
		// 사용자의 정보.
		JsonNode userInfo = kakaoController.getKakaoUserInfo(accessToken);
		String kemail = null;
		// 사용자 정보를 카카오에서 가져오기.
		// JsonNode properties = userInfo.path("properties");
		JsonNode kakaoAccount = userInfo.path("kakao_account");
		kemail = kakaoAccount.path("email").asText();
		session.setAttribute("login_session", kemail);
		mav.setViewName("index");
		return mav;
	}

	// 네이버 로그인 성공시 callback메서드 호출.
	@RequestMapping(value = "/naverlogin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session)throws IOException, ParseException{
		ModelAndView mav = new ModelAndView(); 
		OAuth2AccessToken oauthToken; 
		oauthToken = naverController.getAccessToken(session, code, state); 
		
		// 로그인한 사용자의 모든 정보가 JSON 타입으로 저장되어 있음.
		apiResult = naverController.getUserProfile(oauthToken); 
		
		// 내가 원하는 정보만 JSON타입에서 String타입으로 바꿔 가져오기.
		JSONParser parser = new JSONParser(); 
		Object obj = null; 
		try{
			obj = parser.parse(apiResult); 
		} catch (ParseException e) {
			e.printStackTrace(); 
		} 
		JSONObject jsonobj = (JSONObject) obj; 
		
		// 데이터 파싱.
		JSONObject response = (JSONObject) jsonobj.get("response"); 
		String naver_name = (String) response.get("name"); 
		String naver_email = (String) response.get("email");
		session.setAttribute("login_session", naver_email);
		mav.setViewName("index"); 
		return mav;
	}

	@RequestMapping(value = "/createEmailCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean createEmailCheck(@RequestParam(value = "customer_email" ,required = false)String customer_email, HttpServletRequest request)throws Exception {
		int cnt = -1;
		System.out.println(customer_email);
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
		String subject = "[AirCnC] 회원가입 인증 코드 발급 안내 입니다.";
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

	@RequestMapping(value = "/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
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

	@RequestMapping(value = "/kakaologout.do", produces = "application/json")
	public String kakaoLogout(HttpSession session)throws Exception{
		// KakaoRestApi 객체 선언.
		JsonNode jsonToken = kakaoController.Logout(session.getAttribute("userid").toString());
		return "index";
	}
}
