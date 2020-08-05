package kg.air.cnc.service.blame;

import kg.air.cnc.dao.blame.BlameDAO;
import kg.air.cnc.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kg.air.cnc.vo.HostVO;

import java.util.*;

@Service("blameService")
public class BlameServiceImpl implements BlameService {

    @Autowired
    BlameDAO blameDAO;

    public List<Map.Entry<String, Integer>> getBlameList() {  // target_member_id 별로 신고를 count 하여 정렬 한 list.

        ArrayList<BlameVO> blameList = blameDAO.getBlameList();
        HashMap<String, Integer> blameCount = new HashMap<String, Integer>();

        for(int i = 0; i < blameList.size(); i++){ // target_member_id 별로 신고 횟수 count
            if(blameCount.containsKey(blameList.get(i).getBlame_target_member_id())){
                blameCount.put(blameList.get(i).getBlame_target_member_id(), blameCount.get(blameList.get(i).getBlame_target_member_id()) + 1);
            } else {
                blameCount.put(blameList.get(i).getBlame_target_member_id(), 1);
            }
        }

        List<Map.Entry<String, Integer>> blameCountList = new LinkedList<Map.Entry<String, Integer>>(blameCount.entrySet()); // 신고 횟수가 높은 순으로 sort
        Collections.sort(blameCountList, new Comparator<Map.Entry<String, Integer>>() {
            public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
                return o2.getValue().compareTo(o1.getValue());
            }
        });

        return blameCountList;
    }

    public ArrayList<BlameVO> getBlameInfo(String target_member_id) { // 신고당한 아이디의 신고내역 상세 보기
        return blameDAO.getBlameInfo(target_member_id);
    }

    @Override
    public CustomerVO getCustomerBlameJudgeInfo(String target_member_id) {
        return blameDAO.getCustomerBlameInfo(target_member_id);
    }

    @Override
    public HostVO getHostBlameInfo(String target_member_id) {
        return blameDAO.getHostBlameInfo(target_member_id);
    }

    @Override
    public void insertBlameWarnMessage(Map<String, String> warnMessageMap) {
        blameDAO.insertBlameWarnMessage(warnMessageMap);
    }

    @Override
    public void deleteBlame(Map<String,String> deleteBlameMap) {
        blameDAO.deleteBlame(deleteBlameMap);
    }

    @Override
    public void increaseCustomerBlameWarn(String target_member_id) {
        blameDAO.increaseCustomerBlameWarn(target_member_id);
    }

    @Override
    public void increaseHostBlameWarn(String target_member_id) {
        blameDAO.increaseHostBlameWarn(target_member_id);
    }

    @Override // 호스트 정지
    public void suspendHost(String host_id, String suspend_day) {
        blameDAO.getHostHouses(host_id);
        // host 가 가지고 있는 house list
        List<HouseVO> houseList = blameDAO.getHostHouses(host_id);
        //house_status -> 1 (정지상태)
        for(int i = 0; i < houseList.size(); i++){
            blameDAO.setHouseStatusStop(houseList.get(i));
        }
        // host_id 를 통해 해당 호스트의 하우스의 reservation list 가져옴
        List<ReservationVO> reservationList = blameDAO.getReservationByHostId(host_id);
        System.out.println(reservationList.size());
        for(int i = 0 ; i < reservationList.size(); i++){
            // reservation 리스트에 걸려있는 모든 customer 에게 메세지 전송 (admin 으로부터)
            blameDAO.sendCustomerReservationCancelMessage(reservationList.get(i).getReservation_customer_id());
            // reservation 리스트에 있는 reservation_status 를 1(환불대기상태)로 변경
            blameDAO.setReservationStatusRefund(reservationList.get(i).getReservation_host_id());
        }
        HashMap<String, String> deleteBlameMap = new HashMap<>();
        deleteBlameMap.put("target_member_id", host_id);
        deleteBlameMap.put("blame_type", "0");
        //blame 테이블에서 처리한 blame 삭제
        blameDAO.deleteBlame(deleteBlameMap);
        //해당 host 의 host_blame_stop 증가
        blameDAO.increaseHostBlameStop(host_id);

        // todo 정지기간이 끝나면 어떻게 처리하지?

    }

    @Override // 커스터머 정지
    public void suspendCustomer(String customer_id, String suspend_day) {
        //customer 가 예약한 숙소 리스트
        List<ReservationVO> reservationList = blameDAO.getReservationByCustomerId(customer_id);
        //해당 예약을 환불대기 상태로 변경 및 호스트에게 메세지 전송
        for(int i = 0; i < reservationList.size(); i++){
            //해당 예약을 환불대기상태로 변경
            blameDAO.setReservationStatusRefundByCustomer(reservationList.get(i).getReservation_customer_id());
            //해당 호스트에게 예약취소 메세지 전송
            blameDAO.sendHostReservationCacelMessage(reservationList.get(i).getReservation_host_id());
        }
        HashMap<String, String> deleteBlameMap = new HashMap<>();
        deleteBlameMap.put("target_member_id", customer_id);
        deleteBlameMap.put("blame_type", "1");
        blameDAO.deleteBlame(deleteBlameMap);

        //해당 customer 의 customer_blame_stop 1 증가
        blameDAO.increaseCustomerBlameStop(customer_id);

    }

    @Override // 블랙리스트 추가
    public void addBlackList(String id) {
        HostVO host = blameDAO.checkHost(id);
        CustomerVO customerVO = blameDAO.getCustomerVO(id);
        HashMap<String, String> deleteBlameMap = new HashMap<>();
        HashMap<String, String> addBlackMap = new HashMap<>();
        addBlackMap.put("id", id);
        addBlackMap.put("email", customerVO.getCustomer_email());
        if(host != null){
            // host 인 경우
            System.out.println(id + " is host");
            List<ReservationVO>reservationList = blameDAO.getReservationByHostId(id);
            for(int i = 0 ; i < reservationList.size(); i++){
                blameDAO.setReservationStatusRefund(reservationList.get(i).getReservation_host_id());
                blameDAO.sendCustomerReservationCancelMessage(reservationList.get(i).getReservation_customer_id());
            }
            /* 해당 host 가 가지고 있는 house 삭제처리
            List<HouseVO>houseList = blameDAO.getHostHouses(id);
            for(int i = 0 ; i < houseList.size(); i++){
                 blameDAO.deleteHouse(houseList.get(i).getHouse_host_id);
            }
            */
            blameDAO.deleteHost(id);

            deleteBlameMap.put("target_member_id", id);
            deleteBlameMap.put("blame_type", "0");

        } else {
            //customer 인 경우
            System.out.println(id + " is not host");
            List<ReservationVO> reservationList = blameDAO.getReservationByCustomerId(id);
            // todo setReservationStatusRefundByCustomer 이랑 setReservationStatusRefund 랑 구분지을 필요가있나?
            for(int i = 0 ; i < reservationList.size(); i++){
                blameDAO.setReservationStatusRefundByCustomer(reservationList.get(i).getReservation_customer_id());
                blameDAO.sendHostReservationCacelMessage(reservationList.get(i).getReservation_host_id());
            }
            deleteBlameMap.put("target_member_id", id);
            deleteBlameMap.put("blame_type", "1");
        }

        blameDAO.deleteCustomer(id);
        blameDAO.addBlackList(addBlackMap);
        blameDAO.deleteBlame(deleteBlameMap);
    }
}
