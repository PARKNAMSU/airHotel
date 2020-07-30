package kg.air.cnc.service.waiting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.waiting.RemoveWaitingDAOImpl;
import kg.air.cnc.vo.HouseVO;

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
		removeWaitingDAO.cancelRemove(vo);
		removeWaitingDAO.deleteRemoveWaiting(vo);
	}
	
	public void deleteHouse(HouseVO vo) {
		
	}
}
