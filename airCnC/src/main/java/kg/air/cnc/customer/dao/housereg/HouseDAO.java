package kg.air.cnc.customer.dao.housereg;

import java.util.List;

import kg.air.cnc.customer.vo.housereg.HouseVO;

public interface HouseDAO {
	public List<HouseVO> listProduct();
	public HouseVO detailProduct(String houseId);
	public void insertProduct(HouseVO vo);
}
