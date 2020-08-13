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
	public void updateHouse_housedetail(int house_seq) {
		houseDao.updateHouse_housedetail(house_seq);
	}

}
