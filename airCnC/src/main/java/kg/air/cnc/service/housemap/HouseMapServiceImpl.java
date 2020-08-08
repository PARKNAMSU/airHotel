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
		if(info.get("location").contains("����")) {
			System.out.println("��ü���� ����");
			return houseMapDAO.getAll(info);
		}
		else if(!info.get("detail").contains("����") && !info.get("checkOut").equals("")) { //�������� üũ�ƿ� �� �� ����
			System.out.println("�������� üũ�ƿ� �� �� ����");
			return houseMapDAO.getDetailWithBoth(info);
		}
		else if(!info.get("detail").contains("����") && info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� ���� x ������ ����
			System.out.println("üũ�� üũ�ƿ� ���� x ������ ����");
			return houseMapDAO.getDetailWithDetail(info);
		}
		else if(info.get("detail").contains("����") && !info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� �����ϰ� ������ ����x
			System.out.println("üũ�� üũ�ƿ� �����ϰ� ������ ����x");
			return houseMapDAO.getDetailWithCheckOut(info);
		}
		else {	// �� �� �������� ���� ����
			System.out.println("�� �� �������� ����");
			return houseMapDAO.getDetail(info);
		}
	}
	
	@Override
	public List<Map<String, Integer>> getPrice(Map<String, String> info) {//�󼼰˻����� ����Ǵ°�
		if(info.get("location").contains("����")) {
			return houseMapDAO.getAllPrice(info);
		}
		else if(!info.get("detail").contains("����") && !info.get("checkOut").equals("")) { //�������� üũ�ƿ� �� �� ����
			System.out.println("�������� üũ�ƿ� �� �� ����");
			return houseMapDAO.getDetailWithBothPrice(info);
		}
		else if(!info.get("detail").contains("����") && info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� ���� x ������ ����
			System.out.println("üũ�� üũ�ƿ� ���� x ������ ����");
			return houseMapDAO.getDetailWithDetailPrice(info);
		}
		else if(info.get("detail").contains("����") && !info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� �����ϰ� ������ ����x
			System.out.println("üũ�� üũ�ƿ� �����ϰ� ������ ����x");
			return houseMapDAO.getDetailWithCheckOutPrice(info);
		}
		else {	// �� �� �������� ���� ����
			System.out.println("�� �� �������� ����");
			return houseMapDAO.getPrice(info);
		}
	}

	@Override
	public List<House_InfoVO> searchIndex(Map<String, String> info) {
		if(info.get("location").contains("����")) {
			System.out.println("��ü���� ����");
			return houseMapDAO.searchIndexAll(info);
		}
		else if(!info.get("detail").contains("����") && !info.get("checkOut").equals("")) { //�������� üũ�ƿ� �� �� ����
			System.out.println("�������� üũ�ƿ� �� �� ����");
			return houseMapDAO.searchIndexWithBoth(info);
		}
		else if(!info.get("detail").contains("����") && info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� ���� x ������ ����
			System.out.println("üũ�� üũ�ƿ� ���� x ������ ����");
			return houseMapDAO.searchIndexWithDetail(info);
		}
		else if(info.get("detail").contains("����") && !info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� �����ϰ� ������ ����x
			System.out.println("üũ�� üũ�ƿ� �����ϰ� ������ ����x");
			return houseMapDAO.searchIndexWithCheckOut(info);
		}
		else {	// �� �� �������� ���� ����
			System.out.println("ū ������ ������");
			return houseMapDAO.searchIndex(info);
		}
	}

	@Override
	public List<Map<String, Integer>> searchIndexPrice(Map<String, String> info) {
		if(info.get("location").contains("����")) {
			System.out.println("��ü���� ����");
			return houseMapDAO.searchIndexAllPrice(info);
		}
		else if(!info.get("detail").contains("����") && !info.get("checkOut").equals("")) { //�������� üũ�ƿ� �� �� ����
			System.out.println("�������� üũ�ƿ� �� �� ����");
			return houseMapDAO.searchIndexWithBothPrice(info);
		}
		else if(!info.get("detail").contains("����") && info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� ���� x ������ ����
			System.out.println("üũ�� üũ�ƿ� ���� x ������ ����");
			return houseMapDAO.searchIndexWithDetailPrice(info);
		}
		else if(info.get("detail").contains("����") && !info.get("checkOut").equals("")) { // üũ�� üũ�ƿ� �����ϰ� ������ ����x
			System.out.println("üũ�� üũ�ƿ� �����ϰ� ������ ����x");
			return houseMapDAO.searchIndexWithCheckOutPrice(info);
		}
		else {	// �� �� �������� ���� ����
			System.out.println("ū ������ ������");
			return houseMapDAO.searchIndexPrice(info);
		}
	}
	
	

}
