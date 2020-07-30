package kg.air.cnc.service.waiting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.waiting.RemoveWaitingDAOImpl;
import kg.air.cnc.vo.HouseVO;

@Service
public class RemoveWaitingServiceImpl implements WaitingService{
	
	@Autowired
	RemoveWaitingDAOImpl removeWaitingDAO;

	@Override
	public HouseVO getHouse(HouseVO vo) {
		return removeWaitingDAO.getHouse(vo);
	}

	@Override
	public List<HouseVO> getWaitingList(HouseVO vo) {
		return removeWaitingDAO.getRemoveWaitingList(vo);
	}
	
	public List<HouseVO> checkReservation(HouseVO vo) {
		return removeWaitingDAO.checkReservation(vo);
	}
	
	public void deleteHouse(HouseVO vo) {
		List<HouseVO> list = this.checkReservation(vo);
	}
}
