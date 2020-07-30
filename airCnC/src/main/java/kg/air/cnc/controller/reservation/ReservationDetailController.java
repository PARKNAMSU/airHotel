package kg.air.cnc.controller.reservation;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kg.air.cnc.service.comments.CommentsService;
import kg.air.cnc.vo.CommentsVO;

@Controller
public class ReservationDetailController {
	
	@Autowired
	CommentsService commentsService;
	@RequestMapping("myreservation.do")
	public ModelAndView myReservationController(ModelAndView mav) {
		mav.setViewName("myreservation");
		return mav;
	}
	@RequestMapping("reservationHouse.do")
	public ModelAndView reservationDetailController(CommentsVO vo,HttpSession session,ModelAndView mav) {
		session.setAttribute("session_login", "skatn");
		mav.addObject("commentsList",commentsService.getComments(vo));
		mav.addObject("comments_house_seq",vo.getComments_house_seq());
		System.out.println(vo.getComments_house_seq());
		mav.setViewName("reservationhouse");
		return mav;
	}
	@RequestMapping("rankpopup.do")
	public String openRankPopupController() {
		return "rankpopup";
	}
	@RequestMapping("insertComments.do")
	public ModelAndView insertCommentsController(CommentsVO vo,ModelAndView mav) {
		commentsService.insertComments(vo);
		mav.setViewName("redirect:reservationHouse.do");
		mav.addObject("comments_house_seq",vo.getComments_house_seq());
		return mav;
	}
	@RequestMapping("deleteComments.do")
	public ModelAndView deleteCommentsController(CommentsVO vo,ModelAndView mav) {
		commentsService.deleteComments(vo);
		mav.setViewName("redirect:reservationHouse.do");
		mav.addObject("comments_house_seq",vo.getComments_house_seq());
		return mav;
	}
}
