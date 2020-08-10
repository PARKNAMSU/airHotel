package kg.air.cnc.service.cupon;

import java.util.List;

import javax.servlet.http.HttpSession;

import kg.air.cnc.vo.CuponVO;

public interface CuponService {
	public void makeCupon(HttpSession session);
	public void useCupon(String cuponNumber);
	public CuponVO checkNumber(String cuponNumber);
	public List<CuponVO> getCuponList();
}
