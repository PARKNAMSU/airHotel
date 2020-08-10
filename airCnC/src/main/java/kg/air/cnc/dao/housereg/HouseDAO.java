package kg.air.cnc.dao.housereg;

import java.util.List;

import kg.air.cnc.vo.House_InfoVO;


public interface HouseDAO {
	public List<House_InfoVO> listProduct();
	public House_InfoVO detailProduct(String houseId);
	public void insertProduct(House_InfoVO vo);
	
	public void insertHouse(House_InfoVO vo);
}
