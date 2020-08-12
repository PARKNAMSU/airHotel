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
		messageService.insertMessage(vo);
		mav.addObject("message_to_id",vo.getMessage_to_id());
		mav.setViewName("redirect:message.do");
		return mav;
	}
	/*채팅페이지*/
	@RequestMapping(value = "/chat.do")
	public ModelAndView chatController(HttpSession session, ModelAndView mav) {
		session.setAttribute("login_session","skatn7979");//로그인 완료 시 제거
		String id = (String)session.getAttribute("login_session");
		List<MessageVO> messageList = messageService.getChatList(id);
		System.out.println("msize"+messageList.size());
		mav.addObject("messageList",messageList);
		mav.setViewName("chat");
		return mav;
	}
	/*채팅 메세지 페이지*/
	@RequestMapping(value="/message.do")
	public ModelAndView messageController(HttpSession session,@RequestParam(value="message_to_id", required=false) String message_to_id, ModelAndView mav) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("fromId", (String)session.getAttribute("login_session"));
		map.put("toId", message_to_id);
		List<MessageVO> messageList = messageService.getMessageList(map);
		if(messageList.size() > 0) {
			mav.addObject("messageList",messageList);
			System.out.println(messageList.get(0).getMessage_type());
			mav.addObject("toId",message_to_id);
			mav.setViewName("chatpopup");
		}else {
			MessageVO vo = new MessageVO();
			vo.setMessage_from_id((String)session.getAttribute("login_session"));
			vo.setMessage_to_id(message_to_id);
			mav.addObject("messageVO",vo);
			mav.setViewName("messagepopup");
		}
		return mav;
	}

}
