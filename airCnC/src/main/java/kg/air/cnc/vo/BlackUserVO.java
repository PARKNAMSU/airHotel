package kg.air.cnc.vo;

import java.util.Date;

public class BlackUserVO {
    String black_id;
    String black_email;
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

    public String getBlack_email() {
        return black_email;
    }

    public void setBlack_email(String black_email) {
        this.black_email = black_email;
    }

    @Override
    public String toString() {
        return "BlackUserVO{" +
                "black_id='" + black_id + '\'' +
                ", black_email='" + black_email + '\'' +
                ", regdate=" + regdate +
                '}';
    }
}
