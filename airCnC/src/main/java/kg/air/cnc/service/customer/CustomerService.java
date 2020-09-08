package kg.air.cnc.service.customer;

import java.util.Date;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;

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
	
	// 비밀번호 재설정.
	public int changePassword(CustomerVO customerVO)throws Exception;
	
	// 블랙리스트 확인.
	public int blacklistEmailCheck(CustomerVO vo)throws Exception;
	
	// 사용자 정보 가져오기.
	public CustomerVO getCustomerInfo(String customerId)throws Exception;
	
	// 사용자 정보 수정.
	public int customerInfoUpdate(CustomerVO vo)throws Exception;
	
	// 비밀번호 변경.
	public int modifyPassword(CustomerVO customerVO)throws Exception;
	
	// 비밀번호 확인.
	public String passwordCheck(String customer_id)throws Exception;
	
	// 회원 탈퇴.
	public void customerWithdrawal(String customer_id)throws Exception;
	
	// 호스트 신청.
	public int hostRegister(HostVO vo)throws Exception;

	// 사용자 등급 변경
	public void changeCustomerType(CustomerVO customerVO)throws Exception;
	
	// 호스트 정보 수정.
	public void hostInfoUpdate(HostVO hostVO)throws Exception;
	
	// 호스트 비밀번호 변경.
	public void hostModifyPassword(HostVO hostVO)throws Exception;
	
	// 호스트 탈퇴.
	public void hostWithdrawal(String host_id)throws Exception;
}


