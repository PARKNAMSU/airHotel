package kg.air.cnc.log.service;

import java.util.List;

import kg.air.cnc.vo.LogVO;

public interface LogServiceImpl {
	public List<LogVO> getLogList(LogVO vo);
}
