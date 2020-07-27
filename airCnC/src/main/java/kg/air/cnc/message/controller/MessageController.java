package kg.air.cnc.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.message.dao.MessageService;
import kg.air.cnc.vo.MessageVO;

@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	
	@RequestMapping(value="/insertMessage.do")
	public ModelAndView insertMessageController(MessageVO vo,ModelAndView mav) {
		messageService.insertMessage(vo);
		mav.addObject("message_to_id",vo.getMessage_to_id());
		mav.setViewName("redirect:message.do");
		return mav;
	}
	@RequestMapping(value = "/chat.do")
	public ModelAndView chatController(HttpSession session, ModelAndView mav) {
		session.setAttribute("id", "skatn");
		String id = (String)session.getAttribute("id");
		List<MessageVO> messageList = messageService.getChatList(id);
		mav.addObject("messageList",messageList);
		mav.setViewName("chat");
		return mav;
	}
	@RequestMapping(value="/message.do")
	public ModelAndView messageController(HttpSession session,@RequestParam(value="message_to_id", required=false) String message_to_id, ModelAndView mav) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("fromId", (String)session.getAttribute("id"));
		map.put("toId", message_to_id);
		List<MessageVO> messageList = messageService.getMessageList(map);
		mav.addObject("messageList",messageList);
		mav.addObject("toId",message_to_id);
		mav.setViewName("chatpopup");
		return mav;
	}
}
