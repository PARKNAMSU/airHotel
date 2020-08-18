package kg.air.cnc.dao.customer;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import kg.air.cnc.vo.CustomerVO;

@Repository
public class CustomerDAOImpl implements CustomerDAO{

	@Inject
	SqlSession session;
	
	@Override
	public int register(CustomerVO vo) throws Exception {
		return session.insert("customer.register", vo);
	}
	
	@Override
	public int idCheck(CustomerVO vo) throws Exception{
		int result = session.selectOne("customer.idCheck", vo);
		return result;
	}
	
	@Override
	public int createEmailCheck(String customer_email) throws Exception {
		return session.selectOne("customer.createEmailCheck", customer_email);
	}
	
	@Override
	public CustomerVO customerCheck(String customer_id) throws Exception {
		return session.selectOne("customer.customerCheck", customer_id);
	}

	// 로그인에 성공하면 유저 정보를 담고 있는 vo객체를 반환.
	@Override
	public CustomerVO login(CustomerVO customerVO) throws Exception {
		return session.selectOne("customer.login", customerVO);
	}

	// 로그인 유지 처리.
	@Override
	public void keepLogin(String customer_id, String session_id, Date session_limit)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customerId", customer_id);
		map.put("sessionId", session_id);
		map.put("sessionLimit", session_limit);
		session.update("customer.keepLogin", map);
	}

	// 세션키 검증.
	@Override
	public CustomerVO checkCustomerWithSessionKey(String session_id)throws Exception {
		return session.selectOne("customer.checkCustomerWithSessionKey", session_id);
	}

	// 비밀번호 변경.
	@Override
	public int changePassword(CustomerVO customerVO) throws Exception {
		return session.update("customer.changePassword", customerVO);
	}

	// 블랙 리스트 확인.
	@Override
	public int blacklistEmailCheck(CustomerVO vo) throws Exception {
		return session.selectOne("customer.blacklistEmailCheck", vo);
	}

	@Override
	public CustomerVO getCustomerInfo(String customerId) throws Exception {
		return session.selectOne("customer.getCustomerInfo", customerId);
	}

	@Override
	public int customerInfoUpdate(CustomerVO vo) throws Exception {
		return session.update("customer.customerInfoUpdate", vo);
	}

	@Override
	public int modifyPassword(CustomerVO customerVO) throws Exception {
		return session.update("customer.modifyPassword", customerVO);
	}

	@Override
	public String passwordCheck(String customer_id) throws Exception {
		return session.selectOne("customer.passwordCheck", customer_id);
	}

	@Override
	public void customerWithdrawal(String customer_id) throws Exception {
		session.delete("customer.customerWithdrawal", customer_id);
	}
}
