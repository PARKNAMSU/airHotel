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
	public boolean loginCheck(AdminVO adminVO) throws Exception {
		String adminId = sqlSession.selectOne("admin.login_check", adminVO);
		return (adminId == null) ? false : true;
	}
}
