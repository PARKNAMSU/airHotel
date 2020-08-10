package kg.air.cnc.vo;

import java.util.Date;

public class BlackUserVO {
    String black_id;                        // 블랙당한 아이디
    String black_email;                     // 블랙 이메일 (해당 이메일로 회원가입 불가) (pk)
    Date regdate;                           // 블랙당한 날짜

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
