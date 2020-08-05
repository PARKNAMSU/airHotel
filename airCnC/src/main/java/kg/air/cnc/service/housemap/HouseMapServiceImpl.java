package kg.air.cnc.service.housemap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.housemap.HouseMapDAOImpl;
import kg.air.cnc.vo.House_InfoVO;

@Service
public class HouseMapServiceImpl implements HouseMapService{
	
	@Autowired
	private HouseMapDAOImpl houseMapDAO;

	@Override
	public List<House_InfoVO> getHouseList(String location) {
		List<House_InfoVO> tmp = houseMapDAO.getHouseList(location);
		System.out.println(tmp.toString());
		System.out.println(tmp.size());
		return tmp;
	}
	
	@Override
	public List<Map<String, Integer>> getPrice(String location) {
		return houseMapDAO.getPrice(location);
	}

	@Override
	public List<House_InfoVO> getDetail(Map<String, String> info){
		if(!info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { //상세지역과 체크아웃 둘 다 설정
			System.out.println("상세지역과 체크아웃 둘 다 설정");
			return houseMapDAO.getDetailWithBoth(info);
		}
		else if(!info.get("detail").contains("선택") && info.get("checkOut").equals("")) { // 체크인 체크아웃 선택 x 상세지역 선택
			System.out.println("체크인 체크아웃 선택 x 상세지역 선택");
			return houseMapDAO.getDetailWithDetail(info);
		}
		else if(info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { // 체크인 체크아웃 선택하고 상세지역 선택x
			System.out.println("체크인 체크아웃 선택하고 상세지역 선택x");
			return houseMapDAO.getDetailWithCheckOut(info);
		}
		else {	// 둘 다 설정하지 않은 상태
			System.out.println("둘 다 설정하지 않음");
			return houseMapDAO.getDetail(info);
		}
	}
	
	@Override
	public List<Map<String, Integer>> getPrice(Map<String, String> info) { //상세검색에서 실행되는것
		if(!info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { //상세지역과 체크아웃 둘 다 설정
			System.out.println("상세지역과 체크아웃 둘 다 설정");
			return houseMapDAO.getDetailWithBothPrice(info);
		}
		else if(!info.get("detail").contains("선택") && info.get("checkOut").equals("")) { // 체크인 체크아웃 선택 x 상세지역 선택
			System.out.println("체크인 체크아웃 선택 x 상세지역 선택");
			return houseMapDAO.getDetailWithDetailPrice(info);
		}
		else if(info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { // 체크인 체크아웃 선택하고 상세지역 선택x
			System.out.println("체크인 체크아웃 선택하고 상세지역 선택x");
			return houseMapDAO.getDetailWithCheckOutPrice(info);
		}
		else {	// 둘 다 설정하지 않은 상태
			System.out.println("둘 다 설정하지 않음");
			return houseMapDAO.getPrice(info);
		}
	}

}
