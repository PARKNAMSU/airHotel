package kg.air.cnc.service.comments;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kg.air.cnc.dao.comments.CommentsDAO;
import kg.air.cnc.vo.CommentsVO;

@Service
public class CommentsService implements CommentsServiceImpl{
	@Autowired
	CommentsDAO commentsDAO;
	@Override
	public void insertComments(CommentsVO vo) {
		commentsDAO.insertComments(vo);
	}
	@Override
	public List<CommentsVO> getComments(CommentsVO vo) {
		List<CommentsVO> list = commentsDAO.getComments(vo);
		DateFormat format = new SimpleDateFormat("YYYY/MM/dd");
		for(int i=0;i<list.size();i++) {
			list.get(i).setComments_date(format.format(list.get(i).getComments_regdate()));
			System.out.println(list.get(i).getComments_date());
		}
		return list;
	}

}
