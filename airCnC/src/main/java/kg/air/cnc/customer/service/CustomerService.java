package kg.air.cnc.customer.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kg.air.cnc.customer.vo.CustomerVO;

public interface CustomerService {
	
	// 회원가입.
	public int register(CustomerVO vo) throws Exception;
	
	// 아이디 중복 여부 검사.
	public int idCheck(CustomerVO vo) throws Exception;
	
	// 로그인.
	public int login(CustomerVO vo, HttpSession session, String rememberId, HttpServletResponse response)throws Exception;
}


