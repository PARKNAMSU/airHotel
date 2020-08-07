package kg.air.cnc.admin.dao;

import kg.air.cnc.admin.vo.AdminVO;

public interface AdminDAO {
	public AdminVO loginCheck(String admin_id)throws Exception; // 로그인을 체크하는 메서드.
}
