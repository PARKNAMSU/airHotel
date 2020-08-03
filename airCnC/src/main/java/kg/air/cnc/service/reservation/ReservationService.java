package kg.air.cnc.service.reservation;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.reservation.ReservationDAO;
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
		ReservationHouseDetailVO house = reservationDAO.getReservationHouse(vo);
		ArrayList<String> convinList = new ArrayList<String>();
		if(house.getHouse_default_aidkit().trim().equals("true")) convinList.add("���޻���");
		
		if(house.getHouse_default_bedrock().trim().equals("true")) convinList.add("ħ�����");
		
		if(house.getHouse_default_coditecter().trim().equals("true")) convinList.add("�ϻ�ȭź�� ������");
		
		if(house.getHouse_default_cooler().trim().equals("true")) convinList.add("�ù���ġ");
		
		if(house.getHouse_default_fireditecter().trim().equals("true")) convinList.add("ȭ�簨����");
		
		if(house.getHouse_default_firesofwa().trim().equals("true")) convinList.add("��ȭ��");
		
		if(house.getHouse_default_gym().trim().equals("true")) convinList.add("ü����");
		
		if(house.getHouse_default_heater().trim().equals("true")) convinList.add("�����");
		
		if(house.getHouse_default_iron().trim().equals("true")) convinList.add("�ٸ���");
		
		if(house.getHouse_default_kitchen().trim().equals("true")) convinList.add("�ֹ�");
		
		if(house.getHouse_default_laundry_dryer().trim().equals("true")) convinList.add("������");
		
		if(house.getHouse_default_laundry_washer().trim().equals("true")) convinList.add("��Ź��");
		
		if(house.getHouse_default_livingroom_type().trim().equals("true")) convinList.add("�ܵ��Ž�");
		
		if(house.getHouse_default_parking().trim().equals("true")) convinList.add("������");
		
		if(house.getHouse_default_pool().trim().equals("true")) convinList.add("������");
		
		if(house.getHouse_default_tv().trim().equals("true")) {
			convinList.add("TV");
			System.out.println("tv");
		}
		
		if(house.getHouse_default_wifi().trim().equals("true")) convinList.add("Wifi");
		
		if(house.getHouse_defaultsetting().trim().equals("true")) convinList.add("�ʼ�ǰ��");
		house.setConvinList(convinList);
		
		ArrayList<String> conditionList = new ArrayList<String>();
		if(house.getHouse_condition_babyok().trim().equals("true"))conditionList.add("���� ���� ����");
		if(house.getHouse_condition_childok().trim().equals("true"))conditionList.add("��� ���� ����");
		if(house.getHouse_condition_partyok().trim().equals("true"))conditionList.add("��Ƽ ���");
		if(house.getHouse_condition_smokeok().trim().equals("true"))conditionList.add("�� ����");
		if(house.getHouse_condition_petok().trim().equals("true"))conditionList.add("�ֿϵ��� ���� ����");
		house.setConditionList(conditionList);
		ArrayList<String> restrictList = new ArrayList<String>();
		if(house.getHouse_restrict_beast().trim().equals("true"))restrictList.add("���� ���� ����");
		if(house.getHouse_restrict_cantpark().trim().equals("true"))restrictList.add("�ǹ� �� ���� ����");
		if(house.getHouse_restrict_cctv().trim().equals("true"))restrictList.add("CCTV ����");
		if(house.getHouse_restrict_commonspace().trim().equals("true"))restrictList.add("�Ϻ� ������� ����");
		if(house.getHouse_restrict_facility().trim().equals("true"))restrictList.add("���ǽü� ����");
		if(house.getHouse_restrict_pet().trim().equals("true"))restrictList.add("���ҿ� �ݷ����� ����");
		if(house.getHouse_restrict_noise().trim().equals("true"))restrictList.add("���� �߻��� �� ����");
		if(house.getHouse_restrict_stairs().trim().equals("true"))restrictList.add("��� �̿��ؾ���");
		if(house.getHouse_restrict_weapon().trim().equals("true"))restrictList.add("���� ����");
		house.setRestricList(restrictList);
		return house;
	}

}
