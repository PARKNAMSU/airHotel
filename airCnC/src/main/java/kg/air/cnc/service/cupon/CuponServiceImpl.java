package kg.air.cnc.service.cupon;

import java.util.List;

import org.springframework.stereotype.Service;

import kg.air.cnc.dao.cupon.CuponDAOImpl;
import kg.air.cnc.vo.CuponVO;

@Service
public class CuponServiceImpl implements CuponService {
	
	//@Autowired
	private CuponDAOImpl cuponDAO;
	/*
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
	*/
	@Override
	public List<CuponVO> getCuponList(String id) {
		return cuponDAO.getCuponList(id);
	}
	
	//@Scheduled(cron="0 0 1 * * ?")
	public void deleteCupon() {
		cuponDAO.deleteCupon();
	}

}
