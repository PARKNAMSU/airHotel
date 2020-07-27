package kg.air.cnc.dao.blame;

import kg.air.cnc.vo.blame.BlameVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository("blameDAO")
public class BlameDAOImpl implements BlameDAO{

    @Autowired
    SqlSession sqlSession;

    public ArrayList<BlameVO> getBlameList() {
        BlameDAO blameDAO = sqlSession.getMapper(BlameDAO.class);
        return blameDAO.getBlameList();
    }

    public ArrayList<BlameVO> getBlameInfo(String target_member_id){
        BlameDAO blameDAO = sqlSession.getMapper(BlameDAO.class);
        return blameDAO.getBlameInfo(target_member_id);
    }

}
