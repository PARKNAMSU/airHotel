package kg.air.cnc.service.waiting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.waiting.RegisterWaitingDAOImpl;
import kg.air.cnc.vo.HouseVO;

@Service
public class RegisterWaitingServiceImpl implements WaitingService{

	@Autowired
	RegisterWaitingDAOImpl houseWaitingDAO;
	
	@Override
	public HouseVO getHouse(HouseVO vo) {
		return houseWaitingDAO.getHouse(vo);
	}

	@Override
	public List<HouseVO> getWaitingList(HouseVO vo) {
		return houseWaitingDAO.getHouseWaitingList(vo);
	}
	
	public void registerHouse(HouseVO vo) {
		houseWaitingDAO.registerHouse(vo);
	}

}
