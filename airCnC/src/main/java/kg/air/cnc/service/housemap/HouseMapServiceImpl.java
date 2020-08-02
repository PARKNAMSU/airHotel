package kg.air.cnc.service.housemap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kg.air.cnc.dao.housemap.HouseMapDAOImpl;
import kg.air.cnc.vo.HouseVO;

public class HouseMapServiceImpl implements HouseMapService{
	
	@Autowired
	private HouseMapDAOImpl houseMapDAO;

	@Override
	public List<HouseVO> getHouseList() {
		return houseMapDAO.getHouseList();
	}

	@Override
	public HouseVO getHouse(HouseVO vo) {
		return houseMapDAO.getHouse(vo);
	}

}
