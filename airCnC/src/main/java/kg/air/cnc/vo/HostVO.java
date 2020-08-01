package kg.air.cnc.vo;

import java.util.Date;


public class HostVO {
    private String host_id;
    private String host_name;
    private String host_password;
    private String host_email;
    private String host_image;
    private String host_phone;
    private String host_account;
    private Date host_regdate;
    private int host_blame_warn;
    private int host_blame_stop;

    public String getHost_id() {
        return host_id;
    }

    public void setHost_id(String host_id) {
        this.host_id = host_id;
    }

    public String getHost_name() {
        return host_name;
    }

    public void setHost_name(String host_name) {
        this.host_name = host_name;
    }

    public String getHost_password() {
        return host_password;
    }

    public void setHost_password(String host_password) {
        this.host_password = host_password;
    }

    public String getHost_email() {
        return host_email;
    }

    public void setHost_email(String host_email) {
        this.host_email = host_email;
    }

    public String getHost_image() {
        return host_image;
    }

    public void setHost_image(String host_image) {
        this.host_image = host_image;
    }

    public String getHost_phone() {
        return host_phone;
    }

    public void setHost_phone(String host_phone) {
        this.host_phone = host_phone;
    }


    public String getHost_account() {
        return host_account;
    }

    public void setHost_account(String host_account) {
        this.host_account = host_account;
    }

    public Date getHost_regdate() {
        return host_regdate;
    }

    public void setHost_regdate(Date host_regdate) {
        this.host_regdate = host_regdate;
    }

    public int getHost_blame_warn() {
        return host_blame_warn;
    }

    public void setHost_blame_warn(int host_blame_warn) {
        this.host_blame_warn = host_blame_warn;
    }

    public int getHost_blame_stop() {
        return host_blame_stop;
    }

    public void setHost_blame_stop(int host_blame_stop) {
        this.host_blame_stop = host_blame_stop;
    }

    @Override
    public String toString() {
        return "HostVO{" +
                "host_id='" + host_id + '\'' +
                ", host_name='" + host_name + '\'' +
                ", host_password='" + host_password + '\'' +
                ", host_email='" + host_email + '\'' +
                ", host_image='" + host_image + '\'' +
                ", host_phone='" + host_phone + '\'' +
                ", host_account='" + host_account + '\'' +
                ", host_regdate=" + host_regdate +
                ", host_blame_warn=" + host_blame_warn +
                ", host_blame_stop=" + host_blame_stop +
                '}';
    }
}