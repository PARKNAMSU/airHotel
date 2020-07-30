package kg.air.cnc.dao.waiting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HouseVO;

@Repository
public class RegisterWaitingDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public HouseVO getHouse(HouseVO vo) {
		return mybatis.selectOne("waitingDAO.getHouse",vo);
	}
	
	public List<HouseVO> getHouseWaitingList(HouseVO vo) {
		return mybatis.selectList("waitingDAO.getRegisterWaitingList",vo);
	}
	
	public void registerHouse(HouseVO vo) {
		mybatis.update("waitingDAO.registerHouse",vo);
	}
}
