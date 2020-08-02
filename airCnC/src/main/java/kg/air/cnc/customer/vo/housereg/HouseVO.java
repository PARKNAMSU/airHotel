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
	private String house_xlocation;
	private String house_ylocation;
	
	
	private boolean house_defaultsetting;
	private boolean house_default_tv;
	private boolean house_default_wifi;
	private boolean house_default_heater;
	private boolean house_default_cooler;
	private boolean house_default_iron;
	private boolean house_default_fireditecter;
	private boolean house_default_coditecter;
	private boolean house_default_aidkit;
	private boolean house_default_firesofwa;
	private boolean house_default_bedrock;
	
	
	private boolean house_default_livingroom_type;
	private boolean house_default_kitchen;
	private boolean house_default_laundry_washer;
	private boolean house_default_laundry_dryer;
	private boolean house_default_parking;
	private boolean house_default_gym;
	private boolean house_default_pool;
	
	private String house_desc1;
	private String house_desc2;
	private String house_desc3;
	private String house_desc4;
	private String house_desc5;
	
	private String house_photourl;
	private String house_name;
	
	private boolean house_conditiion_childok;
	private boolean house_condition_babyok;
	private boolean house_condition_petok;
	private boolean house_condition_smokeok;
	private boolean house_condition_partyok;
	private boolean house_restrict_stairs;
	private boolean house_restrict_noise;
	private boolean house_restrict_pet;
	private boolean house_restrict_cantpark;
	private boolean house_restrict_commonspace;
	private boolean house_restrict_facility;
	private boolean house_restrict_cctv;
	private boolean house_restrict_weapon;
	private boolean house_restrict_beast;
	
	private int house_price_default;
	private int house_price_max;
	private float house_star;
	private int house_status;
	
	private String house_host_id;

	private Timestamp house_checkin_time;
	private Timestamp house_checkout_time;
	private Date house_regdate;
	
	
	
	
	
	
	
	

	public String getHouse_desc1() {
		return house_desc1;
	}
	public void setHouse_desc1(String house_desc1) {
		this.house_desc1 = house_desc1;
	}
	public String getHouse_desc2() {
		return house_desc2;
	}
	public void setHouse_desc2(String house_desc2) {
		this.house_desc2 = house_desc2;
	}
	public String getHouse_desc3() {
		return house_desc3;
	}
	public void setHouse_desc3(String house_desc3) {
		this.house_desc3 = house_desc3;
	}
	public String getHouse_desc4() {
		return house_desc4;
	}
	public void setHouse_desc4(String house_desc4) {
		this.house_desc4 = house_desc4;
	}
	public String getHouse_desc5() {
		return house_desc5;
	}
	public void setHouse_desc5(String house_desc5) {
		this.house_desc5 = house_desc5;
	}
	
	
	
	

	public boolean isHouse_default_livingroom_type() {
		return house_default_livingroom_type;
	}
	public void setHouse_default_livingroom_type(boolean house_default_livingroom_type) {
		this.house_default_livingroom_type = house_default_livingroom_type;
	}
	public boolean isHouse_default_kitchen() {
		return house_default_kitchen;
	}
	public void setHouse_default_kitchen(boolean house_default_kitchen) {
		this.house_default_kitchen = house_default_kitchen;
	}
	public boolean isHouse_default_laundry_washer() {
		return house_default_laundry_washer;
	}
	public void setHouse_default_laundry_washer(boolean house_default_laundry_washer) {
		this.house_default_laundry_washer = house_default_laundry_washer;
	}
	public boolean isHouse_default_laundry_dryer() {
		return house_default_laundry_dryer;
	}
	public void setHouse_default_laundry_dryer(boolean house_default_laundry_dryer) {
		this.house_default_laundry_dryer = house_default_laundry_dryer;
	}
	public boolean isHouse_default_parking() {
		return house_default_parking;
	}
	public void setHouse_default_parking(boolean house_default_parking) {
		this.house_default_parking = house_default_parking;
	}
	public boolean isHouse_default_gym() {
		return house_default_gym;
	}
	public void setHouse_default_gym(boolean house_default_gym) {
		this.house_default_gym = house_default_gym;
	}
	public boolean isHouse_default_pool() {
		return house_default_pool;
	}
	public void setHouse_default_pool(boolean house_default_pool) {
		this.house_default_pool = house_default_pool;
	}
	
	
	
	
	
	
	public boolean isHouse_defaultsetting() {
		return house_defaultsetting;
	}
	public void setHouse_defaultsetting(boolean house_defaultsetting) {
		this.house_defaultsetting = house_defaultsetting;
	}
	public boolean isHouse_default_tv() {
		return house_default_tv;
	}
	public void setHouse_default_tv(boolean house_default_tv) {
		this.house_default_tv = house_default_tv;
	}
	public boolean isHouse_default_wifi() {
		return house_default_wifi;
	}
	public void setHouse_default_wifi(boolean house_default_wifi) {
		this.house_default_wifi = house_default_wifi;
	}
	public boolean isHouse_default_heater() {
		return house_default_heater;
	}
	public void setHouse_default_heater(boolean house_default_heater) {
		this.house_default_heater = house_default_heater;
	}
	public boolean isHouse_default_cooler() {
		return house_default_cooler;
	}
	public void setHouse_default_cooler(boolean house_default_cooler) {
		this.house_default_cooler = house_default_cooler;
	}
	public boolean isHouse_default_iron() {
		return house_default_iron;
	}
	public void setHouse_default_iron(boolean house_default_iron) {
		this.house_default_iron = house_default_iron;
	}
	public boolean isHouse_default_fireditecter() {
		return house_default_fireditecter;
	}
	public void setHouse_default_fireditecter(boolean house_default_fireditecter) {
		this.house_default_fireditecter = house_default_fireditecter;
	}
	public boolean isHouse_default_coditecter() {
		return house_default_coditecter;
	}
	public void setHouse_default_coditecter(boolean house_default_coditecter) {
		this.house_default_coditecter = house_default_coditecter;
	}
	public boolean isHouse_default_aidkit() {
		return house_default_aidkit;
	}
	public void setHouse_default_aidkit(boolean house_default_aidkit) {
		this.house_default_aidkit = house_default_aidkit;
	}
	public boolean isHouse_default_firesofwa() {
		return house_default_firesofwa;
	}
	public void setHouse_default_firesofwa(boolean house_default_firesofwa) {
		this.house_default_firesofwa = house_default_firesofwa;
	}
	public boolean isHouse_default_bedrock() {
		return house_default_bedrock;
	}
	public void setHouse_default_bedrock(boolean house_default_bedrock) {
		this.house_default_bedrock = house_default_bedrock;
	}
	
	
	
	
	
	public String getHouse_xlocation() {
		return house_xlocation;
	}
	public void setHouse_xlocation(String house_xlocation) {
		this.house_xlocation = house_xlocation;
	}
	public String getHouse_ylocation() {
		return house_ylocation;
	}
	public void setHouse_ylocation(String house_ylocation) {
		this.house_ylocation = house_ylocation;
	}
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
