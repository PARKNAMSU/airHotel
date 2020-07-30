package kg.air.cnc.vo.blame;

import java.util.Date;

public class BlameVO {
    private int blame_pk;                               //pk
    private String member_id;                           //신고한 아이디
    private String target_member_id;                    //신고당한 아이디
    private String blame_content;                       //신고내용
    private Date blame_time;

    public int getBlame_pk() {
        return blame_pk;
    }

    public void setBlame_pk(int blame_pk) {
        this.blame_pk = blame_pk;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getTarget_member_id() {
        return target_member_id;
    }

    public void setTarget_member_id(String target_member_id) {
        this.target_member_id = target_member_id;
    }

    public String getBlame_content() {
        return blame_content;
    }

    public void setBlame_content(String blame_content) {
        this.blame_content = blame_content;
    }

    public Date getBlame_time() {
        return blame_time;
    }

    public void setBlame_time(Date blame_time) {
        this.blame_time = blame_time;
    }

    @Override
    public String toString() {
        return "BlameVO{" +
                "blame_pk=" + blame_pk +
                ", member_id='" + member_id + '\'' +
                ", target_member_id='" + target_member_id + '\'' +
                ", blame_content='" + blame_content + '\'' +
                ", blame_time=" + blame_time +
                '}';
    }


}
