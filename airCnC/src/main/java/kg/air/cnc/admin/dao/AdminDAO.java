package kg.air.cnc.admin.dao;

import kg.air.cnc.admin.vo.AdminVO;

public interface AdminDAO {
	boolean loginCheck(AdminVO adminVO)throws Exception; // 로그인을 체크하는 메서드.
}
