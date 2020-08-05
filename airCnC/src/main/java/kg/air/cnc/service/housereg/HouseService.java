package kg.air.cnc.service.housereg;

import java.util.List;

import kg.air.cnc.vo.HouseVO;

public interface HouseService {
	public List<HouseVO> listProduct();
	public HouseVO detailProduct(String houseId);
	public void insertProduct(HouseVO vo);
	
	public void insertHouse(HouseVO vo);
}
