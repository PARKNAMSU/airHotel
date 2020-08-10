package kg.air.cnc.admin.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import kg.air.cnc.admin.vo.AdminVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public AdminVO loginCheck(String admin_id) throws Exception {
		return sqlSession.selectOne("admin.loginCheck", admin_id);
	}
}
