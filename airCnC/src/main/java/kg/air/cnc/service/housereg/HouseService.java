package kg.air.cnc.service.housereg;

import java.util.List;

import kg.air.cnc.vo.House_InfoVO;


public interface HouseService {
	public List<House_InfoVO> listProduct();
	public House_InfoVO detailProduct(String houseId);
	public void insertProduct(House_InfoVO vo);
	
	public List<House_InfoVO> listHouse();
	public void insertHouse(House_InfoVO vo);//집등록
	public House_InfoVO detailHouse(int house_seq);//수정하기 위해 seq이용해서 집 세부정보 받아오기
	public void updateHouse_housedetail(House_InfoVO vo);//세부정보 받아온 detail이용해서 housedetail 수정
	public void updateHouse_bathcount(House_InfoVO vo);//세부정보 받아온 detail이용해서 bathcount 수정
	public void updateHouse_location(House_InfoVO vo);//세부정보 받아온 detail이용해서 location 수정
	public void updateHouse_defaultoption(House_InfoVO vo);//세부정보 받아온 detail이용해서 defaultoption 수정
	public void updateHouse_guestcomfortable(House_InfoVO vo);//세부정보 받아온 detail이용해서 guestcomfortable 수정
}
