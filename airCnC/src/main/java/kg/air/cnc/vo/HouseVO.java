package kg.air.cnc.vo;

public class HouseVO {
	private int house_seq;
	private String house_name;
	private String house_address;
	private int house_price;
	private int house_status;
	private int house_star;

	public int getHouse_seq() {
		return house_seq;
	}

	public void setHouse_seq(int house_seq) {
		this.house_seq = house_seq;
	}

	public String getHouse_name() {
		return house_name;
	}

	public void setHouse_name(String house_name) {
		this.house_name = house_name;
	}

	public String getHouse_address() {
		return house_address;
	}

	public void setHouse_address(String house_address) {
		this.house_address = house_address;
	}

	public int getHouse_price() {
		return house_price;
	}

	public void setHouse_price(int house_price) {
		this.house_price = house_price;
	}

	public int getHouse_status() {
		return house_status;
	}

	public void setHouse_status(int house_status) {
		this.house_status = house_status;
	}

	public int getHouse_star() {
		return house_star;
	}

	public void setHouse_star(int house_star) {
		this.house_star = house_star;
	}

	@Override
	public String toString() {
		return "HouseVO [house_seq=" + house_seq + ", house_name=" + house_name + ", house_address=" + house_address
				+ ", house_price=" + house_price + ", house_status=" + house_status + ", house_star=" + house_star
				+ "]";
	}

}
