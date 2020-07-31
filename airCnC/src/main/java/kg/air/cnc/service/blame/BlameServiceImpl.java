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

    @Override
    public void addBlackList(String id) {
        blameDAO.addBlackList(id);
    }

    @Override // 호스트 정지
    public void suspendHost(String host_id) {
        blameDAO.getHostHouses(host_id);
        // host 가 가지고 있는 house list
        List<HouseVO> houseList = blameDAO.getHostHouses(host_id);

        //house_status -> 1 (정지상태)
        for(int i = 0; i < houseList.size(); i++){
            blameDAO.setHouseStatusStop(houseList.get(i));
        }

        // host_id 를 통해 해당 호스트의 하우스의 reservation list 가져옴
        List<ReservationVO> reservationList = blameDAO.getReservationList(host_id);
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
        blameDAO.deleteBlame(deleteBlameMap);

    }
}
