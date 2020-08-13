package kg.air.cnc.dao.cupon;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.CuponVO;

@Repository
public class CuponDAOImpl {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	/*
	public void useCupon(String cuponNumber) {
		mybatis.delete("cuponDAO.makeCupon", cuponNumber);
	}
	*/
	public void checkRate(Map<String, String> info) {
		mybatis.insert("cuponDAO.checkRate", info);
	}
	
	public void checkMoney(Map<String, String> info) {
		mybatis.insert("cuponDAO.checkMoney", info);
	}
	
	public List<CuponVO> getCuponList(String id) {
		return mybatis.selectList("cuponDAO.getCuponList", id);
	}

	public void deleteCupon() {
		mybatis.delete("cuponDAO.deleteCupon");
	}
}
