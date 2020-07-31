package kg.air.cnc.customer.service.housereg;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kg.air.cnc.customer.dao.housereg.HouseDAO;
import kg.air.cnc.customer.vo.housereg.HouseVO;
@Service("houseService")
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseDAO houseDao;
	@Override
	@Transactional
	public List<HouseVO> listProduct() {
		return houseDao.listProduct();
	}

	@Override
	@Transactional
	public HouseVO detailProduct(String houseId) {
		HouseVO houseVO = houseDao.detailProduct(houseId);
		return houseVO;
		//return houseDao.detailProduct(houseId);
	}

	@Override
	@Transactional
	public void insertProduct(HouseVO vo) {
		houseDao.insertProduct(vo);
	}

}
