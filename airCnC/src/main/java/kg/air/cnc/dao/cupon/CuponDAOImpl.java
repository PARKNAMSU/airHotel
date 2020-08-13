package kg.air.cnc.dao.cupon;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.CuponVO;

@Repository
public class CuponDAOImpl {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	/*
	public void makeCupon() {
		mybatis.insert("cuponDAO.makeCupon");
	}

	public void useCupon(String cuponNumber) {
		mybatis.delete("cuponDAO.makeCupon", cuponNumber);
	}
	*/
	public CuponVO checkNumber(String cuponNumber) {
		return mybatis.selectOne("cuponDAO.checkNumber", cuponNumber);
	}
	
	public List<CuponVO> getCuponList(String id) {
		return mybatis.selectList("cuponDAO.getCuponList", id);
	}

	public void deleteCupon() {
		mybatis.delete("cuponDAO.deleteCupon");
	}
}
