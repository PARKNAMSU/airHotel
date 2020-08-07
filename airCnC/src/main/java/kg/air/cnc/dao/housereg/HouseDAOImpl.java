package kg.air.cnc.dao.housereg;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.House_InfoVO;
@Repository
public class HouseDAOImpl implements HouseDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Override
	public List<House_InfoVO> listProduct() {
		return sqlSessionTemplate.selectList("product.listProduct");
	}

	@Override
	public House_InfoVO detailProduct(String houseId) {
		return sqlSessionTemplate.selectOne("product.detailProduct", houseId);
	}

	@Override
	public void insertProduct(House_InfoVO vo) {
		sqlSessionTemplate.insert("product.insertProduct", vo);
	}

	@Override
	public void insertHouse(House_InfoVO vo) {
		sqlSessionTemplate.insert("product.insertHouse", vo);
	}

}
