package kg.air.cnc.service.reservation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.common.Utils;
import kg.air.cnc.dao.reservation.ReservationDAO;
import kg.air.cnc.vo.BlameVO;
import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;
import kg.air.cnc.vo.ReservationVO;

@Service
public class ReservationService implements ReservationServiceImpl {

	@Autowired
	ReservationDAO reservationDAO;
	
	@Override
	public List<ReservationHouseDetailVO> getMyReservation(String id) {
		List<ReservationHouseDetailVO> list = reservationDAO.getMyReservation(id);
		String name = "";
		for(int i=0;i<list.size();i++) {
			name = list.get(i).getHouse_name();
			if(name.length() >10)name = name.substring(0,8)+"...";
			list.get(i).setHouse_name(name);
			if(list.get(i).getReservation_status() == 0) {
				list.get(i).setReservation_status_text("예약상태: 정상");
			}
			if(list.get(i).getReservation_status() == 1) {
				list.get(i).setReservation_status_text("예약상태: 취소대기");
			}
		}
		return list;
	}

	@Override
	public List<ReservationHouseDetailVO> getMyReservationBefore(String id) {
		List<ReservationHouseDetailVO> list = reservationDAO.getMyReservationBefore(id);
		String name = "";
		for(int i=0;i<list.size();i++) {
			name = list.get(i).getHouse_name();
			if(name.length() >10)name = name.substring(0,8)+"...";
			list.get(i).setHouse_name(name);
		}
		return list;
	}

	@Override
	public ReservationHouseDetailVO getReservationHouse(ReservationHouseDetailVO vo) {
		System.out.println("vo "+vo.getHouse_seq());
		ReservationHouseDetailVO house = null;
		house = reservationDAO.getReservationHouse(vo);
		ArrayList<String> convinList = new ArrayList<String>();
		Utils utils = new Utils();
		if(!utils.stringNullCheck(house.getHouse_name())) {
			if(house.getHouse_default_aidkit().trim().equals("true")) convinList.add("구급상자");
			
			if(house.getHouse_default_bedrock().trim().equals("true")) convinList.add("침실 잠금");
			
			if(house.getHouse_default_coditecter().trim().equals("true")) convinList.add("일산화탄소 감지기");
			
			if(house.getHouse_default_cooler().trim().equals("true")) convinList.add("냉방기");
			
			if(house.getHouse_default_fireditecter().trim().equals("true")) convinList.add("화재 경보기");
			
			if(house.getHouse_default_firesofwa().trim().equals("true")) convinList.add("소화기");
			
			if(house.getHouse_default_gym().trim().equals("true")) convinList.add("체육관");
			
			if(house.getHouse_default_heater().trim().equals("true")) convinList.add("난방기");
			
			if(house.getHouse_default_iron().trim().equals("true")) convinList.add("다리미");
			
			if(house.getHouse_default_kitchen().trim().equals("true")) convinList.add("주방");
			
			if(house.getHouse_default_laundry_dryer().trim().equals("true")) convinList.add("건조기");
			
			if(house.getHouse_default_laundry_washer().trim().equals("true")) convinList.add("세탁기");
			
			if(house.getHouse_default_livingroom_type().trim().equals("true")) convinList.add("단독거실");
			
			if(house.getHouse_default_parking().trim().equals("true")) convinList.add("주차장");
			
			if(house.getHouse_default_pool().trim().equals("true")) convinList.add("수영장");
			
			if(house.getHouse_default_tv().trim().equals("true")) {
				convinList.add("TV");
				System.out.println("tv");
			}
			
			if(house.getHouse_default_wifi().trim().equals("true")) convinList.add("Wifi");
			
			if(house.getHouse_defaultsetting().trim().equals("true")) convinList.add("필수 품목 보유");
			house.setConvinList(convinList);
			
			ArrayList<String> conditionList = new ArrayList<String>();
			if(house.getHouse_condition_babyok().trim().equals("true"))conditionList.add("유아 숙박 적합");
			if(house.getHouse_condition_childok().trim().equals("true"))conditionList.add("어린이 숙박 적합");
			if(house.getHouse_condition_partyok().trim().equals("true"))conditionList.add("파티 가능");
			if(house.getHouse_condition_smokeok().trim().equals("true"))conditionList.add("흡연가능");
			if(house.getHouse_condition_petok().trim().equals("true"))conditionList.add("애완동물 출입 가능");
			house.setConditionList(conditionList);
			ArrayList<String> restrictList = new ArrayList<String>();
			if(house.getHouse_restrict_beast().trim().equals("true"))restrictList.add("위험동물 주의");
			if(house.getHouse_restrict_cantpark().trim().equals("true"))restrictList.add("건물 내 주차불가");
			if(house.getHouse_restrict_cctv().trim().equals("true"))restrictList.add("CCTV 보유");
			if(house.getHouse_restrict_commonspace().trim().equals("true"))restrictList.add("공용 공간 존재");
			if(house.getHouse_restrict_facility().trim().equals("true"))restrictList.add("편의시설 사용 제한");
			if(house.getHouse_restrict_pet().trim().equals("true"))restrictList.add("애완동물 보유");
			if(house.getHouse_restrict_noise().trim().equals("true"))restrictList.add("소음 발생할 수 있음");
			if(house.getHouse_restrict_stairs().trim().equals("true"))restrictList.add("계단 이용해야 함");
			if(house.getHouse_restrict_weapon().trim().equals("true"))restrictList.add("무기 소유");
			house.setRestricList(restrictList);
		}
		return house;
	}

	@Override
	public void insertBlameHost(BlameVO vo) {
		reservationDAO.insertBlameHost(vo);
		
	}

	@Override
	public void rollbackReservationCancel(ReservationHouseDetailVO vo) {
		reservationDAO.rollbackReservationCancel(vo);
	}

	@Override
	public void cancelReservation(ReservationHouseDetailVO vo) {
		reservationDAO.cancelReservation(vo);
	}

	@Override
	public String getFavoriteHouse(String id,int house_seq) {
		String favorite_state = "false";
		System.out.println("id:"+id);
		String fav_list = "";
		fav_list = reservationDAO.getFavoriteHouse(id);
		if(!fav_list.equals("-1")) {
			String [] favoriteList =  reservationDAO.getFavoriteHouse(id).split(",");
			for(int i=0;i<favoriteList.length;i++) {
				if(Integer.parseInt(favoriteList[i]) == house_seq) {
					favorite_state = "true";
					break;
				}
			}
		}
		return favorite_state;
	}
	public String getFavoriteHouseNumber(String id) {
		return reservationDAO.getFavoriteHouse(id);
	}
	@Override
	public void addFavoriteHouse(CustomerVO vo) {
		vo.setFavorite_house(","+vo.getFavorite_house());
		reservationDAO.addFavoriteHouse(vo);
	}

	@Override
	public void removeFavoriteHouse(String id,String favorite, int house_seq) {
		CustomerVO vo = new CustomerVO();
		vo.setCustomer_id(id);
		String fav = ","+house_seq;
		vo.setFavorite_house(favorite.replace(fav, ""));
		reservationDAO.removeFavoriteHouse(vo);
	}

	@Override
	public List<ReservationHouseDetailVO> getResForSpecHouse(Integer house_seq) {
		return reservationDAO.getResForSpecHouse(house_seq);
	}
	public List<ReservationHouseDetailVO> getMyFavoriteHouse(String id){
		String [] fav_list = reservationDAO.getFavoriteHouse(id).split(",");
		List<Integer> numList = new ArrayList<Integer>();
		for(int i=0; i<fav_list.length;i++) {
			if(i != 0) {
				numList.add(Integer.parseInt(fav_list[i]));
			}
		}
		Map<String, Object> seqMap = new HashMap<String, Object>();
		seqMap.put("seqArray", numList);
		return reservationDAO.getFavoriteHouse(seqMap);
	}

}
