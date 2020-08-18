package kg.air.cnc.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kg.air.cnc.dao.log.LogDAO;
import kg.air.cnc.vo.LogVO;

@Component
public class Utils {
	@Autowired
	private LogDAO logDAO;
	public boolean stringNullCheck(String str) {
		return str == null || str.trim().isEmpty();
	}
	public void addLogProcess(String id,String content, String type) {
		LogVO vo = new LogVO(id,content,type);
		logDAO.addLog(vo);
	}
}
