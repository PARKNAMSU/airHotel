package kg.air.cnc.customer.vo;

import java.util.Date;

public class CustomerVO{
	private String customer_id;
	private String customer_password;
	private String customer_name;
	private String customer_email;
	private String customer_type;
	private String customer_image;
	private String customer_phone;
	private int customer_blame_warn;
	private int customer_blame_stop;
	private Date customer_regdate;
	private String customer_key;
	private String session_id;
	private Date session_limit;
	private Date customer_stop_end_date;
	private int customer_status;
	private boolean useCookie;
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_password() {
		return customer_password;
	}
	public void setCustomer_password(String customer_password) {
		this.customer_password = customer_password;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String getCustomer_type() {
		return customer_type;
	}
	public void setCustomer_type(String customer_type) {
		this.customer_type = customer_type;
	}
	public String getCustomer_image() {
		return customer_image;
	}
	public void setCustomer_image(String customer_image) {
		this.customer_image = customer_image;
	}
	public String getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}
	public int getCustomer_blame_warn() {
		return customer_blame_warn;
	}
	public void setCustomer_blame_warn(int customer_blame_warn) {
		this.customer_blame_warn = customer_blame_warn;
	}
	public int getCustomer_blame_stop() {
		return customer_blame_stop;
	}
	public void setCustomer_blame_stop(int customer_blame_stop) {
		this.customer_blame_stop = customer_blame_stop;
	}
	public Date getCustomer_regdate() {
		return customer_regdate;
	}
	public void setCustomer_regdate(Date customer_regdate) {
		this.customer_regdate = customer_regdate;
	}
	public String getCustomer_key() {
		return customer_key;
	}
	public void setCustomer_key(String customer_key) {
		this.customer_key = customer_key;
	}
	public String getSession_id() {
		return session_id;
	}
	public void setSession_id(String session_id) {
		this.session_id = session_id;
	}
	public Date getSession_limit() {
		return session_limit;
	}
	public void setSession_limit(Date session_limit) {
		this.session_limit = session_limit;
	}
	public Date getCustomer_stop_end_date() {
		return customer_stop_end_date;
	}
	public void setCustomer_stop_end_date(Date customer_stop_end_date) {
		this.customer_stop_end_date = customer_stop_end_date;
	}
	public int getCustomer_status() {
		return customer_status;
	}
	public void setCustomer_status(int customer_status) {
		this.customer_status = customer_status;
	}
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "CustomerVO [customer_id=" + customer_id + ", customer_password=" + customer_password
				+ ", customer_name=" + customer_name + ", customer_email=" + customer_email + ", customer_type="
				+ customer_type + ", customer_image=" + customer_image + ", customer_phone=" + customer_phone
				+ ", customer_blame_warn=" + customer_blame_warn + ", customer_blame_stop=" + customer_blame_stop
				+ ", customer_regdate=" + customer_regdate + ", customer_key=" + customer_key + ", session_id="
				+ session_id + ", session_limit=" + session_limit + ", customer_stop_end_date=" + customer_stop_end_date
				+ ", customer_status=" + customer_status + ", useCookie=" + useCookie + "]";
	}
}
