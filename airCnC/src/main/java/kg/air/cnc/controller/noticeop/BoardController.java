package kg.air.cnc.controller.noticeop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kg.air.cnc.service.noticeop.BoardService;
import kg.air.cnc.vo.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@ModelAttribute("board")
	public BoardVO setEmptySawon() {
		return new BoardVO();
	}
	
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model) {
		model.addAttribute("board", boardService.getBoard(vo));
		return "getNotice";
	}
	@RequestMapping("/getNoticeList.do")
	public String getBoardList(BoardVO vo, Model model) {
		model.addAttribute("boardList", boardService.getBoardList(vo)); 
		return "getNoticeList";
	}
	
	@RequestMapping("/addNoticeList.do")
	public String addBoard(@ModelAttribute("board") BoardVO board, Model model) {
		boardService.insertBoard(board);
		System.out.println(board.toString());
		return "redirect:/getNoticeList.do";
	}
	
	@RequestMapping("/goaddNotice.do")
	public String gotoaddBoard(@ModelAttribute("board") BoardVO board, Model model) {
		return "addNoticeList";
	}
}
