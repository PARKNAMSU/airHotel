package kg.air.cnc.dao.blame;

import kg.air.cnc.vo.CustomerVO;
import kg.air.cnc.vo.HostVO;
import kg.air.cnc.vo.blame.BlameVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Map;

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

    @Override
    public CustomerVO getCustomerBlameInfo(String target_member_id) {
        BlameDAO blameDAO = sqlSession.getMapper(BlameDAO.class);
        return blameDAO.getCustomerBlameInfo(target_member_id);
    }

    @Override
    public HostVO getHostBlameInfo(String target_member_id) {
        BlameDAO blameDAO = sqlSession.getMapper(BlameDAO.class);
        return blameDAO.getHostBlameInfo(target_member_id);
    }

    @Override
    public void insertBlameWarnMessage(Map<String, String> map) {
        sqlSession.insert("kg.air.cnc.dao.blame.BlameDAO.insertBlameWarnMessage", map);
    }

    @Override
    public void deleteBlame(Map<String, String> deleteBlameMap) {
        sqlSession.delete("kg.air.cnc.dao.blame.BlameDAO.deleteBlame", deleteBlameMap);
    }

    @Override
    public void increaseCustomerBlameWarn(String target_member_id) {
        sqlSession.update("kg.air.cnc.dao.blame.BlameDAO.increaseCustomerBlameWarn", target_member_id);
    }

    @Override
    public void increaseHostBlameWarn(String target_member_id) {
        sqlSession.update("kg.air.cnc.dao.blame.BlameDAO.increaseHostBlameWarn", target_member_id);
    }

    @Override
    public void addBlackList(String id) {
        sqlSession.insert("kg.air.cnc.dao.blame.BlameDAO.addBlackList", id);
    }
}
