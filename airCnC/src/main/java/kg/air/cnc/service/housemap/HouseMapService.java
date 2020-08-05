package kg.air.cnc.service.housemap;

import java.util.List;
import java.util.Map;

import kg.air.cnc.vo.House_InfoVO;

public interface HouseMapService {
	public List<House_InfoVO> getHouseList(String location);
	public List<Map<String, Integer>> getPrice(String location);
	public List<House_InfoVO> getDetail(Map<String, String> info);
	public List<Map<String, Integer>> getPrice(Map<String, String> info);
}