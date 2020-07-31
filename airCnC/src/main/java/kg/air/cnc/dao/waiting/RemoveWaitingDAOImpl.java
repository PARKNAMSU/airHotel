package kg.air.cnc.dao.waiting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.RemoveWaitingVO;

@Repository
public class RemoveWaitingDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public HouseVO getHouse(HouseVO vo) {
		return mybatis.selectOne("waitingDAO.getHouse", vo);
	}
	
	public List<HouseVO> getRemoveWaitingList() {
		return mybatis.selectList("waitingDAO.getRemoveWaitingList");
	}
	
	public void updateDate (HouseVO vo){
		mybatis.update("waitingDAO.updateDate",vo);
	}
	
	public void cancelRemove(HouseVO vo){
		mybatis.update("waitingDAO.registerHouse",vo);
	}
	
	public void deleteRemoveWaiting(HouseVO vo) {
		mybatis.delete("waitingDAO.deleteRemoveWaiting", vo);
	}
	
	public List<RemoveWaitingVO> canDeleteList() {
		return mybatis.selectList("waitingDAO.canDeleteList");
	}
	
	public void deleteHouse(List<RemoveWaitingVO> vo) {
		for(int i=0; i<vo.size(); i++) {
			mybatis.delete("waitingDAO.deleteWaitingHouse",vo.get(i));
			mybatis.delete("waitingDAO.deleteHouse", vo.get(i));
		}
	}
}
