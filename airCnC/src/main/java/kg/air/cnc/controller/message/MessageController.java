package kg.air.cnc.controller.message;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.message.MessageService;
import kg.air.cnc.vo.MessageVO;

@Controller
public class MessageController {
	@Autowired
	MessageService messageService;
	
	/*메세지 보내기*/
	@RequestMapping(value="/insertMessage.do")
	public ModelAndView insertMessageController(MessageVO vo,ModelAndView mav) {
		System.out.println(vo.getMessage_from_id());
		messageService.insertMessage(vo);
		mav.addObject("message_to_id",vo.getMessage_to_id());
		mav.setViewName("redirect:message.do");
		return mav;
	}
	/*채팅 리스트*/
	@RequestMapping(value = "/chat.do")
	public ModelAndView chatController(HttpSession session, ModelAndView mav) {
		session.setAttribute("login_session", "skatn");
		String id = (String)session.getAttribute("login_session");
		List<MessageVO> messageList = messageService.getChatList(id);
		mav.addObject("messageList",messageList);
		mav.setViewName("chat");
		return mav;
	}
	/*해당 인원과의 메세지 리스트*/
	@RequestMapping(value="/message.do")
	public ModelAndView messageController(HttpSession session,@RequestParam(value="message_to_id", required=false) String message_to_id, ModelAndView mav) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("fromId", (String)session.getAttribute("login_session"));
		map.put("toId", message_to_id);
		List<MessageVO> messageList = messageService.getMessageList(map);
		mav.addObject("messageList",messageList);
		System.out.println(messageList.get(0).getMessage_type());
		mav.addObject("toId",message_to_id);
		mav.setViewName("chatpopup");
		return mav;
	}

}
