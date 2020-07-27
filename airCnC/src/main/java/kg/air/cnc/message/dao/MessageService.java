package kg.air.cnc.message.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.message.service.MessageDAO;
import kg.air.cnc.vo.MessageVO;

@Service
public class MessageService implements MessageServiceImpl{
	@Autowired
	private MessageDAO messageDAO;
	@Override
	public void insertMessage(MessageVO vo) {
		messageDAO.insertMessage(vo);
		
	}

	@Override
	public List<MessageVO> getChatList(String id) {
		List<MessageVO> list = messageDAO.getChatList(id);
		return list;
	}

	@Override
	public List<MessageVO> getMessageList(Map<String, String> map) {
		List<MessageVO> list = null;
		if(map.get("toId").equals("admin")) {
			list = messageDAO.getMessageListToAdmin(map);
		}else {
			list = messageDAO.getMessageList(map);
		}
		return list;
	}

	
}
