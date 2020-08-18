package kg.air.cnc.dao.housemap;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.House_InfoVO;
import kg.air.cnc.vo.PopularVO;

@Repository
public class HouseMapDAOImpl implements HouseMapDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<House_InfoVO> getHouseList(String location) {
		return mybatis.selectList("houseMap.getHouseList", location);
	}
	
	public List<House_InfoVO> getAll(Map<String, String> info){
		return mybatis.selectList("houseMap.getAll");
	}
	
	@Override
	public List<Map<String, Integer>> getAllPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.getAllPrice");
	}
	
	@Override
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

	@Override
	public List<House_InfoVO> searchIndexAll(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexAll", info);
	}

	@Override
	public List<Map<String, Integer>> searchIndexAllPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexAllPrice", info);
	}
	
	@Override
	public List<House_InfoVO> searchIndex(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndex", info);
	}

	@Override
	public List<Map<String, Integer>> searchIndexPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexPrice", info);
	}
	
	@Override
	public List<House_InfoVO> searchIndexWithCheckOut(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexWithCheckOut", info);
	}
	
	@Override
	public List<Map<String, Integer>> searchIndexWithCheckOutPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexWithCheckOutPrice", info);
	}

	@Override
	public List<House_InfoVO> searchIndexWithDetail(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexWithDetail", info);
	}

	@Override
	public List<Map<String, Integer>> searchIndexWithDetailPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexWithDetailPrice", info);
	}
	
	@Override
	public List<House_InfoVO> searchIndexWithBoth(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexWithBoth", info);
	}

	@Override
	public List<Map<String, Integer>> searchIndexWithBothPrice(Map<String, String> info) {
		return mybatis.selectList("houseMap.searchIndexWithBothPrice", info);
	}

	public List<House_InfoVO> notPopular() {
		return mybatis.selectList("houseMap.notPopular");
	}
	
	public void savePopular(List<House_InfoVO> vo) {
		mybatis.insert("houseMap.savePopular", vo);
	}
	
	public void updateMin(List<House_InfoVO> vo) {
		mybatis.update("houseMap.updateMin", vo);
	}
	
	public PopularVO getDefaultPrices(String seq) {
		return mybatis.selectOne("houseMap.getDefaultPrices", seq);
	}
	
	public void updateBack(PopularVO vo) {
		mybatis.update("houseMap.updateBack", vo);
	}
	
	public void deletePopular(String seq) {
		mybatis.delete("houseMap.deletePopular", seq);
	}
}
