package kg.air.cnc.customer.vo;

import java.util.Date;

public class CustomerVO {
	private String customerId;
	private String customerPassword;
	private String customerName;
	private String customerEmail;
	private String customerType;
	private String customerImage;
	private String customerPhone;
	private int customerBlaimWarn;
	private int customerBlaimStop;
	private Date customerRegdate;
	private String customerKey;
	
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getCustomerPassword() {
		return customerPassword;
	}
	public void setCustomerPassword(String customerPassword) {
		this.customerPassword = customerPassword;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	public String getCustomerImage() {
		return customerImage;
	}
	public void setCustomerImage(String customerImage) {
		this.customerImage = customerImage;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public int getCustomerBlaimWarn() {
		return customerBlaimWarn;
	}
	public void setCustomerBlaimWarn(int customerBlaimWarn) {
		this.customerBlaimWarn = customerBlaimWarn;
	}
	public int getCustomerBlaimStop() {
		return customerBlaimStop;
	}
	public void setCustomerBlaimStop(int customerBlaimStop) {
		this.customerBlaimStop = customerBlaimStop;
	}
	public Date getCustomerRegdate() {
		return customerRegdate;
	}
	public void setCustomerRegdate(Date customerRegdate) {
		this.customerRegdate = customerRegdate;
	}
	public String getCustomerKey() {
		return customerKey;
	}
	public void setCustomerKey(String customerKey) {
		this.customerKey = customerKey;
	}
	@Override
	public String toString() {
		return "CustomerVO [customerId=" + customerId + ", customerPassword=" + customerPassword + ", customerName="
				+ customerName + ", customerEmail=" + customerEmail + ", customerType=" + customerType
				+ ", customerImage=" + customerImage + ", customerPhone=" + customerPhone + ", customerBlaimWarn="
				+ customerBlaimWarn + ", customerBlaimStop=" + customerBlaimStop + ", customerRegdate="
				+ customerRegdate + ", customerKey=" + customerKey + "]";
	}
}
