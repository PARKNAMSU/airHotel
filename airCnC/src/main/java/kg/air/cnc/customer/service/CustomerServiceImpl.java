package kg.air.cnc.customer.service;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import kg.air.cnc.customer.dao.CustomerDAO;
import kg.air.cnc.customer.vo.CustomerVO;

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
	public int createEmailCheck(String customerEmail) throws Exception {
		return dao.createEmailCheck(customerEmail);
	}

	// 로그인.
	@Override
	public int login(CustomerVO vo, HttpSession session, String rememberId, HttpServletResponse response)throws Exception {
		String customer_id = vo.getCustomerId();
		String customer_pw = vo.getCustomerPassword();
		CustomerVO customerVO = dao.login(customer_id);
		
		int result = 0;
		
		if (customerVO == null) {
			result = 0;
			return result;
		}
		
		String y = "Y";
		if (!(customerVO.getCustomerKey().equals(y))) {
			result = -2;
			return result;
		}
		
		if (customerVO != null) {
			if (customerVO.getCustomerId().equals(customer_id) && customerVO.getCustomerPassword().equals(customer_pw)){
				Cookie cookie = new Cookie("customer_check", customer_id);
				if (rememberId.equals("true")) {
					response.addCookie(cookie);
				}else {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
				customerVO.setCustomerPassword("");
				session.setAttribute("customerSession", customerVO);
				result = 1;
				
				session.setAttribute("rememberId", customerVO.getCustomerId());
			}
		}
		return result;
	}
}
