package kg.air.cnc.service.housereg;

import java.util.List;

import kg.air.cnc.vo.House_InfoVO;


public interface HouseService {
	public List<House_InfoVO> listProduct();
	public House_InfoVO detailProduct(String houseId);
	public void insertProduct(House_InfoVO vo);
	
	public void insertHouse(House_InfoVO vo);
}
