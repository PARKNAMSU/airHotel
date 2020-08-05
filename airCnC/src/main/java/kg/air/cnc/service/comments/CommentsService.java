package kg.air.cnc.service.comments;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.comments.CommentsDAO;
import kg.air.cnc.vo.CommentsVO;
import kg.air.cnc.vo.HouseVO;
import kg.air.cnc.vo.ReservationHouseDetailVO;

@Service
public class CommentsService implements CommentsServiceImpl{
	@Autowired
	CommentsDAO commentsDAO;
	@Override
	public void insertComments(CommentsVO vo) {
		commentsDAO.insertComments(vo);
	}
	@Override
	public List<CommentsVO> getComments(ReservationHouseDetailVO vo) {
		List<CommentsVO> list = commentsDAO.getComments(vo);
		DateFormat format = new SimpleDateFormat("YYYY/MM/dd");
		int sum = 0;
		for(int i=0;i<list.size();i++) {
			list.get(i).setComments_date(format.format(list.get(i).getComments_regdate()));
			sum+=list.get(i).getComments_rate();
		}
		float ave = ((float)sum)/list.size();
		list.get(0).setComments_average(Math.round(ave*100)/100);
		return list;
	}
	@Override
	public void deleteComments(CommentsVO vo) {
		commentsDAO.deleteComments(vo);
		
	}
	@Override
	public void updateComments(CommentsVO vo) {
		commentsDAO.updateComments(vo);
		
	}

}
