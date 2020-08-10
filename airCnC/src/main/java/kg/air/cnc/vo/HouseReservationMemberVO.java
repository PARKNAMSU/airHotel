package kg.air.cnc.vo;

public class HouseReservationMemberVO {
	 private int reservation_seq;
	 private String reservation_customer_id;
	 private int reservation_house_seq;
	 private String reservation_check_in;
	 private String reservation_check_out;
	 private String reservation_regdate;
	 private String customer_name;
	 private String customer_image;
	 private String customer_email;
	 private String customer_phone;
	 public int getReservation_seq() {
		return reservation_seq;
	}
	public void setReservation_seq(int reservation_seq) {
		this.reservation_seq = reservation_seq;
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
	public void setReservation_house_seq(int reservation_house_seq) {
		this.reservation_house_seq = reservation_house_seq;
	}
	public String getReservation_check_in() {
		return reservation_check_in;
	}
	public void setReservation_check_in(String reservation_check_in) {
		this.reservation_check_in = reservation_check_in;
	}
	public String getReservation_check_out() {
		return reservation_check_out;
	}
	public void setReservation_check_out(String reservation_check_out) {
		this.reservation_check_out = reservation_check_out;
	}
	public String getReservation_regdate() {
		return reservation_regdate;
	}
	public void setReservation_regdate(String reservation_regdate) {
		this.reservation_regdate = reservation_regdate;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_image() {
		return customer_image;
	}
	public void setCustomer_image(String customer_image) {
		this.customer_image = customer_image;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	
}
