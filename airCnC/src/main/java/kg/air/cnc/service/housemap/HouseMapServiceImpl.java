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
	public List<House_InfoVO> getDetail(Map<String, String> info){
		if(info.get("checkOut").equals("") && info.get("detail").equals("전체")) { //상세지역 상관 없고 체크아웃도 상관 없는 상태
			return houseMapDAO.getDetailWithBoth(info);
		}
		else if(info.get("checkOut").equals("")) { // 체크인 체크아웃 선택 x 상세지역 선택
			return houseMapDAO.getDetail(info);
		}
		else if(info.get("detail").equals("전체")) { // 체크인 체크아웃 선택하고 상세지역 선택x
			return houseMapDAO.getDetailWithDetail(info);
		}
		else {	//둘다 선택한 상태
			return houseMapDAO.getDetailWithCheckOut(info);
		}
		//내일부터 여기서 메서드 위치 정하고 쿼리문 작성해야한다.
	}
	
	@Override
	public List<Map<String, Integer>> getPrice(String location) {
		return houseMapDAO.getPrice(location);
	}
	
	@Override
	public List<Map<String, Integer>> getPrice(Map<String, String> info) {
		return houseMapDAO.getPrice(info);
	}

}
