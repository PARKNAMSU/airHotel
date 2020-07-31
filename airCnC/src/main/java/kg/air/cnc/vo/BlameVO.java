package kg.air.cnc.vo;

import java.util.Date;

public class BlameVO {
    private int blame_pk;                               //pk
    private int blame_type;                             //호스트, customer 구분자
    private String blame_member_id;                     //신고한 아이디
    private String blame_target_member_id;              //신고당한 아이디
    private String blame_content;                       //신고내용
    private Date blame_time;

    public int getBlame_pk() {
        return blame_pk;
    }

    public void setBlame_pk(int blame_pk) {
        this.blame_pk = blame_pk;
    }

    public int getBlame_type() {
        return blame_type;
    }

    public void setBlame_type(int blame_type) {
        this.blame_type = blame_type;
    }

    public String getBlame_member_id() {
        return blame_member_id;
    }

    public void setBlame_member_id(String blame_member_id) {
        this.blame_member_id = blame_member_id;
    }

    public String getBlame_target_member_id() {
        return blame_target_member_id;
    }

    public void setBlame_target_member_id(String blame_target_member_id) {
        this.blame_target_member_id = blame_target_member_id;
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
}
