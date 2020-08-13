package kg.air.cnc.dao.admin;

import kg.air.cnc.vo.AdminVO;

public interface AdminDAO {
	public AdminVO loginCheck(String admin_id)throws Exception; // 로그인을 체크하는 메서드.
	public void updateLoginStatus(String id);
	public void updateLogoutStatus(String id);
}
