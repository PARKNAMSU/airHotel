package kg.air.cnc.service.housemap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.housemap.HouseMapDAOImpl;
import kg.air.cnc.vo.House_InfoVO;
import kg.air.cnc.vo.PopularVO;

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
		if(info.get("location").contains("지역")) {
			System.out.println("전체지역 선택");
			return houseMapDAO.getAll(info);
		}
		else if(!info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { //상세지역과 체크아웃 둘 다 설정
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
	public List<Map<String, Integer>> getPrice(Map<String, String> info) {//상세검색에서 실행되는것
		if(info.get("location").contains("지역")) {
			return houseMapDAO.getAllPrice(info);
		}
		else if(!info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { //상세지역과 체크아웃 둘 다 설정
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

	@Override
	public List<House_InfoVO> searchIndex(Map<String, String> info) {
		if(info.get("location").contains("지역")) {
			System.out.println("전체지역 선택");
			return houseMapDAO.searchIndexAll(info);
		}
		else if(!info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { //상세지역과 체크아웃 둘 다 설정
			System.out.println("상세지역과 체크아웃 둘 다 설정");
			return houseMapDAO.searchIndexWithBoth(info);
		}
		else if(!info.get("detail").contains("선택") && info.get("checkOut").equals("")) { // 체크인 체크아웃 선택 x 상세지역 선택
			System.out.println("체크인 체크아웃 선택 x 상세지역 선택");
			return houseMapDAO.searchIndexWithDetail(info);
		}
		else if(info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { // 체크인 체크아웃 선택하고 상세지역 선택x
			System.out.println("체크인 체크아웃 선택하고 상세지역 선택x");
			return houseMapDAO.searchIndexWithCheckOut(info);
		}
		else {	// 둘 다 설정하지 않은 상태
			System.out.println("큰 지역만 선택함");
			return houseMapDAO.searchIndex(info);
		}
	}

	@Override
	public List<Map<String, Integer>> searchIndexPrice(Map<String, String> info) {
		if(info.get("location").contains("지역")) {
			System.out.println("전체지역 선택");
			return houseMapDAO.searchIndexAllPrice(info);
		}
		else if(!info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { //상세지역과 체크아웃 둘 다 설정
			System.out.println("상세지역과 체크아웃 둘 다 설정");
			return houseMapDAO.searchIndexWithBothPrice(info);
		}
		else if(!info.get("detail").contains("선택") && info.get("checkOut").equals("")) { // 체크인 체크아웃 선택 x 상세지역 선택
			System.out.println("체크인 체크아웃 선택 x 상세지역 선택");
			return houseMapDAO.searchIndexWithDetailPrice(info);
		}
		else if(info.get("detail").contains("선택") && !info.get("checkOut").equals("")) { // 체크인 체크아웃 선택하고 상세지역 선택x
			System.out.println("체크인 체크아웃 선택하고 상세지역 선택x");
			return houseMapDAO.searchIndexWithCheckOutPrice(info);
		}
		else {	// 둘 다 설정하지 않은 상태
			System.out.println("큰 지역만 선택함");
			return houseMapDAO.searchIndexPrice(info);
		}
	}
	
	@Scheduled(cron="0 0 1 * * ?")
	public void updateMin() {
		List<House_InfoVO> list = houseMapDAO.notPopular(); //예약이 없는 house가지고 온다.
		System.out.println(list.size());
		houseMapDAO.savePopular(list); //popular TB에 저장
		houseMapDAO.updateMin(list); //교환해서 저장
	}

	public void updateBack(String seq) {
		System.out.println("도착");
		PopularVO vo = houseMapDAO.getDefaultPrices(seq); //popular TB에서 저장된 가격 가져오기
		System.out.println("해당 숙소의 vo: " +vo.toString());
		if(vo!=null) {
			System.out.println("인기 없는 숙소였다.");
			houseMapDAO.updateBack(vo); //해당 house가격 원래대로 돌려놓기
			houseMapDAO.deletePopular(seq); //popular TB에서 삭제
		}
	}

}
