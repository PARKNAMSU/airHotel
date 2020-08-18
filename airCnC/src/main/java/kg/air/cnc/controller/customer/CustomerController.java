package kg.air.cnc.controller.customer;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.ui.Model;
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
import kg.air.cnc.service.customer.CustomerService;
import kg.air.cnc.service.mail.MailService;
import kg.air.cnc.service.message.MessageService;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.MessageVO;

@Controller
public class CustomerController {

	private NaverController naverController;
	private KakaoController kakaoController = new KakaoController();
	private String apiResult = null;

	@Autowired
	private void setNaverController(NaverController naverController) {
		this.naverController = naverController;
	}

	@Autowired
	MessageService messageService;

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
	
	@RequestMapping(value = "/mypage.do")
	public ModelAndView mypageView(HttpSession session, CustomerVO customerVO, ModelAndView mav)throws Exception{
		String sessionId = (String)session.getAttribute("login_session");
		customerVO = service.getCustomerInfo(sessionId);	
		mav.addObject("customerName", customerVO.getCustomer_name());
		mav.addObject("customerPhone", customerVO.getCustomer_phone());
		mav.addObject("customerEmail", customerVO.getCustomer_email());
		mav.addObject("customerImage", customerVO.getCustomer_image());
		mav.setViewName("mypage");
		return mav;
	}

	// 비밀번호 찾기.
	@RequestMapping(value = "/forgotPasswordView.do", method = RequestMethod.GET)
	public String forgotPasswordView()throws Exception{
		return "forgotpassword";
	}
	
	@RequestMapping(value = "/passwordChangeView.do", method = RequestMethod.GET)
	public String passwordChangeView()throws Exception{
		return "passwordChange";
	}
	
	@RequestMapping(value = "/customerWithdrawalView.do", method = RequestMethod.GET)
	public String customerWithdrawalView()throws Exception{
		return "customerWithdrawal";
	}

	// 비밀번호 찾기 이메일 전송.
	@RequestMapping(value = "/sendPassword.do",  method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView sendPassword(@RequestParam String customer_email, CustomerVO customerVO, HttpServletResponse response, ModelAndView mav)throws Exception{
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		int resultCnt = 0; // // 0 : 회원가입하지 않은 이메일, 1 : 회원가입이 되어 있는 이메일.
		resultCnt = service.createEmailCheck(customer_email); // 이메일 존재 유무 체크. 
		if (resultCnt == 0) { // 회원가입한 이메일이 아닌 경우. 이메일이 DB에 존재하지 않을 때.
			mav.addObject("sendMessage", "fail");
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
			String newPwd = String.valueOf(sb); // 임시 비밀번호.
			String subject = "[AirCnC] 임시 비밀번호 발급 안내.";
			String text = "회원님, 안녕하세요.\n";
			text += "임시 비밀번호입니다.\n로그인 후 반드시 비밀번호를 변경하여 사용하세요.\n";
			text += "임시 비밀번호 : " + newPwd;	
			mailService.send(subject, text, "ljh160791@gmail.com", customer_email);
			String newPassword = passwordEncoder.encode(newPwd); // 임시 비밀번호 암호화.
			customerVO.setCustomer_password(newPassword); // vo의 비밀번호에 임시 비밀번호로 세팅.
			service.changePassword(customerVO); // 비밀번호를 임시 비밀번호로 변경해놓기.
			System.out.println("비밀번호 변경 완료");
			mav.addObject("sendMessage", "success");
		} else {
			mav.addObject("sendMessage", "error");
		}
		mav.setViewName("forgotpassword");
		return mav;
	}

	// 아이디 중복 여부 검사.
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(CustomerVO vo)throws Exception{
		int result = service.idCheck(vo);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/kakaologin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView kakaoLogin(@RequestParam("code")String code, HttpSession session, CustomerVO vo, ModelAndView mav)throws Exception {
		// 결과값을 node에 보여줌.
		JsonNode node = kakaoController.getAccessToken(code);
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음.
		JsonNode accessToken = node.get("access_token");
		// 사용자 정보를 카카오에서 가져오기.
		JsonNode userInfo = kakaoController.getKakaoUserInfo(accessToken);
		JsonNode properties = userInfo.path("properties");
		JsonNode kakaoAccount = userInfo.path("kakao_account");
		String kid = userInfo.path("id").asText();
		String kemail = kakaoAccount.path("email").asText();
		String kname = properties.path("nickname").asText();
		String kimage = properties.path("profile_image").asText();
		
		// DB에 사용자 정보를 넣기 전 VO 세팅.
		vo.setCustomer_id(kemail);
		vo.setCustomer_password("none");
		vo.setCustomer_name(kname);
		if (kemail.substring(0, 3).trim().equals("010")) {
			vo.setCustomer_phone(kemail);
		}else {
			vo.setCustomer_phone("none");
		}
		vo.setCustomer_email(kid);
		vo.setCustomer_image(kimage);
		if (vo.getCustomer_image().equals("")) {
			vo.setCustomer_image("none");
		}
		vo.setCustomer_key("kakao");
		
		// 로그인 하기 전 id와 email이 DB에 있는지 확인. 있으면 1, 없으면 0이 리턴.
		int idCheckResult = service.idCheck(vo);
		int emailCheckResult = service.createEmailCheck(kid);
		
		if (idCheckResult == 1 && emailCheckResult == 1) {
			session.setAttribute("login_session", kemail);
			session.setAttribute("social_type", "kakao");
			mav.setViewName("index");
			return mav;
		}else {
			service.register(vo);
			session.setAttribute("login_session", kemail);
			session.setAttribute("social_type", "kakao");
			mav.setViewName("index");
			return mav;
		}
	}

	// 네이버 로그인 성공시 callback메서드 호출.
	@RequestMapping(value = "/naverlogin.do", produces = "application/json", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView naverLogin(@RequestParam String code, @RequestParam String state, HttpSession session, CustomerVO vo, ModelAndView mav)throws Exception, IOException, ParseException{
		OAuth2AccessToken oauthToken = naverController.getAccessToken(session, code, state);
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
		JSONObject jsonobj = (JSONObject)obj; 

		// 데이터 파싱.
		JSONObject response = (JSONObject) jsonobj.get("response"); 
		String naverId = (String) response.get("id");
		String naverName = (String) response.get("name"); 
		String naverEmail = (String) response.get("email");
		String naverProfileImage = (String) response.get("profile_image");
		
		// DB에 네이버 사용자 정보를 저장하기 위한 VO 세팅.
		vo.setCustomer_id(naverEmail);
		vo.setCustomer_password("none");
		vo.setCustomer_name(naverName);
		vo.setCustomer_email(naverId);
		vo.setCustomer_image(naverProfileImage);
		vo.setCustomer_phone("none");
		vo.setCustomer_key("naver");
		
		int idCheckResult = service.idCheck(vo);
		int emailCheckResult = service.createEmailCheck(naverId);
		
		if (idCheckResult == 1 && emailCheckResult == 1) {
			session.setAttribute("login_session", naverEmail);
			session.setAttribute("social_type", "naver");
			mav.setViewName("index"); 
			return mav;
		}else {
			service.register(vo);
			session.setAttribute("login_session", naverEmail);
			session.setAttribute("social_type", "naver");
			mav.setViewName("index"); 
			return mav;
		}
	}

	@RequestMapping(value = "/createEmailCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String createEmailCheck(@RequestParam(value = "customer_email" ,required = false)String customer_email, CustomerVO vo, HttpServletRequest request)throws Exception {
		int cnt = -1;
		cnt = service.createEmailCheck(customer_email); // 이메일 중복 체크.
		
		if (service.blacklistEmailCheck(vo) == 1) {
			return "blacklist";
		}else if(service.blacklistEmailCheck(vo) == 0){
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
			return "complate";
			//		}
			//		else {
			//			return false;
			//		}
		}else {
			return "fail";
		}
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
		MessageVO messageVO = new MessageVO();
		// 회원가입 시 프로필 사진을 등록안했을때 none처리.
		if (vo.getCustomer_image().equals("")) {
			vo.setCustomer_image("none");
		}
		int result = service.blacklistEmailCheck(vo);
		try {
			if (result == 1) {
				return "SignUp"; 
			}else if (result == 0) {
				String inputPass = vo.getCustomer_password();
				String pwd = passwordEncoder.encode(inputPass);
				vo.setCustomer_password(pwd);
				vo.setCustomer_key("Y"); 
				service.register(vo);
				messageVO.setMessage_from_id("admin");
				messageVO.setMessage_to_id(vo.getCustomer_id());
				messageVO.setMessage_type("nomal");
				messageVO.setMessage_content("회원가입을 축하합니다.");
				messageService.insertMessage(messageVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "login";
	}

	// 로그인 처리.
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public ModelAndView loginProcess(HttpSession session, CustomerVO customerVO, HttpServletResponse response, ModelAndView mav)throws Exception{

		String returnURL = "";
		if (session.getAttribute("login_session") != null) {
			session.removeAttribute("login_session"); // login이란 세션값이 존재하면, 기존의 세션을 지움.
		}

		String inputId = customerVO.getCustomer_id();

		// DB에서 아이디 및 비밀번호를 가져온다.
		CustomerVO customerDbVO = service.customerCheck(inputId);
		if (customerDbVO == null) {
			response.setContentType("text/html; charset=UTF-8");
			mav.addObject("sendMessage", "idFail");
			mav.setViewName("login");
		}else {
			String dbPassword = customerDbVO.getCustomer_password();
			String inputPassword = customerVO.getCustomer_password();

			// 인증 진행.
			if (!passwordEncoder.matches(inputPassword, dbPassword)) {
				response.setContentType("text/html; charset=UTF-8");
				mav.addObject("sendMessage", "pwFail");
				mav.setViewName("login");
			}else {
				boolean passwordResult = passwordEncoder.matches(inputPassword, dbPassword);
				System.out.println("비밀번호 일치 결과 : " + passwordResult);
				// 로그인이 성공하면 CustomerVO객체를 반환.
				CustomerVO vo = service.login(customerVO);
				if (vo != null) { // 로그인 성공.
					session.setAttribute("login_session", vo.getCustomer_id());
					mav.setViewName("index");
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
					mav.setViewName("login");
				}
			}
		}
		return mav;
	}
	
	@RequestMapping(value = "/customerInfoUpdate.do", method = RequestMethod.POST)
	public ModelAndView customerInfoUpdate(CustomerVO vo, ModelAndView mav, HttpSession session)throws Exception{
		String customer_email = vo.getCustomer_email();
		
		// 블랙리스트에 존재하는 이메일인지 확인.
		if (service.createEmailCheck(customer_email) == 1 && service.blacklistEmailCheck(vo) == 0) {
			if (vo.getCustomer_image().equals("") || vo.getCustomer_image().equals("none")) {
				vo.setCustomer_image("none");
			}
			int result = service.customerInfoUpdate(vo);
			if (result == 1) {
				String sessionId = (String)session.getAttribute("login_session");
				CustomerVO customerVO = new CustomerVO();
				customerVO = service.getCustomerInfo(sessionId);	
				mav.addObject("customerName", customerVO.getCustomer_name());
				mav.addObject("customerPhone", customerVO.getCustomer_phone());
				mav.addObject("customerEmail", customerVO.getCustomer_email());
				mav.addObject("customerImage", customerVO.getCustomer_image());
				mav.addObject("resultMessage", "회원 정보가 수정되었습니다.");
			}else {
				String sessionId = (String)session.getAttribute("login_session");
				CustomerVO customerVO = new CustomerVO();
				customerVO = service.getCustomerInfo(sessionId);	
				mav.addObject("customerName", customerVO.getCustomer_name());
				mav.addObject("customerPhone", customerVO.getCustomer_phone());
				mav.addObject("customerEmail", customerVO.getCustomer_email());
				mav.addObject("customerImage", customerVO.getCustomer_image());
				mav.addObject("resultMessage","회원 정보 수정에 실패하였습니다.");
			}
		}else {
			String sessionId = (String)session.getAttribute("login_session");
			CustomerVO customerVO = new CustomerVO();
			customerVO = service.getCustomerInfo(sessionId);	
			mav.addObject("customerName", customerVO.getCustomer_name());
			mav.addObject("customerPhone", customerVO.getCustomer_phone());
			mav.addObject("customerEmail", customerVO.getCustomer_email());
			mav.addObject("customerImage", customerVO.getCustomer_image());
			mav.addObject("resultMessage","사용할 수 없는 이메일입니다.");
		}
		mav.setViewName("mypage");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkPassword.do", method = RequestMethod.POST)
	public int checkPassword(String customer_password, HttpSession session)throws Exception{
		String customerId = (String)session.getAttribute("login_session");
		String dbPassword = service.passwordCheck(customerId);
		String inputPassword = customer_password;
		if (!passwordEncoder.matches(inputPassword, dbPassword)){
			return 0;
		}else {
			return 1;
		}
	}
		
	@RequestMapping(value = "/modifyPassword.do", method = RequestMethod.POST)
	public String modifyPassword(CustomerVO customerVO, HttpSession session)throws Exception{
		String newPassword = customerVO.getCustomer_password();
		String newPwd = passwordEncoder.encode(newPassword);
		customerVO.setCustomer_password(newPwd);
		customerVO.setCustomer_id((String)session.getAttribute("login_session"));
		service.modifyPassword(customerVO);
		return "passwordChange";
	}
	
	@RequestMapping(value = "/passwordCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int passwordCheck(CustomerVO customerVO, HttpSession session)throws Exception{
		String customerId = (String)session.getAttribute("login_session");
		String dbPassword = service.passwordCheck(customerId);
		String inputPassword = customerVO.getCustomer_password();
		if (!passwordEncoder.matches(inputPassword, dbPassword)){
			return 0;
		}else {
			return 1;
		}
	}
	
	@RequestMapping(value = "/customerWithdrawal.do", method = RequestMethod.POST)
	public String customerWithdrawal(CustomerVO vo, HttpSession session)throws Exception{
		String customerId = (String)session.getAttribute("login_session");
		service.customerWithdrawal(customerId);
		session.invalidate();
		return "index";
	}

	@RequestMapping(value = "/logout.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws Exception{
		Object object = (Object)session.getAttribute("login_session");
		String obj = String.valueOf(object);
		if (obj != null) {
			session.removeAttribute("login_session");
			session.invalidate();
			Cookie loginCookie  = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				Date date = new Date(System.currentTimeMillis());
				service.keepLogin(obj, session.getId(), date);
			}
		}
		return "index";
	}

	@RequestMapping(value = "/kakaologout.do", produces = "application/json")
	public String kakaoLogout(HttpSession session)throws Exception{
		JsonNode jsonToken = kakaoController.Logout(session.getAttribute("login_session").toString());
		session.invalidate();
		return "index";
	}	
}
