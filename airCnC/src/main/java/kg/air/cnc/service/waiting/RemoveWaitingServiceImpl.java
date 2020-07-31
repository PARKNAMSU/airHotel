package kg.air.cnc.service.waiting;

import java.util.List;

import kg.air.cnc.vo.HouseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.waiting.RemoveWaitingDAOImpl;
import kg.air.cnc.vo.RemoveWaitingVO;

@Service
public class RemoveWaitingServiceImpl {
	
	@Autowired
	RemoveWaitingDAOImpl removeWaitingDAO;

	public HouseVO getHouse(HouseVO vo) {
		return removeWaitingDAO.getHouse(vo);
	}

	public List<HouseVO> getWaitingList() {
		return removeWaitingDAO.getRemoveWaitingList();
	}
	
	public void updateDate(HouseVO vo) {
		removeWaitingDAO.updateDate(vo);
	}
	
	public void cancelRemove(HouseVO vo) {
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
