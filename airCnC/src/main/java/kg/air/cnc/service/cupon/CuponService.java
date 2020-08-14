package kg.air.cnc.service.cupon;

import java.util.List;
import java.util.Map;

import kg.air.cnc.vo.CuponVO;

public interface CuponService {
	public void makeCupon(Map<String, String> info);
	public void useCupon(String cuponNumber);
	public List<CuponVO> getCuponList(String id);
}
