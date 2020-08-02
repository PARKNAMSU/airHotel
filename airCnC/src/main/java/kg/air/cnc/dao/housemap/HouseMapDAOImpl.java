package kg.air.cnc.dao.housemap;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import kg.air.cnc.vo.HouseVO;

public class HouseMapDAOImpl implements HouseMapDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<HouseVO> getHouseList() {
		return mybatis.selectList("houseMap.getHouseList");
	}

	@Override
	public HouseVO getHouse(HouseVO vo) {
		return mybatis.selectOne("houseMap.getHouse",vo);
	}

}
