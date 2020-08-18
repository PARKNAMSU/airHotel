package kg.air.cnc.dao.blacklist;

import kg.air.cnc.vo.BlackUserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;

@Repository("blackListDao")
public class BlackListDAOImpl implements BlackListDAO{

    @Autowired
    private SqlSession sqlSession;

    public ArrayList<BlackUserVO> getBlackList(){
        try{
            BlackListDAO blackListDAO = sqlSession.getMapper(BlackListDAO.class);
            return blackListDAO.getBlackList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public BlackUserVO getBlackSearchId(String blackSearchEmail) {
        BlackUserVO blackUserVO = sqlSession.selectOne("kg.air.cnc.dao.blacklist.BlackListDAO.getBlackSearchId", blackSearchEmail);
        return blackUserVO;
    }

    public void deleteBlackList(String blackEmail) {
        sqlSession.delete("kg.air.cnc.dao.blacklist.BlackListDAO.deleteBlackList", blackEmail);
    }

    @Override
    public int[] getBlackListCount() {
        int countArr[] = new int [3];
        countArr[0] = sqlSession.selectOne("kg.air.cnc.dao.blacklist.BlackListDAO.getWeeklyAddedBlackList");
        countArr[1] = sqlSession.selectOne("kg.air.cnc.dao.blacklist.BlackListDAO.getMonthlyAddedBlackList");
        countArr[2] = sqlSession.selectOne("kg.air.cnc.dao.blacklist.BlackListDAO.getTotalBlackList");
        return countArr;
    }
}
