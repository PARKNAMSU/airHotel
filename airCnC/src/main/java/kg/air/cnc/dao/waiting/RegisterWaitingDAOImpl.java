package kg.air.cnc.dao.waiting;

import java.util.List;

import kg.air.cnc.vo.HouseVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterWaitingDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public HouseVO getHouse(HouseVO vo) {
		return mybatis.selectOne("waitingDAO.getHouse",vo);
	}
	
	public List<HouseVO> getRegisterWaitingList() {
		return mybatis.selectList("waitingDAO.getRegisterWaitingList");
	}
	
	public void deleteWaiting(HouseVO vo) {
		mybatis.delete("waitingDAO.deleteRegisterWaiting",vo);
	}
	
	public void registerHouse(HouseVO vo) {
		mybatis.update("waitingDAO.registerHouse",vo);
	}
	
	public void cancelRegister(HouseVO vo) {
		mybatis.delete("waitingDAO.cancelRegister",vo);
	}
}
