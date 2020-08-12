package kg.air.cnc.service.admin;

import kg.air.cnc.vo.AdminVO;

public interface AdminService {
	// 관리자 로그인을 체크하는 메서드.
	public AdminVO loginCheck(String admin_id)throws Exception;
}
