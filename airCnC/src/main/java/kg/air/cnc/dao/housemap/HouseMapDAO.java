package kg.air.cnc.dao.housemap;

import java.util.List;
import java.util.Map;

import kg.air.cnc.vo.House_InfoVO;

public interface HouseMapDAO {
	public List<House_InfoVO> getHouseList(String location);
	public List<Map<String, Integer>> getPrice(String location);
	public List<House_InfoVO> getDetail(Map<String, String> info);
}
