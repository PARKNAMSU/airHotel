package kg.air.cnc.vo.blacklist;

import java.util.Date;

public class BlackUserVO {
    String black_id;
    Date regdate;

    public String getBlack_id() {
        return black_id;
    }

    public void setBlack_id(String black_id) {
        this.black_id = black_id;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    @Override
    public String toString() {
        return "BlackUserVO{" +
                "black_id='" + black_id + '\'' +
                ", regdate=" + regdate +
                '}';
    }
}
