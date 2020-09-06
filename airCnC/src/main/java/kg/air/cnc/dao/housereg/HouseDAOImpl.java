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
	}//집등록

	@Override
	public List<House_InfoVO> listHouse(House_InfoVO vo) {
		return sqlSessionTemplate.selectList("product.listHouse", vo);
	}//자신이 등록한 집을 조회해서 리스트화 하여 거기서 radio 누르면 수정할 seq 받을수 있도록. 일단 안씀
	
	@Override
	public void updateHouse_housedetail(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_housedetail", vo);
	}//수정하기 위해 seq이용해서 집 세부정보 받아오기

	@Override
	public House_InfoVO detailHouse(int house_seq) {
		return sqlSessionTemplate.selectOne("product.detailHouse", house_seq);
	}//세부정보 받아온 detail이용해서 housedetail 수정

	@Override
	public void updateHouse_bathcount(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_bathcount", vo);
	}

	@Override
	public void updateHouse_location(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_location", vo);
	}

	@Override
	public void updateHouse_defaultoption(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_defaultoption", vo);
	}

	@Override
	public void updateHouse_guestcomfortable(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_guestcomfortable", vo);
	}

	@Override
	public void updateHouse_guesttextarea(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_guesttextarea", vo);
	}

	@Override
	public void updateHouse_hosttitle(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_hosttitle", vo);
	}

	@Override
	public void updateHouse_charge(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_charge", vo);
	}

	@Override
	public void updateHouse_restricttheme(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_restricttheme", vo);
	}

	@Override
	public void updateHouse_hosthouseimg(House_InfoVO vo) {
		sqlSessionTemplate.update("product.updateHouse_hosthouseimg", vo);
	}

	

}
