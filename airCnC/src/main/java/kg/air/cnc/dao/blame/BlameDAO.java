package kg.air.cnc.dao.blame;

import kg.air.cnc.vo.blame.BlameVO;

import java.util.ArrayList;

public interface BlameDAO {
    ArrayList<BlameVO> getBlameList();

    ArrayList<BlameVO> getBlameInfo(String tartget_member_id);
}
