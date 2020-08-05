package kg.air.cnc.dao.housereg;

import java.util.List;

import kg.air.cnc.vo.HouseVO;

public interface HouseDAO {
	public List<HouseVO> listProduct();
	public HouseVO detailProduct(String houseId);
	public void insertProduct(HouseVO vo);
	
	public void insertHouse(HouseVO vo);
}
