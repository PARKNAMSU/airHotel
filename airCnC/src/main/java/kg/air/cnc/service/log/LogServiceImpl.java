package kg.air.cnc.service.log;

import java.util.List;

import kg.air.cnc.vo.LogVO;

public interface LogServiceImpl {
	public List<LogVO> getLogList(LogVO vo);
	public List<LogVO> getLogListForId(LogVO vo);
	public void deleteLog(LogVO vo);
	public void deleteLogWithId(LogVO vo);
}
