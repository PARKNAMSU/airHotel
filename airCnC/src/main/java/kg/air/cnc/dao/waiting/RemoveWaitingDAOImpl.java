package kg.air.cnc.dao.waiting;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.House_InfoVO;
import kg.air.cnc.vo.RemoveWaitingVO;

@Repository
public class RemoveWaitingDAOImpl {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public House_InfoVO getHouse(House_InfoVO vo) {
		return mybatis.selectOne("waitingDAO.getHouse", vo);
	}
	
	public List<House_InfoVO> getRemoveWaitingList() {
		return mybatis.selectList("waitingDAO.getRemoveWaitingList");
	}
	
	public void updateDate (House_InfoVO vo){
		mybatis.update("waitingDAO.updateDate",vo);
	}
	
	public void cancelRemove(House_InfoVO vo){
		mybatis.update("waitingDAO.registerHouse",vo);
	}
	
	public void deleteRemoveWaiting(House_InfoVO vo) {
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
