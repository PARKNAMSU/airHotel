package kg.air.cnc.admin.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import kg.air.cnc.admin.dao.AdminDAO;
import kg.air.cnc.admin.vo.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO adminDAO;

	@Override // 로그인 체크 관련 메서드 (세션에 아이디와 비밀번호를 저장함)
	public boolean loginCheck(AdminVO adminVO, HttpSession session) throws Exception {
		
		boolean result = adminDAO.loginCheck(adminVO);
		
		if (result) { // 로그인 성공.
			session.setAttribute("admin_id", adminVO.getAdminId());
			session.setAttribute("admin_password", adminVO.getAdminPassword());
		}
		return result;
	}
}