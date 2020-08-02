package kg.air.cnc.customer.dao;

import kg.air.cnc.customer.vo.CustomerVO;

public interface CustomerDAO {
	
	public int register(CustomerVO vo)throws Exception; // 회원가입 메서드.
	public int getKey(String customer_id, String customer_key)throws Exception; // 인증키 생성 메서드.
	public int modifyKey(String customer_id, String customer_key)throws Exception; // 인증키 Y로 수정하는 메서드.
	public int sendPassword(String customer_id, String customer_email, String customer_key)throws Exception; // 임시 비밀번호 변경 메서드.
	public CustomerVO login(String customer_id)throws Exception; // 로그인 메서드.
	public int idCheck(CustomerVO vo)throws Exception; // 아이디 중복 여부 확인 메서드.
	public int createEmailCheck(String customerEmail)throws Exception; // 이메일 중복 여부 확인 메서드.
}
