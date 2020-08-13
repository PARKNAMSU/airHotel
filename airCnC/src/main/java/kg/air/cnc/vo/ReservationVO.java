package kg.air.cnc.vo;



import java.util.Date;

public class ReservationVO {
    private int reservation_seq;
    private String reservation_host_id;
    private String reservation_customer_id;
    private int reservation_status;
    private int reservation_house_seq;
    private int reservation_super_host;
    private int reservation_price;
    private Date reservation_check_in;
    private Date reservation_check_out;
    private int reservation_period;
    private String reservation_account;
    private String reservation_bank;
    private Date reservation_regdate;
    private String card_apply_num;
    private String imp_uid;

    public int getReservation_seq() {
        return reservation_seq;
    }

    public void setReservation_seq(int reservation_seq) {
        this.reservation_seq = reservation_seq;
    }

    public String getReservation_host_id() {
        return reservation_host_id;
    }

    public void setReservation_host_id(String reservation_host_id) {
        this.reservation_host_id = reservation_host_id;
    }

    public String getReservation_customer_id() {
        return reservation_customer_id;
    }

    public void setReservation_customer_id(String reservation_customer_id) {
        this.reservation_customer_id = reservation_customer_id;
    }

    public int getReservation_house_seq() {
        return reservation_house_seq;
    }

    public int getReservation_status() {
        return reservation_status;
    }

    public void setReservation_status(int reservation_status) {
        this.reservation_status = reservation_status;
    }

    public void setReservation_house_seq(int reservation_house_seq) {
        this.reservation_house_seq = reservation_house_seq;
    }

    public int getReservation_super_host() {
        return reservation_super_host;
    }

    public void setReservation_super_host(int reservation_super_host) {
        this.reservation_super_host = reservation_super_host;
    }

    public int getReservation_price() {
        return reservation_price;
    }

    public void setReservation_price(int reservation_price) {
        this.reservation_price = reservation_price;
    }

    public Date getReservation_check_in() {
        return reservation_check_in;
    }

    public void setReservation_check_in(Date reservation_check_in) {
        this.reservation_check_in = reservation_check_in;
    }

    public Date getReservation_check_out() {
        return reservation_check_out;
    }

    public void setReservation_check_out(Date reservation_check_out) {
        this.reservation_check_out = reservation_check_out;
    }

    public int getReservation_period() {
        return reservation_period;
    }

    public void setReservation_period(int reservation_period) {
        this.reservation_period = reservation_period;
    }

    public String getReservation_account() {
        return reservation_account;
    }

    public void setReservation_account(String reservation_account) {
        this.reservation_account = reservation_account;
    }

    public String getReservation_bank() {
        return reservation_bank;
    }

    public void setReservation_bank(String reservation_bank) {
        this.reservation_bank = reservation_bank;
    }

    public Date getReservation_regdate() {
        return reservation_regdate;
    }

    public void setReservation_regdate(Date reservation_regdate) {
        this.reservation_regdate = reservation_regdate;
    }

    public String getCard_apply_num() {
        return card_apply_num;
    }

    public void setCard_apply_num(String card_apply_num) {
        this.card_apply_num = card_apply_num;
    }

    public String getImp_uid() {
        return imp_uid;
    }

    public void setImp_uid(String imp_uid) {
        this.imp_uid = imp_uid;
    }

    @Override
    public String toString() {
        return "ReservationVO [reservation_seq=" + reservation_seq + ", reservation_host_id=" + reservation_host_id
                + ", reservation_customer_id=" + reservation_customer_id + ", reservation_status=" + reservation_status
                + ", reservation_house_seq=" + reservation_house_seq + ", reservation_super_host="
                + reservation_super_host + ", reservation_price=" + reservation_price + ", reservation_check_in="
                + reservation_check_in + ", reservation_check_out=" + reservation_check_out + ", reservation_period="
                + reservation_period + ", reservation_account=" + reservation_account + ", reservation_bank="
                + reservation_bank + ", reservation_regdate=" + reservation_regdate + "]";
    }

}