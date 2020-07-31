package kg.air.cnc.admin.service;

import javax.servlet.http.HttpSession;
import kg.air.cnc.admin.vo.AdminVO;

public interface AdminService {
	// 관리자 로그인을 체크하는 메서드.
		boolean loginCheck(AdminVO adminVO, HttpSession session)throws Exception;
}
