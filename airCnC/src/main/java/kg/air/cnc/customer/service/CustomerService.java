package kg.air.cnc.customer.service;

import kg.air.cnc.customer.vo.CustomerVO;
import kg.air.cnc.vo.login.AuthInfo;
import kg.air.cnc.vo.login.LoginCommand;

public interface CustomerService {
	
	// 회원가입.
	public int register(CustomerVO vo) throws Exception;
	
	// 아이디 중복 여부 검사.
	public int idCheck(CustomerVO vo) throws Exception;
	
	// 이메일 중복 여부 검사.
	public int createEmailCheck(String customerEmail) throws Exception;
	
	// 로그인.
	public AuthInfo loginAuth(LoginCommand loginCommand) throws Exception;
}


