package kg.air.cnc.service.cupon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import kg.air.cnc.dao.cupon.CuponDAOImpl;
import kg.air.cnc.vo.CuponVO;
//@Service
public class CuponServiceImpl implements CuponService {
	
	//@Autowired
	private CuponDAOImpl cuponDAO;

	@Override
	public void makeCupon(HttpSession session) {
		
	}

	@Override
	public void useCupon(String cuponNumber) {
		cuponDAO.useCupon(cuponNumber);
	}

	@Override
	public int checkNumber(String cuponNumber) {
		int result = cuponDAO.checkNumber(cuponNumber);
		if(result==0) return 0;
		else return 1;
	}
	
	@Override
	public List<CuponVO> getCuponList() {
		return cuponDAO.getCuponList();
	}
	
	//@Scheduled(cron="0 0 1 * * ?")
	public void deleteCupon() {
		//�ڵ����� ��¥ ���� ���� ����
		cuponDAO.deleteCupon();
	}

}
