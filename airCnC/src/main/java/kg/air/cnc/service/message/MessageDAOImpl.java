package kg.air.cnc.service.message;

import java.util.List;
import java.util.Map;

import kg.air.cnc.vo.MessageVO;

public interface MessageDAOImpl {
	public void insertMessage(MessageVO vo);
	public List<MessageVO> getChatList(String id);
	public List<MessageVO> getMessageList(Map<String, String> map);
	public List<MessageVO> getMessageListToAdmin(Map<String, String> map); 
}
