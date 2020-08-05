package kg.air.cnc.dao.blame;

import kg.air.cnc.vo.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public interface BlameDAO {
    ArrayList<BlameVO> getBlameList();
    ArrayList<BlameVO> getBlameInfo(String target_member_id);
    CustomerVO getCustomerBlameInfo(String target_member_id);
    HostVO getHostBlameInfo(String target_member_id);
    void insertBlameWarnMessage(Map<String, String> warnMessageMap);
    void deleteBlame(Map<String, String> deleteBlameMap);
    void increaseCustomerBlameWarn(String target_member_id);
    void increaseCustomerBlameStop(String customer_id);
    void increaseHostBlameWarn(String target_member_id);
    void increaseHostBlameStop(String host_id);
    void addBlackList(Map<String,String>id);
    List<House_InfoVO> getHostHouses(String host_id); // host 가 가지고 있는 하우스 리스트 뽑아오는 기능
    void setHouseStatusStop(House_InfoVO house); // house 의 상태를 1(정지상태)로 변경
    List<ReservationVO> getReservationByHostId(String host_id); //
    List<ReservationVO> getReservationByCustomerId(String customer_id);
    void sendCustomerReservationCancelMessage(String to_id); // host 정지로 인한 취소메세지 전송
    void sendHostReservationCacelMessage(String to_id); // customer 정지로 인한 예약 취소메세지 전송
    void setReservationStatusRefund(String host_id); // reservation_status 1(환불대기상태) 로 변경
    void setReservationStatusRefundByCustomer(String customer_id); // reservation_status 1(환불대기상태) 로 변경
    HostVO checkHost(String id); // host 인지 확인
    void deleteHouse(String host_id);
    void deleteHost(String host_id);
    void deleteCustomer(String customer_id);
    CustomerVO getCustomerVO(String id);


}
