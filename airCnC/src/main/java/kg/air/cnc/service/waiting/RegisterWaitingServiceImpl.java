package kg.air.cnc.service.waiting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.waiting.RegisterWaitingDAOImpl;
import kg.air.cnc.vo.House_InfoVO;

@Service
public class RegisterWaitingServiceImpl {

	@Autowired
	RegisterWaitingDAOImpl houseWaitingDAO;
	
	public House_InfoVO getHouse(House_InfoVO vo) {
		return houseWaitingDAO.getHouse(vo);
	}

	public List<House_InfoVO> getWaitingList() {
		return houseWaitingDAO.getRegisterWaitingList();
	}
	
	public void registerHouse(House_InfoVO vo) {
		houseWaitingDAO.registerHouse(vo);
	}
	
	public void cancelRegister(House_InfoVO vo) {
		houseWaitingDAO.cancelRegister(vo);
	}

}
