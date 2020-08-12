package kg.air.cnc.service.cupon;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public CuponVO checkNumber(String cuponNumber) {
		return cuponDAO.checkNumber(cuponNumber);
	}
	
	@Override
	public List<CuponVO> getCuponList() {
		return cuponDAO.getCuponList();
	}
	
	//@Scheduled(cron="0 0 1 * * ?")
	public void deleteCupon() {
		//자동으로 날짜 지난 쿠폰 삭제
		cuponDAO.deleteCupon();
	}

}
