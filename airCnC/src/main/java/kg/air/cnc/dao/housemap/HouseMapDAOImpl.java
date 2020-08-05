package kg.air.cnc.dao.housemap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.House_InfoVO;

@Repository
public class HouseMapDAOImpl implements HouseMapDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<House_InfoVO> getHouseList(String location) {
		return mybatis.selectList("houseMap.getHouseList", location);
	}

	public List<House_InfoVO> getDetail(Map<String, String> info) {
		return mybatis.selectList("houseMap.getDetail", info);
	}

	@Override 
	public List<Map<String, Integer>> getPrice(String location) { //ù �˻����� ����Ǵ°�
		return mybatis.selectList("houseMap.getPrice", location);
	}

	@Override
	public List<Map<String, Integer>> getPrice(Map<String, String> info) {//���ΰ˻����� ����Ǵ°�
		return mybatis.selectList("houseMap.getDetailPrice", info);
	}
	
	@Override
	public List<House_InfoVO> getDetailWithCheckOut(Map<String, String> info) {
		return mybatis.selectList("houseMap.getDetailWithCheckOut", info);
	}

	@Override
	public List<Map<String, Integer>> getDetailWithCheckOutPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.getDetailWithCheckOutPrice", info);
	}
	
	@Override
	public List<House_InfoVO> getDetailWithDetail(Map<String, String> info){
		return mybatis.selectList("houseMap.getDetailWithDetail", info);
	}

	@Override
	public List<Map<String, Integer>> getDetailWithDetailPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.getDetailWithDetailPrice", info);
	}

	@Override
	public List<House_InfoVO> getDetailWithBoth(Map<String, String> info){
		return mybatis.selectList("houseMap.getDetailWithBoth", info);
	}

	@Override
	public List<Map<String, Integer>> getDetailWithBothPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.getDetailWithBothPrice", info);
	}

}
