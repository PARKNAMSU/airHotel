package kg.air.cnc.customer.controller;

import java.util.Random;
import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.sun.mail.handlers.message_rfc822;
import kg.air.cnc.customer.service.CustomerService;
import kg.air.cnc.customer.vo.CustomerVO;

@Controller
public class CustomerController {

	@Inject
	CustomerService service;

	@Inject
	BCryptPasswordEncoder passwordEncoder;
	
	@Inject
	JavaMailSender javaMailSender;
	
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
	
//	@RequestMapping(value = "/emailSend.do", method = RequestMethod.POST)
//	public ModelAndView mailSending(HttpServletRequest request, String customerEmail, HttpServletResponse response)throws Exception{
//		String key = new TempKey().generateKey(6);
//		String setfrom = "dlgkstjq623@gamil.com";
//        String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
//        String title = "회원가입 인증 이메일 입니다."; // 제목
//        String content =
//	        System.getProperty("line.separator")+System.getProperty("line.separator")+
//	        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"+System.getProperty("line.separator")+
//	        System.getProperty("line.separator")+" 인증번호는 " + key + " 입니다. "+
//	        System.getProperty("line.separator")+ System.getProperty("line.separator")+
//	        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
//        try {
//			MimeMessage message = javaMailSender.createMimeMessage();
//			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
//			messageHelper.setFrom(setfrom);
//			messageHelper.setTo(tomail);
//			messageHelper.setSubject(title);
//			messageHelper.setText(content);
//			javaMailSender.send(message);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	
	
	
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
