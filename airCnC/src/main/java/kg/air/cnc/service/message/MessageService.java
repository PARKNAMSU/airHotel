package kg.air.cnc.service.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.message.MessageDAO;
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
		Map<String,String> idList = new HashMap<String, String>();
		for(int i=0 ; i<list.size(); i++) {
			idList.put(list.get(i).getMessage_to_id(), list.get(i).getMessage_to_id());
		}
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getMessage_to_id().equals(id)) {
				if(!idList.containsKey(list.get(i).getMessage_from_id())) {
					Map<String, String> map = new HashMap<String, String>();
					map.put("from_id",list.get(i).getMessage_from_id());
					map.put("to_id",id);
					list.remove(i);
					list.add(i,messageDAO.getChatListSec(map));
				}else {
					list.remove(i);
				}
			}
		}
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
