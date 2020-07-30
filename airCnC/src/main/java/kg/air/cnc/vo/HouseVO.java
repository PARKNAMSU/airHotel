package kg.air.cnc.vo;

public class HouseVO {
	private int seq;
	private String house_name;
	private String address;
	private int house_star;
	private String house_info;
	private int house_price;
	private int popular;
	private int waiting_status;

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getHouse_name() {
		return house_name;
	}

	public void setHouse_name(String house_name) {
		this.house_name = house_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getHouse_star() {
		return house_star;
	}

	public void setHouse_star(int house_star) {
		this.house_star = house_star;
	}

	public String getHouse_info() {
		return house_info;
	}

	public void setHouse_info(String house_info) {
		this.house_info = house_info;
	}

	public int getHouse_price() {
		return house_price;
	}

	public void setHouse_price(int house_price) {
		this.house_price = house_price;
	}

	public int getPopular() {
		return popular;
	}

	public void setPopular(int popular) {
		this.popular = popular;
	}

	public int getWaiting_status() {
		return waiting_status;
	}

	public void setWaiting_status(int waiting_status) {
		this.waiting_status = waiting_status;
	}

	@Override
	public String toString() {
		return "HouseVO [seq=" + seq + ", house_name=" + house_name + ", address=" + address + ", house_star="
				+ house_star + ", house_info=" + house_info + ", house_price=" + house_price + ", popular=" + popular
				+ ", waiting_status=" + waiting_status + "]";
	}

}
