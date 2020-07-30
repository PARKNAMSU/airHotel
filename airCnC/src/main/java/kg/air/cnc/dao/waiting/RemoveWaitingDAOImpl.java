package kg.air.cnc.dao.waiting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HouseVO;

@Repository
public class RemoveWaitingDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public HouseVO getHouse(HouseVO vo) {
		return mybatis.selectOne("waitingDAO.getHouse", vo);
	}
	
	public List<HouseVO> getRemoveWaitingList(HouseVO vo) {
		return mybatis.selectList("waitingDAO.getRemoveWaitingList",vo);
	}
	
	public List<HouseVO> checkReservation(HouseVO vo){
		return mybatis.selectList("waitingDAO.checkReservaion",vo);
	}
	
	public void stopReservation(HouseVO vo){
		mybatis.update("waitingDAO.stopReservation",vo);
	}
	
}
