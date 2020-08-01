package kg.air.cnc.customer.vo.housereg;

import java.sql.Date;
import java.sql.Timestamp;

public class HouseVO {
	private String houseId;//이건 내연습용
	private String houseName;//이건 내연습용
	private int housePrice;//이건 내연습용
	private String houseDesc;//이건 내연습용
	
	private String newhouse;
	private int house_maxperson;
	private int house_bedroom_amount;
	private int house_bed_amount;
	private int house_bed_type_single;	
	private int house_bed_type_double;
	private int house_bed_type_queen;
	
	private int house_bathroom_amount;
	private int house_bathroom_type;
	
	private String house_location;
	private String house_loaction_sido;
	private String house_location_gugun;
	private String house_location_postnum;
	
	public String getHouse_location() {
		return house_location;
	}
	public void setHouse_location(String house_location) {
		this.house_location = house_location;
	}
	public String getHouse_loaction_sido() {
		return house_loaction_sido;
	}
	public void setHouse_loaction_sido(String house_loaction_sido) {
		this.house_loaction_sido = house_loaction_sido;
	}
	public String getHouse_location_gugun() {
		return house_location_gugun;
	}
	public void setHouse_location_gugun(String house_location_gugun) {
		this.house_location_gugun = house_location_gugun;
	}
	public String getHouse_location_postnum() {
		return house_location_postnum;
	}
	public void setHouse_location_postnum(String house_location_postnum) {
		this.house_location_postnum = house_location_postnum;
	}
	private int house_defaultsetting;
	private int house_default_tv;
	private int house_default_wifi;
	private int house_default_heater;
	private int house_default_cooler;
	private int house_default_iron;
	private int house_default_fireditecter;
	private int house_default_coditecter;
	private int house_default_aidkit;
	private int house_default_firesofwa;
	private int house_default_bedrock;
	private int house_default_livingroom_type;
	private int house_default_kitchen;
	private int house_default_laundry_washer;
	private int house_default_laundry_dryer;
	private int house_default_parking;
	private int house_default_gym;
	private int house_default_pool;
	
	private String house_desc1;
	private String house_desc2;
	private String house_desc3;
	private String house_desc4;
	private String house_desc5;
	private String house_photourl;
	private String house_name;
	
	private int house_conditiion_childok;
	private int house_condition_babyok;
	private int house_condition_petok;
	private int house_condition_smokeok;
	private int house_condition_partyok;
	private int house_restrict_stairs;
	private int house_restrict_noise;
	private int house_restrict_pet;
	private int house_restrict_cantpark;
	private int house_restrict_commonspace;
	private int house_restrict_facility;
	private int house_restrict_cctv;
	private int house_restrict_weapon;
	private int house_restrict_beast;
	
	private int house_price_default;
	private int house_price_max;
	private float house_star;
	private int house_status;
	
	private String house_host_id;
	private float house_xlocation;
	private float house_ylocation;
	private Timestamp house_checkin_time;
	private Timestamp house_checkout_time;
	private Date house_regdate;
	
	public int getHouse_bathroom_amount() {
		return house_bathroom_amount;
	}
	public void setHouse_bathroom_amount(int house_bathroom_amount) {
		this.house_bathroom_amount = house_bathroom_amount;
	}
	public int getHouse_bathroom_type() {
		return house_bathroom_type;
	}
	public void setHouse_bathroom_type(int house_bathroom_type) {
		this.house_bathroom_type = house_bathroom_type;
	}
	public int getHouse_maxperson() {
		return house_maxperson;
	}
	public void setHouse_maxperson(int house_maxperson) {
		this.house_maxperson = house_maxperson;
	}
	public int getHouse_bedroom_amount() {
		return house_bedroom_amount;
	}
	public void setHouse_bedroom_amount(int house_bedroom_amount) {
		this.house_bedroom_amount = house_bedroom_amount;
	}
	public int getHouse_bed_amount() {
		return house_bed_amount;
	}
	public void setHouse_bed_amount(int house_bed_amount) {
		this.house_bed_amount = house_bed_amount;
	}
	public int getHouse_bed_type_single() {
		return house_bed_type_single;
	}
	public void setHouse_bed_type_single(int house_bed_type_single) {
		this.house_bed_type_single = house_bed_type_single;
	}
	public int getHouse_bed_type_double() {
		return house_bed_type_double;
	}
	public void setHouse_bed_type_double(int house_bed_type_double) {
		this.house_bed_type_double = house_bed_type_double;
	}
	public int getHouse_bed_type_queen() {
		return house_bed_type_queen;
	}
	public void setHouse_bed_type_queen(int house_bed_type_queen) {
		this.house_bed_type_queen = house_bed_type_queen;
	}
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
		return "HouseVO [newhouse=" + newhouse + ", house_bedroom_amount=" + house_bedroom_amount
				+ ", house_bathroom_type=" + house_bathroom_type + ", house_loaction_sido=" + house_loaction_sido + "]";
	}
	
	
	
	
}
