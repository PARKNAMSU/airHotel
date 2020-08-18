package kg.air.cnc.service.customer;

import java.util.Date;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.customer.CustomerDAO;
import kg.air.cnc.vo.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Inject
	CustomerDAO dao;

	// 회원가입.
	@Override
	public int register(CustomerVO vo) throws Exception {
		int result = 0;
		result = dao.register(vo);
		return result;
	}
	
	// 아이디 중복 여부 검사.
	@Override
	public int idCheck(CustomerVO vo) throws Exception {
		return dao.idCheck(vo);
	}
	
	// 이메일 중복 여부 검사.
	@Override
	public int createEmailCheck(String customer_email) throws Exception {
		return dao.createEmailCheck(customer_email);
	}
	
	// 회원 체크.
	@Override
	public CustomerVO customerCheck(String customer_id) throws Exception {
		return dao.customerCheck(customer_id);
	}

	@Override
	public CustomerVO login(CustomerVO customerVO) throws Exception {
		return dao.login(customerVO);
	}

	@Override
	public void keepLogin(String customer_id, String session_id, Date session_limit)throws Exception {
		dao.keepLogin(customer_id, session_id, session_limit);
	}

	@Override
	public CustomerVO checkCustomerWithSessionKey(String session_id) throws Exception {
		return dao.checkCustomerWithSessionKey(session_id);
	}

	@Override
	public int changePassword(CustomerVO customerVO) throws Exception {
		return dao.changePassword(customerVO);
	}

	@Override
	public int blacklistEmailCheck(CustomerVO vo) throws Exception {
		return dao.blacklistEmailCheck(vo);
	}

	@Override
	public CustomerVO getCustomerInfo(String customerId) throws Exception {
		return dao.getCustomerInfo(customerId);
	}

	@Override
	public int customerInfoUpdate(CustomerVO vo) throws Exception {
		return dao.customerInfoUpdate(vo);
	}

	@Override
	public int modifyPassword(CustomerVO customerVO) throws Exception {
		return dao.modifyPassword(customerVO);
	}

	@Override
	public String passwordCheck(String customer_id) throws Exception {
		return dao.passwordCheck(customer_id);
	}

	@Override
	public void customerWithdrawal(String customer_id) throws Exception {
		dao.customerWithdrawal(customer_id);
	}
}
