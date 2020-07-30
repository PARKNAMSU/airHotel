package kg.air.cnc.log.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.log.LogDAO;
import kg.air.cnc.vo.LogVO;

@Service
public class LogService implements LogServiceImpl{
	
	@Autowired
	LogDAO logDAO;
	
	public List<LogVO> getLogList(LogVO vo){
		return logDAO.getLogList(vo);
	}
}
