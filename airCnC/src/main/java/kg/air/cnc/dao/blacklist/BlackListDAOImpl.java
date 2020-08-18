package kg.air.cnc.dao.blacklist;

import kg.air.cnc.vo.BlackUserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

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

    /*public BlackUserVO getSearchBlackUser(){
        sqlSession.selectOne("select")
    }*/
}
