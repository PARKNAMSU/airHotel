package kg.air.cnc.customer.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import kg.air.cnc.customer.vo.CustomerVO;

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
	public int getKey(String customer_id, String customer_key) throws Exception{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modifyKey(String customer_id, String customer_key) throws Exception{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sendPassword(String customer_id, String customer_email, String customer_key)throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CustomerVO login(String customer_id)throws Exception {
		CustomerVO customerVO = session.selectOne("customer.login", customer_id);
		return customerVO;
	}
}