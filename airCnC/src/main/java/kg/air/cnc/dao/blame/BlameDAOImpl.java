package kg.air.cnc.dao.blame;

import kg.air.cnc.vo.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
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

    @Override // host_blame_stop 증가
    public void increaseHostBlameStop(String host_id) {
        sqlSession.update("kg.air.cnc.dao.blame.BlameDAO.increaseHostBlameStop", host_id);
    }

    @Override // customer_blame_stop 증가
    public void increaseCustomerBlameStop(String customer_id) {
        sqlSession.update("kg.air.cnc.dao.blame.BlameDAO.increaseCustomerBlameStop", customer_id);

    }

    @Override
    public void addBlackList(String id) {
        sqlSession.insert("kg.air.cnc.dao.blame.BlameDAO.addBlackList", id);
    }

    @Override // host 가 가지고 있는 하우스 리스트 뽑아오는 기능
    public List<HouseVO> getHostHouses(String host_id) {
        //host id를 통해 host 가 가지고있는 house 의 house_seq 를 뽑아옴
        List<HouseVO> houseList = sqlSession.selectList("kg.air.cnc.dao.blame.BlameDAO.getHostHouses", host_id);
        return houseList;
    }

    @Override
    public void setHouseStatusStop(HouseVO house) {
        sqlSession.update("kg.air.cnc.dao.blame.BlameDAO.setHouseStatusStop", house);
    }

    @Override
    public List<ReservationVO> getReservationByHostId(String host_id) {
        List<ReservationVO> reservationList =  sqlSession.selectList("kg.air.cnc.dao.blame.BlameDAO.getReservationByHostId", host_id);
        return reservationList;
    }

    @Override
    public List<ReservationVO> getReservationByCustomerId(String customer_id) {
        List<ReservationVO> reservationList = sqlSession.selectList("kg.air.cnc.dao.blame.BlameDAO.getReservationByCustomerId", customer_id);
        return reservationList;
    }

    public void sendCustomerReservationCancelMessage(String to_id) { // 예약해놓은 사람들에게 message 전송
        sqlSession.insert("kg.air.cnc.dao.blame.BlameDAO.sendCustomerReservationCancelMessage", to_id);
    }

    @Override
    public void sendHostReservationCacelMessage(String to_id) {
        sqlSession.insert("kg.air.cnc.dao.blame.BlameDAO.sendHostReservationCacelMessage", to_id);
    }

    @Override
    public void setReservationStatusRefund(String host_id) {
        sqlSession.update("kg.air.cnc.dao.blame.BlameDAO.setReservationStatusRefund", host_id);
    }

    @Override
    public void setReservationStatusRefundByCustomer(String customer_id) {
        sqlSession.update("kg.air.cnc.dao.blame.BlameDAO.setReservationStatusRefundByCustomer", customer_id);
    }

    @Override
    public HostVO checkHost(String id) {
        return sqlSession.selectOne("kg.air.cnc.dao.blame.BlameDAO.checkHost", id);
    }

    @Override
    public void deleteHouse(String host_id) {
        sqlSession.delete("kg.air.cnc.dao.blame.BlameDAO.deleteHouse", host_id);
    }

    @Override
    public void deleteHost(String host_id) {
        sqlSession.delete("kg.air.cnc.dao.blame.BlameDAO.deleteHost", host_id);
    }

    @Override
    public void deleteCustomer(String customer_id) {
        sqlSession.delete("kg.air.cnc.dao.blame.BlameDAO.deleteCustomer", customer_id);
    }
}
