package kg.air.cnc.controller.noticeop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kg.air.cnc.service.noticeop.NoticeService;
import kg.air.cnc.vo.BoardVO;
import kg.air.cnc.vo.PageMaker;
import kg.air.cnc.vo.PagingCriteria;

@Controller
@SessionAttributes("notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

		@RequestMapping("/selectBoardList.do")
		public String openBoardList(PagingCriteria cri, Model model) {
		        
		        
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(noticeService.countBoardListTotal());
		    List<BoardVO> boardList = noticeService.selectBoardList(cri);
		    model.addAttribute("boardList",boardList);
		    model.addAttribute("paging",pageMaker);
		  
		        
		    //return "noticeBoardList";
		    return "getNoticeList";    
		}
	
		

	
}
