package kg.air.cnc.dao.message;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kg.air.cnc.vo.MessageVO;

@Repository("messageDAO")
public class MessageDAO implements MessageDAOImpl{
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	@Override
	public void insertMessage(MessageVO vo) {
		sqlSessionTemplate.insert("MessageDAO.insertMessage",vo);
		
	}

	@Override
	public List<MessageVO> getChatList(String id) {
		return sqlSessionTemplate.selectList("MessageDAO.getChatList",id);
	}

	@Override
	public List<MessageVO> getMessageList(Map<String, String> map) {
		return sqlSessionTemplate.selectList("MessageDAO.getMessageList",map);
	}

	@Override
	public List<MessageVO> getMessageListToAdmin(Map<String, String> map) {
		
		return sqlSessionTemplate.selectList("MessageDAO.getMessageListTOAdmin",map);
	}
	

}
