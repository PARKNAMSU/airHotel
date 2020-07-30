package kg.air.cnc.admin.vo;

public class AdminVO {
	private String adminId;
	private String adminPassword;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	
	@Override
	public String toString() {
		return "AdminVO [adminId=" + adminId + ", adminPassword=" + adminPassword + "]";
	}
}
