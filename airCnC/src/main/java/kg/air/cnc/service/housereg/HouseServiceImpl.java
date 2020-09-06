package kg.air.cnc.service.housereg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kg.air.cnc.dao.housereg.HouseDAO;
import kg.air.cnc.vo.House_InfoVO;
@Service("houseService")
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseDAO houseDao;
	@Override
	@Transactional
	public List<House_InfoVO> listProduct() {
		return houseDao.listProduct();
	}

	@Override
	@Transactional
	public House_InfoVO detailProduct(String houseId) {
		House_InfoVO houseVO = houseDao.detailProduct(houseId);
		return houseVO;
		//return houseDao.detailProduct(houseId);
	}

	@Override
	@Transactional
	public void insertProduct(House_InfoVO vo) {
		houseDao.insertProduct(vo);
	}

	@Override
	public void insertHouse(House_InfoVO vo) {
		houseDao.insertHouse(vo);
	}
	
	@Override
	public List<House_InfoVO> listHouse(House_InfoVO vo) {
		return houseDao.listHouse(vo);
	}

	@Override
	public void updateHouse_housedetail(House_InfoVO vo) {
		houseDao.updateHouse_housedetail(vo);
	}

	@Override
	public House_InfoVO detailHouse(int house_seq) {
		House_InfoVO houseVO = houseDao.detailHouse(house_seq);
		return houseVO;
	}
	
	@Override
	public void updateHouse_bathcount(House_InfoVO vo) {
		houseDao.updateHouse_bathcount(vo);
	}

	@Override
	public void updateHouse_location(House_InfoVO vo) {
		houseDao.updateHouse_location(vo);
	}

	@Override
	public void updateHouse_defaultoption(House_InfoVO vo) {
		houseDao.updateHouse_defaultoption(vo);
	}

	@Override
	public void updateHouse_guestcomfortable(House_InfoVO vo) {
		houseDao.updateHouse_guestcomfortable(vo);
	}

	@Override
	public void updateHouse_guesttextarea(House_InfoVO vo) {
		houseDao.updateHouse_guesttextarea(vo);
	}

	@Override
	public void updateHouse_hosttitle(House_InfoVO vo) {
		houseDao.updateHouse_hosttitle(vo);
	}

	@Override
	public void updateHouse_charge(House_InfoVO vo) {
		houseDao.updateHouse_charge(vo);
	}

	@Override
	public void updateHouse_restricttheme(House_InfoVO vo) {
		houseDao.updateHouse_restricttheme(vo);
	}

	@Override
	public void updateHouse_hosthouseimg(House_InfoVO vo) {
		houseDao.updateHouse_hosthouseimg(vo);
	}

}
