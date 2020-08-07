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
	public AdminVO loginCheck(String admin_id) throws Exception {
		return adminDAO.loginCheck(admin_id);
	}
}