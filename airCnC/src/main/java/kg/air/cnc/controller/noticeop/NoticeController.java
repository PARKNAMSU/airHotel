package kg.air.cnc.controller.noticeop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kg.air.cnc.service.noticeop.NoticeService;
import kg.air.cnc.vo.BoardVO;
import kg.air.cnc.vo.PageMaker;
import kg.air.cnc.vo.PagingCriteria;

@Controller
@SessionAttributes({"notice", "detail"})
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	@ModelAttribute("notice")
	public BoardVO setEmptySawon() {
		return new BoardVO();
	}

		@RequestMapping("/selectBoardList.do")// 유저의 공지사항 리스트
		public String openBoardList(PagingCriteria cri, Model model) {
		        
		    PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(noticeService.countBoardListTotal());
		    List<BoardVO> boardList = noticeService.selectBoardList(cri);
		    model.addAttribute("boardList",boardList);
		    model.addAttribute("paging",pageMaker);
		  
		    return "getNoticeList";    
		}
	
		@RequestMapping("/addNoticeList.do")//새 공지 등록하는 페이지에서의 동작
		public String addBoard(@ModelAttribute("board") BoardVO board, Model model) {
			noticeService.insertBoard(board);
			System.out.println(board.toString());
			return "redirect:/goNoticeListAdmin.do";
		}
		
		@RequestMapping("/goaddNotice.do")//관리자가 새 공지 등록하는 페이지이동
		public String gotoaddBoard(@ModelAttribute("board") BoardVO board, Model model) {
			return "addNoticeList";
		}
		
		@RequestMapping("/goNoticeListAdmin.do")//관리자의 공지사항 리스트
		public String goNoticeListAdmin(PagingCriteria cri, Model model) {
			 PageMaker pageMaker = new PageMaker();
			 pageMaker.setCri(cri);
			 pageMaker.setTotalCount(noticeService.countBoardListTotal());
			 List<BoardVO> boardList = noticeService.getNoticeListAdmin(cri);
			 model.addAttribute("boardList",boardList);
			 model.addAttribute("paging",pageMaker);
			
			return "getNoticeListAdmin";
		}
		
		@RequestMapping(value = "/detail/{idx}.do")//관리자가 공지사항 목록 클릭해서 들어감.
		public String detail(@PathVariable("idx") int idx, Model model, PagingCriteria cri) throws Exception {
			System.out.println("idx : " + idx);
			model.addAttribute("detail", noticeService.detailNotice(idx));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			model.addAttribute("page", cri.getPage());
			model.addAttribute("paging", pageMaker);
			return "addNoticeListModi";
		}
		
		@RequestMapping("/update.do")//목록 클릭해서 들어가면 있는 수정 기능
		public String update(BoardVO vo, Model model, PagingCriteria cri){
			noticeService.updateNotice(vo);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			model.addAttribute("page", cri.getPage());
			model.addAttribute("paging", pageMaker);
			
			return "redirect:/goNoticeListAdmin.do";
		}
		
		@RequestMapping("/delete.do")//목록 클릭해서 들어가면 있는 삭제 기능
		public String delete(@RequestParam int idx, Model model, PagingCriteria cri){
			noticeService.deleteNotice(idx);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			model.addAttribute("page", cri.getPage());
			model.addAttribute("paging", pageMaker);
			
			return "redirect:/goNoticeListAdmin.do";
		}
	
}
