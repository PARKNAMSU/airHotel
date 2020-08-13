package kg.air.cnc.service.cupon;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.cupon.CuponDAOImpl;
import kg.air.cnc.vo.CuponVO;

@Service
public class CuponServiceImpl implements CuponService {
	
	@Autowired
	private CuponDAOImpl cuponDAO;
	
	@Override
	public void makeCupon(Map<String, String> info) {
		if(info.get("rate").equals("")){
			cuponDAO.checkMoney(info);
		}
		else if(info.get("money").equals("")) {
			cuponDAO.checkRate(info);
		}
	}
	/*
	@Override
	public void useCupon(String cuponNumber) {
		cuponDAO.useCupon(cuponNumber);
	}
	*/
	
	@Override
	public List<CuponVO> getCuponList(String id) {
		return cuponDAO.getCuponList(id);
	}
	
	@Scheduled(cron="0 0 1 * * ?")
	public void deleteCupon() {
		cuponDAO.deleteCupon();
	}

}
