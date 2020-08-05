package kg.air.cnc.dao.log;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.LogVO;

@Repository
public class LogDAO implements LogDAOImpl{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void addLog(LogVO vo) {
		sqlSessionTemplate.insert("LogDAO.insertLog",vo);
		
	}

	@Override
	public List<LogVO> getLogList(LogVO vo) {
		return sqlSessionTemplate.selectList("LogDAO.getLogList",vo);
	}

	@Override
	public List<LogVO> getLogListForId(LogVO vo) {
		return sqlSessionTemplate.selectList("LogDAO.getLogListForId",vo);
	}

	@Override
	public void deleteLog(LogVO vo) {
		sqlSessionTemplate.delete("LogDAO.deleteLog",vo);
		
	}

	@Override
	public void deleteLogWithId(LogVO vo) {
		sqlSessionTemplate.delete("LogDAO.deleteLogWithId",vo);
		
	}


	
}
