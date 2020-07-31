package kg.air.cnc.customer.service;

import javax.inject.Inject;
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
}
