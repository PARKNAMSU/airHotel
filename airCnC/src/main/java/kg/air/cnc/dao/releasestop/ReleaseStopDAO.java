package kg.air.cnc.dao.releasestop;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReleaseStopDAO {

    @Autowired
    SqlSession sqlSession;

    public void setHostStopRelease(){
        sqlSession.update("kg.air.cnc.dao.releasestop.ReleaseStopDAO.setHostStopRelease");
    }

    public void setHouseStopRelease(){
        sqlSession.update("kg.air.cnc.dao.releasestop.ReleaseStopDAO.setHouseStopRelease");
    }

    public void setCustomerStopRelease(){
        sqlSession.update("kg.air.cnc.dao.releasestop.ReleaseStopDAO.setCustomerStopRelease");
    }


}
