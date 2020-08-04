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
	public int createEmailCheck(String customerEmail) throws Exception {
		return session.selectOne("customer.createEmailCheck", customerEmail);
	}
	
	@Override
	public int getKey(String customer_id, String customer_key) throws Exception{
		return 0;
	}

	@Override
	public int modifyKey(String customer_id, String customer_key) throws Exception{
		return 0;
	}

	@Override
	public int sendPassword(String customer_id, String customer_email, String customer_key)throws Exception {
		return 0;
	}

	@Override
	public CustomerVO selectById(String customerId) throws Exception {
		return session.selectOne("customer.selectById", customerId);
	}
}
