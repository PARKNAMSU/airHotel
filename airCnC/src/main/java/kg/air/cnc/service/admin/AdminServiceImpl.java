package kg.air.cnc.service.admin;

import javax.inject.Inject;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.admin.AdminDAO;
import kg.air.cnc.vo.AdminVO;
@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	AdminDAO adminDAO;

	@Override // 로그인 체크 관련 메서드 (세션에 아이디와 비밀번호를 저장함)
	public AdminVO loginCheck(String admin_id) throws Exception {
		return adminDAO.loginCheck(admin_id);
	}

	@Override
	public void updateLoginStatus(String id) {
		adminDAO.updateLoginStatus(id);
		
	}

	@Override
	public void updateLogoutStatus(String id) {
		adminDAO.updateLogoutStatus(id);
		
	}
}