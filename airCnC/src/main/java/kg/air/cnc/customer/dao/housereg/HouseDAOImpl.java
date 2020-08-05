package kg.air.cnc.customer.dao.housereg;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.customer.vo.housereg.HouseVO;
@Repository
public class HouseDAOImpl implements HouseDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<HouseVO> listProduct() {
		return sqlSessionTemplate.selectList("product.listProduct");
	}

	@Override
	public HouseVO detailProduct(String houseId) {
		return sqlSessionTemplate.selectOne("product.detailProduct", houseId);
	}

	@Override
	public void insertProduct(HouseVO vo) {
		sqlSessionTemplate.insert("product.insertProduct", vo);
	}

	@Override
	public void insertHouse(HouseVO vo) {
		sqlSessionTemplate.insert("product.insertHouse", vo);
	}

}
