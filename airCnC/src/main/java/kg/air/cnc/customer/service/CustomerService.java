package kg.air.cnc.customer.service;

import java.util.Date;
import kg.air.cnc.customer.vo.CustomerVO;

public interface CustomerService {
	
	// 회원가입.
	public int register(CustomerVO vo) throws Exception;
	
	// 아이디 중복 여부 검사.
	public int idCheck(CustomerVO vo) throws Exception;
	
	// 이메일 중복 여부 검사.
	public int createEmailCheck(String customer_email) throws Exception;
	
	// 회원 체크.
	public CustomerVO customerCheck(String customer_id) throws Exception;
	
	// 로그인.
	public CustomerVO login(CustomerVO customerVO) throws Exception;
	
	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드.
	public void keepLogin(String customer_id, String session_id, Date session_limit)throws Exception;

	// 이전에 로그인한 적이 있는지, 유효시간이 넘지 않은 세션을 가지고 있는지 확인하는 메서드.
	public CustomerVO checkCustomerWithSessionKey(String session_id)throws Exception;
	
	// 비밀번호 변경.
	public int changePassword(CustomerVO customerVO)throws Exception;
}


