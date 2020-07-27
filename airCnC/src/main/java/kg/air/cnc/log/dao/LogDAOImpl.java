package kg.air.cnc.log.dao;

import java.util.List;

import kg.air.cnc.vo.LogVO;

public interface LogDAOImpl {
	public void addLog(LogVO vo);
	public List<LogVO> getLogList(LogVO vo);
}
