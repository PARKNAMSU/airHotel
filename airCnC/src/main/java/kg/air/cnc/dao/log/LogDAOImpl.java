package kg.air.cnc.dao.log;

import java.util.List;

import kg.air.cnc.vo.LogVO;

public interface LogDAOImpl {
	public void addLog(LogVO vo);
	public List<LogVO> getLogList(LogVO vo);
}
