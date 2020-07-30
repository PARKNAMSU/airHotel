package kg.air.cnc.dao.message;

import java.util.List;
import java.util.Map;

import kg.air.cnc.vo.MessageVO;

public interface MessageServiceImpl {
	public void insertMessage(MessageVO vo);
	public List<MessageVO> getChatList(String id);
	public List<MessageVO> getMessageList(Map<String,String> map);
}
