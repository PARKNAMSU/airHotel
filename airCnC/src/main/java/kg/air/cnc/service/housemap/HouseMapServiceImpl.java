package kg.air.cnc.service.housemap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.housemap.HouseMapDAOImpl;
import kg.air.cnc.vo.House_InfoVO;

@Service
public class HouseMapServiceImpl implements HouseMapService{
	
	@Autowired
	private HouseMapDAOImpl houseMapDAO;

	@Override
	public List<House_InfoVO> getHouseList(String location) {
		List<House_InfoVO> tmp = houseMapDAO.getHouseList(location);
		System.out.println(tmp.toString());
		System.out.println(tmp.size());
		return tmp;
	}

	@Override
	public List<House_InfoVO> getDetail(Map<String, String> info){
		return houseMapDAO.getDetail(info);
	}
	
	@Override
	public List<Map<String, Integer>> getPrice(String location) {
		List<Map<String, Integer>> tmp = houseMapDAO.getPrice(location);
		System.out.println(tmp.toString());
		return tmp;
	}

}
