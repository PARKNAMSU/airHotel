package kg.air.cnc.service.waiting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.waiting.RemoveWaitingDAOImpl;
import kg.air.cnc.vo.House_InfoVO;
import kg.air.cnc.vo.RemoveWaitingVO;

@Service
public class RemoveWaitingServiceImpl {
	
	@Autowired
	RemoveWaitingDAOImpl removeWaitingDAO;

	public House_InfoVO getHouse(House_InfoVO vo) {
		return removeWaitingDAO.getHouse(vo);
	}

	public List<House_InfoVO> getWaitingList() {
		return removeWaitingDAO.getRemoveWaitingList();
	}
	
	public void updateDate(House_InfoVO vo) {
		removeWaitingDAO.updateDate(vo);
	}
	
	public void cancelRemove(House_InfoVO vo) {
		removeWaitingDAO.deleteRemoveWaiting(vo);
		removeWaitingDAO.cancelRemove(vo);
	}
	
	public List<RemoveWaitingVO> canDeleteList() {
		return removeWaitingDAO.canDeleteList();
	}
	
	@Scheduled(cron="0 0 1 * * ?")
	public void deleteHouse() {
		removeWaitingDAO.deleteHouse(canDeleteList());
	}
}
