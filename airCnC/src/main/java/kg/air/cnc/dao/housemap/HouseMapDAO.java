package kg.air.cnc.dao.housemap;

import java.util.List;
import java.util.Map;

import kg.air.cnc.vo.House_InfoVO;

public interface HouseMapDAO {
	public List<House_InfoVO> getHouseList(String location);
	public List<Map<String, Integer>> getPrice(String location);
	public List<House_InfoVO> getDetail(Map<String, String> info);
	public List<House_InfoVO> getDetailWithCheckOut(Map<String, String> info);
	public List<Map<String, Integer>> getPrice(Map<String, String> info);
	public List<House_InfoVO> getDetailWithDetail(Map<String, String> info);
	public List<House_InfoVO> getDetailWithBoth(Map<String, String> info);
}
