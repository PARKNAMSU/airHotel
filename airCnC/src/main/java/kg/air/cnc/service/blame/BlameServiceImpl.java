package kg.air.cnc.service.blame;

import kg.air.cnc.dao.blame.BlameDAO;
import kg.air.cnc.vo.blame.BlameVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service("blameService")
public class BlameServiceImpl implements BlameService {

    @Autowired
    BlameDAO blameDAO;

    public List<Map.Entry<String, Integer>> getBlameList() {  // target_member_id 별로 신고를 count 하여 정렬 한 list.
        ArrayList<BlameVO> blameList = blameDAO.getBlameList();

        HashMap<String, Integer> blameCount = new HashMap<String, Integer>();

        for(int i = 0; i < blameList.size(); i++){ // target_member_id 별로 신고 횟수 count
            if(blameCount.containsKey(blameList.get(i).getTarget_member_id())){
                blameCount.put(blameList.get(i).getTarget_member_id(), blameCount.get(blameList.get(i).getTarget_member_id()) + 1);
            } else {
                blameCount.put(blameList.get(i).getTarget_member_id(), 1);
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
}
