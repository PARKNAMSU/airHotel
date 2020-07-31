package kg.air.cnc.service.waiting;

import java.util.List;

import kg.air.cnc.vo.HouseVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.waiting.RegisterWaitingDAOImpl;

@Service
public class RegisterWaitingServiceImpl {

	@Autowired
	RegisterWaitingDAOImpl houseWaitingDAO;
	
	public HouseVO getHouse(HouseVO vo) {
		return houseWaitingDAO.getHouse(vo);
	}

	public List<HouseVO> getWaitingList() {
		return houseWaitingDAO.getRegisterWaitingList();
	}
	
	public void deleteWaiting(HouseVO vo) {
		houseWaitingDAO.deleteWaiting(vo);
	}
	
	public void registerHouse(HouseVO vo) {
		houseWaitingDAO.registerHouse(vo);
		deleteWaiting(vo);
	}
	
	public void cancelRegister(HouseVO vo) {
		deleteWaiting(vo);
		houseWaitingDAO.cancelRegister(vo);
	}

}
