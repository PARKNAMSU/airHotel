package kg.air.cnc.customer.vo.housereg;

public class HouseVO {
	private String houseId;
	private String houseName;
	private int housePrice;
	private String houseDesc;
	
	private String newhouse;
	
	public String getNewhouse() {
		return newhouse;
	}
	public void setNewhouse(String newhouse) {
		this.newhouse = newhouse;
	}
	public String getHouseId() {
		return houseId;
	}
	public void setHouseId(String houseId) {
		this.houseId = houseId;
	}
	public String getHouseName() {
		return houseName;
	}
	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}
	public int getHousePrice() {
		return housePrice;
	}
	public void setHousePrice(int housePrice) {
		this.housePrice = housePrice;
	}
	public String getHouseDesc() {
		return houseDesc;
	}
	public void setHouseDesc(String houseDesc) {
		this.houseDesc = houseDesc;
	}
	@Override
	public String toString() {
		return "HouseVO [houseId=" + houseId + ", houseName=" + houseName + ", housePrice=" + housePrice
				+ ", houseDesc=" + houseDesc + ", newhouse=" + newhouse + "]";
	}
	
	
}
