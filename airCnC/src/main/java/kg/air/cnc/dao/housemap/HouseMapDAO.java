package kg.air.cnc.dao.housemap;

import java.util.List;
import java.util.Map;

import kg.air.cnc.vo.House_InfoVO;

public interface HouseMapDAO {
	public List<House_InfoVO> getHouseList(String location);
	public List<Map<String, Integer>> getPrice(String location);
	public List<House_InfoVO> getAll(Map<String, String> info);
	public List<House_InfoVO> getDetail(Map<String, String> info);
	public List<House_InfoVO> getDetailWithCheckOut(Map<String, String> info);
	public List<House_InfoVO> getDetailWithDetail(Map<String, String> info);
	public List<House_InfoVO> getDetailWithBoth(Map<String, String> info);
	public List<Map<String, Integer>> getAllPrice(Map<String, String> info);
	public List<Map<String, Integer>> getPrice(Map<String, String> info);
	public List<Map<String, Integer>> getDetailWithCheckOutPrice(Map<String, String> info);
	public List<Map<String, Integer>> getDetailWithDetailPrice(Map<String, String> info);
	public List<Map<String, Integer>> getDetailWithBothPrice(Map<String, String> info);
	public List<House_InfoVO> searchIndexAll(Map<String, String> info);
	public List<House_InfoVO> searchIndex(Map<String, String> info);
	public List<House_InfoVO> searchIndexWithCheckOut(Map<String, String> info);
	public List<House_InfoVO> searchIndexWithDetail(Map<String, String> info);
	public List<House_InfoVO> searchIndexWithBoth(Map<String, String> info);
	public List<Map<String, Integer>> searchIndexAllPrice(Map<String, String> info);
	public List<Map<String, Integer>> searchIndexPrice(Map<String, String> info);
	public List<Map<String, Integer>> searchIndexWithCheckOutPrice(Map<String, String> info);
	public List<Map<String, Integer>> searchIndexWithDetailPrice(Map<String, String> info);
	public List<Map<String, Integer>> searchIndexWithBothPrice(Map<String, String> info);
	
}
