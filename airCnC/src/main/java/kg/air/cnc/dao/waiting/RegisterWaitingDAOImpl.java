package kg.air.cnc.dao.waiting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.House_InfoVO;

@Repository
public class RegisterWaitingDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public House_InfoVO getHouse(House_InfoVO vo) {
		return mybatis.selectOne("waitingDAO.getHouse",vo);
	}
	
	public List<House_InfoVO> getRegisterWaitingList() {
		return mybatis.selectList("waitingDAO.getRegisterWaitingList");
	}
	
	public void registerHouse(House_InfoVO vo) {
		mybatis.update("waitingDAO.registerHouse",vo);
	}
	
	public void cancelRegister(House_InfoVO vo) {
		mybatis.delete("waitingDAO.cancelRegister",vo);
	}
}
