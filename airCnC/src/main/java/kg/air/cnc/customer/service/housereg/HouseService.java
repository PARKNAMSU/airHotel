package kg.air.cnc.customer.service.housereg;

import java.util.List;

import kg.air.cnc.customer.vo.housereg.HouseVO;

public interface HouseService {
	public List<HouseVO> listProduct();
	public HouseVO detailProduct(String houseId);
	public void insertProduct(HouseVO vo);
}
