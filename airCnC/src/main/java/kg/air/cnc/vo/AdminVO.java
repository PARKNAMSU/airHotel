package kg.air.cnc.vo;

public class AdminVO {
	private String admin_id;
	private String admin_password;
	private int admin_login_status;
	public int getAdmin_login_status() {
		return admin_login_status;
	}
	public void setAdmin_login_status(int admin_login_status) {
		this.admin_login_status = admin_login_status;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	@Override
	public String toString() {
		return "AdminVO [admin_id=" + admin_id + ", admin_password=" + admin_password + "]";
	}
}
