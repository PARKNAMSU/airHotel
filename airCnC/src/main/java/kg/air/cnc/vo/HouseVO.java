package kg.air.cnc.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

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
	private String house_bathroom_type_0or1;
	private String house_bathroom_type;
	
	
	private String house_location;
	private String house_location_sido;
	private String house_location_gugun;
	private String house_location_postnum;
	private String house_xlocation_str;
	private float house_xlocation;
	private String house_ylocation_str;
	private float house_ylocation;
	private String house_loaction_fulladdress;
	private String house_loaction_detailaddress;
	
	
	private String house_defaultsetting_0or1;
	private String house_defaultsetting;
	private String house_default_tv_0or1;
	private String house_default_tv;
	private String house_default_wifi_0or1;
	private String house_default_wifi;
	private String house_default_heater_0or1;
	private String house_default_heater;
	private String house_default_cooler_0or1;
	private String house_default_cooler;
	private String house_default_iron_0or1;
	private String house_default_iron;
	private String house_default_fireditecter_0or1;
	private String house_default_fireditecter;
	private String house_default_coditecter_0or1;
	private String house_default_coditecter;
	private String house_default_aidkit_0or1;
	private String house_default_aidkit;
	private String house_default_firesofwa_0or1;
	private String house_default_firesofwa;
	private String house_default_bedrock_0or1;
	private String house_default_bedrock;
	
	
	private String house_default_livingroom_type_0or1;
	private String house_default_livingroom_type;
	private String house_default_kitchen_0or1;
	private String house_default_kitchen;
	private String house_default_laundry_washer_0or1;
	private String house_default_laundry_washer;
	private String house_default_laundry_dryer_0or1;
	private String house_default_laundry_dryer;
	private String house_default_parking_0or1;
	private String house_default_parking;
	private String house_default_gym_0or1;
	private String house_default_gym;
	private String house_default_pool_0or1;
	private String house_default_pool;
	
	private String house_desc1;
	private String house_desc2;
	private String house_desc3;
	private String house_desc4;
	private String house_desc5;
	
	private MultipartFile house_photo; 
	private String house_photourl;
	
	private String house_name;
	
	private String house_price_default_parInt;
	private String house_price_max_parInt;
	private int house_price_default;
	private int house_price_max;
	
	private String house_theme_bbq_0or1;
	private String house_theme_bbq;
	private String house_theme_pet_0or1;
	private String house_theme_pet;
	private String house_theme_party_0or1;
	private String house_theme_party;
	private String house_theme_pool_0or1;
	private String house_theme_pool;
	private String house_theme_farm_0or1;
	private String house_theme_farm;
	
	
	
	private String house_condition_childok_0or1;
	private String house_condition_childok;
	private String house_condition_babyok_0or1;
	private String house_condition_babyok;
	private String house_condition_smokeok_0or1;
	private String house_condition_smokeok;
	private String house_restrict_stairs_0or1;
	private String house_restrict_stairs;
	private String house_restrict_noise_0or1;
	private String house_restrict_noise;
	private String house_restrict_pet_0or1;
	private String house_restrict_pet;
	private String house_restrict_cantpark_0or1;
	private String house_restrict_cantpark;
	private String house_restrict_commonspace_0or1;
	private String house_restrict_commonspace;
	private String house_restrict_facility_0or1;
	private String house_restrict_facility;
	private String house_restrict_cctv_0or1;
	private String house_restrict_cctv;
	private String house_restrict_weapon_0or1;
	private String house_restrict_weapon;
	private String house_restrict_beast_0or1;
	private String house_restrict_beast;
	
	private String house_checkin_time;
	private String house_checkout_time;
	
	
	private float house_star;
	private int house_status;
	private String house_host_id;
	private Date house_regdate;
	
	
	
	
	public String getHouse_checkin_time() {
		return house_checkin_time;
	}
	public void setHouse_checkin_time(String house_checkin_time) {
		this.house_checkin_time = house_checkin_time;
	}
	public String getHouse_checkout_time() {
		return house_checkout_time;
	}
	public void setHouse_checkout_time(String house_checkout_time) {
		this.house_checkout_time = house_checkout_time;
	}
	
	
	
	
	public String getHouse_condition_childok_0or1() {
		return house_condition_childok_0or1;
	}
	public void setHouse_condition_childok_0or1(String house_conditiion_childok_0or1) {
		this.house_condition_childok_0or1 = house_conditiion_childok_0or1;
	}
	public String getHouse_condition_childok() {
		return house_condition_childok;
	}
	public void setHouse_condition_childok(String house_conditiion_childok) {
		this.house_condition_childok = house_conditiion_childok;
	}
	public String getHouse_condition_babyok_0or1() {
		return house_condition_babyok_0or1;
	}
	public void setHouse_condition_babyok_0or1(String house_condition_babyok_0or1) {
		this.house_condition_babyok_0or1 = house_condition_babyok_0or1;
	}
	public String getHouse_condition_babyok() {
		return house_condition_babyok;
	}
	public void setHouse_condition_babyok(String house_condition_babyok) {
		this.house_condition_babyok = house_condition_babyok;
	}
	public String getHouse_condition_smokeok_0or1() {
		return house_condition_smokeok_0or1;
	}
	public void setHouse_condition_smokeok_0or1(String house_condition_smokeok_0or1) {
		this.house_condition_smokeok_0or1 = house_condition_smokeok_0or1;
	}
	public String getHouse_condition_smokeok() {
		return house_condition_smokeok;
	}
	public void setHouse_condition_smokeok(String house_condition_smokeok) {
		this.house_condition_smokeok = house_condition_smokeok;
	}
	public String getHouse_restrict_stairs_0or1() {
		return house_restrict_stairs_0or1;
	}
	public void setHouse_restrict_stairs_0or1(String house_restrict_stairs_0or1) {
		this.house_restrict_stairs_0or1 = house_restrict_stairs_0or1;
	}
	public String getHouse_restrict_stairs() {
		return house_restrict_stairs;
	}
	public void setHouse_restrict_stairs(String house_restrict_stairs) {
		this.house_restrict_stairs = house_restrict_stairs;
	}
	public String getHouse_restrict_noise_0or1() {
		return house_restrict_noise_0or1;
	}
	public void setHouse_restrict_noise_0or1(String house_restrict_noise_0or1) {
		this.house_restrict_noise_0or1 = house_restrict_noise_0or1;
	}
	public String getHouse_restrict_noise() {
		return house_restrict_noise;
	}
	public void setHouse_restrict_noise(String house_restrict_noise) {
		this.house_restrict_noise = house_restrict_noise;
	}
	public String getHouse_restrict_pet_0or1() {
		return house_restrict_pet_0or1;
	}
	public void setHouse_restrict_pet_0or1(String house_restrict_pet_0or1) {
		this.house_restrict_pet_0or1 = house_restrict_pet_0or1;
	}
	public String getHouse_restrict_pet() {
		return house_restrict_pet;
	}
	public void setHouse_restrict_pet(String house_restrict_pet) {
		this.house_restrict_pet = house_restrict_pet;
	}
	public String getHouse_restrict_cantpark_0or1() {
		return house_restrict_cantpark_0or1;
	}
	public void setHouse_restrict_cantpark_0or1(String house_restrict_cantpark_0or1) {
		this.house_restrict_cantpark_0or1 = house_restrict_cantpark_0or1;
	}
	public String getHouse_restrict_cantpark() {
		return house_restrict_cantpark;
	}
	public void setHouse_restrict_cantpark(String house_restrict_cantpark) {
		this.house_restrict_cantpark = house_restrict_cantpark;
	}
	public String getHouse_restrict_commonspace_0or1() {
		return house_restrict_commonspace_0or1;
	}
	public void setHouse_restrict_commonspace_0or1(String house_restrict_commonspace_0or1) {
		this.house_restrict_commonspace_0or1 = house_restrict_commonspace_0or1;
	}
	public String getHouse_restrict_commonspace() {
		return house_restrict_commonspace;
	}
	public void setHouse_restrict_commonspace(String house_restrict_commonspace) {
		this.house_restrict_commonspace = house_restrict_commonspace;
	}
	public String getHouse_restrict_facility_0or1() {
		return house_restrict_facility_0or1;
	}
	public void setHouse_restrict_facility_0or1(String house_restrict_facility_0or1) {
		this.house_restrict_facility_0or1 = house_restrict_facility_0or1;
	}
	public String getHouse_restrict_facility() {
		return house_restrict_facility;
	}
	public void setHouse_restrict_facility(String house_restrict_facility) {
		this.house_restrict_facility = house_restrict_facility;
	}
	public String getHouse_restrict_cctv_0or1() {
		return house_restrict_cctv_0or1;
	}
	public void setHouse_restrict_cctv_0or1(String house_restrict_cctv_0or1) {
		this.house_restrict_cctv_0or1 = house_restrict_cctv_0or1;
	}
	public String getHouse_restrict_cctv() {
		return house_restrict_cctv;
	}
	public void setHouse_restrict_cctv(String house_restrict_cctv) {
		this.house_restrict_cctv = house_restrict_cctv;
	}
	public String getHouse_restrict_weapon_0or1() {
		return house_restrict_weapon_0or1;
	}
	public void setHouse_restrict_weapon_0or1(String house_restrict_weapon_0or1) {
		this.house_restrict_weapon_0or1 = house_restrict_weapon_0or1;
	}
	public String getHouse_restrict_weapon() {
		return house_restrict_weapon;
	}
	public void setHouse_restrict_weapon(String house_restrict_weapon) {
		this.house_restrict_weapon = house_restrict_weapon;
	}
	public String getHouse_restrict_beast_0or1() {
		return house_restrict_beast_0or1;
	}
	public void setHouse_restrict_beast_0or1(String house_restrict_beast_0or1) {
		this.house_restrict_beast_0or1 = house_restrict_beast_0or1;
	}
	public String getHouse_restrict_beast() {
		return house_restrict_beast;
	}
	public void setHouse_restrict_beast(String house_restrict_beast) {
		this.house_restrict_beast = house_restrict_beast;
	}
	
	
	
	
	
	
	
	
	
	public String getHouse_theme_bbq_0or1() {
		return house_theme_bbq_0or1;
	}
	public void setHouse_theme_bbq_0or1(String house_theme_bbq_0or1) {
		this.house_theme_bbq_0or1 = house_theme_bbq_0or1;
	}
	public String getHouse_theme_bbq() {
		return house_theme_bbq;
	}
	public void setHouse_theme_bbq(String house_theme_bbq) {
		this.house_theme_bbq = house_theme_bbq;
	}
	public String getHouse_theme_pet_0or1() {
		return house_theme_pet_0or1;
	}
	public void setHouse_theme_pet_0or1(String house_theme_pet_0or1) {
		this.house_theme_pet_0or1 = house_theme_pet_0or1;
	}
	public String getHouse_theme_pet() {
		return house_theme_pet;
	}
	public void setHouse_theme_pet(String house_theme_pet) {
		this.house_theme_pet = house_theme_pet;
	}
	public String getHouse_theme_party_0or1() {
		return house_theme_party_0or1;
	}
	public void setHouse_theme_party_0or1(String house_theme_party_0or1) {
		this.house_theme_party_0or1 = house_theme_party_0or1;
	}
	public String getHouse_theme_party() {
		return house_theme_party;
	}
	public void setHouse_theme_party(String house_theme_party) {
		this.house_theme_party = house_theme_party;
	}
	public String getHouse_theme_pool_0or1() {
		return house_theme_pool_0or1;
	}
	public void setHouse_theme_pool_0or1(String house_theme_pool_0or1) {
		this.house_theme_pool_0or1 = house_theme_pool_0or1;
	}
	public String getHouse_theme_pool() {
		return house_theme_pool;
	}
	public void setHouse_theme_pool(String house_theme_pool) {
		this.house_theme_pool = house_theme_pool;
	}
	public String getHouse_theme_farm_0or1() {
		return house_theme_farm_0or1;
	}
	public void setHouse_theme_farm_0or1(String house_theme_farm_0or1) {
		this.house_theme_farm_0or1 = house_theme_farm_0or1;
	}
	public String getHouse_theme_farm() {
		return house_theme_farm;
	}
	public void setHouse_theme_farm(String house_theme_farm) {
		this.house_theme_farm = house_theme_farm;
	}
	
	
	
	
	
	
	
	
	
	
	public int getHouse_price_default() {
		return house_price_default;
	}
	public void setHouse_price_default(int house_price_default) {
		this.house_price_default = house_price_default;
	}
	public int getHouse_price_max() {
		return house_price_max;
	}
	public void setHouse_price_max(int house_price_max) {
		this.house_price_max = house_price_max;
	}
	public String getHouse_price_default_parInt() {
		return house_price_default_parInt;
	}
	public void setHouse_price_default_parInt(String house_price_default_parInt) {
		this.house_price_default_parInt = house_price_default_parInt;
	}
	public String getHouse_price_max_parInt() {
		return house_price_max_parInt;
	}
	public void setHouse_price_max_parInt(String house_price_max_parInt) {
		this.house_price_max_parInt = house_price_max_parInt;
	}
	
	
	
	
	
	
	

	public String getHouse_name() {
		return house_name;
	}
	public void setHouse_name(String house_name) {
		this.house_name = house_name;
	}
	
	
	
	
	
	
	
	public MultipartFile getHouse_photo() {
		return house_photo;
	}
	public void setHouse_photo(MultipartFile house_photo) {
		this.house_photo = house_photo;
	}
	public String getHouse_photourl() {
		return house_photourl;
	}
	public void setHouse_photourl(String house_photourl) {
		this.house_photourl = house_photourl;
	}
	
	
	
	

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
	
	
	
	
	
	
	
	
	public String getHouse_defaultsetting_0or1() {
		return house_defaultsetting_0or1;
	}
	public String getHouse_default_livingroom_type_0or1() {
		return house_default_livingroom_type_0or1;
	}
	public void setHouse_default_livingroom_type_0or1(String house_default_livingroom_type_0or1) {
		this.house_default_livingroom_type_0or1 = house_default_livingroom_type_0or1;
	}
	public String getHouse_default_livingroom_type() {
		return house_default_livingroom_type;
	}
	public void setHouse_default_livingroom_type(String house_default_livingroom_type) {
		this.house_default_livingroom_type = house_default_livingroom_type;
	}
	public String getHouse_default_kitchen_0or1() {
		return house_default_kitchen_0or1;
	}
	public void setHouse_default_kitchen_0or1(String house_default_kitchen_0or1) {
		this.house_default_kitchen_0or1 = house_default_kitchen_0or1;
	}
	public String getHouse_default_kitchen() {
		return house_default_kitchen;
	}
	public void setHouse_default_kitchen(String house_default_kitchen) {
		this.house_default_kitchen = house_default_kitchen;
	}
	public String getHouse_default_laundry_washer_0or1() {
		return house_default_laundry_washer_0or1;
	}
	public void setHouse_default_laundry_washer_0or1(String house_default_laundry_washer_0or1) {
		this.house_default_laundry_washer_0or1 = house_default_laundry_washer_0or1;
	}
	public String getHouse_default_laundry_washer() {
		return house_default_laundry_washer;
	}
	public void setHouse_default_laundry_washer(String house_default_laundry_washer) {
		this.house_default_laundry_washer = house_default_laundry_washer;
	}
	public String getHouse_default_laundry_dryer_0or1() {
		return house_default_laundry_dryer_0or1;
	}
	public void setHouse_default_laundry_dryer_0or1(String house_default_laundry_dryer_0or1) {
		this.house_default_laundry_dryer_0or1 = house_default_laundry_dryer_0or1;
	}
	public String getHouse_default_laundry_dryer() {
		return house_default_laundry_dryer;
	}
	public void setHouse_default_laundry_dryer(String house_default_laundry_dryer) {
		this.house_default_laundry_dryer = house_default_laundry_dryer;
	}
	public String getHouse_default_parking_0or1() {
		return house_default_parking_0or1;
	}
	public void setHouse_default_parking_0or1(String house_default_parking_0or1) {
		this.house_default_parking_0or1 = house_default_parking_0or1;
	}
	public String getHouse_default_parking() {
		return house_default_parking;
	}
	public void setHouse_default_parking(String house_default_parking) {
		this.house_default_parking = house_default_parking;
	}
	public String getHouse_default_gym_0or1() {
		return house_default_gym_0or1;
	}
	public void setHouse_default_gym_0or1(String house_default_gym_0or1) {
		this.house_default_gym_0or1 = house_default_gym_0or1;
	}
	public String getHouse_default_gym() {
		return house_default_gym;
	}
	public void setHouse_default_gym(String house_default_gym) {
		this.house_default_gym = house_default_gym;
	}
	public String getHouse_default_pool_0or1() {
		return house_default_pool_0or1;
	}
	public void setHouse_default_pool_0or1(String house_default_pool_0or1) {
		this.house_default_pool_0or1 = house_default_pool_0or1;
	}
	public String getHouse_default_pool() {
		return house_default_pool;
	}
	public void setHouse_default_pool(String house_default_pool) {
		this.house_default_pool = house_default_pool;
	}

	
	
	
	
	
	
	
	
	public void setHouse_defaultsetting_0or1(String house_defaultsetting_0or1) {
		this.house_defaultsetting_0or1 = house_defaultsetting_0or1;
	}
	public String getHouse_defaultsetting() {
		return house_defaultsetting;
	}
	public void setHouse_defaultsetting(String house_defaultsetting) {
		this.house_defaultsetting = house_defaultsetting;
	}
	public String getHouse_default_tv_0or1() {
		return house_default_tv_0or1;
	}
	public void setHouse_default_tv_0or1(String house_default_tv_0or1) {
		this.house_default_tv_0or1 = house_default_tv_0or1;
	}
	public String getHouse_default_tv() {
		return house_default_tv;
	}
	public void setHouse_default_tv(String house_default_tv) {
		this.house_default_tv = house_default_tv;
	}
	public String getHouse_default_wifi_0or1() {
		return house_default_wifi_0or1;
	}
	public void setHouse_default_wifi_0or1(String house_default_wifi_0or1) {
		this.house_default_wifi_0or1 = house_default_wifi_0or1;
	}
	public String getHouse_default_wifi() {
		return house_default_wifi;
	}
	public void setHouse_default_wifi(String house_default_wifi) {
		this.house_default_wifi = house_default_wifi;
	}
	public String getHouse_default_heater_0or1() {
		return house_default_heater_0or1;
	}
	public void setHouse_default_heater_0or1(String house_default_heater_0or1) {
		this.house_default_heater_0or1 = house_default_heater_0or1;
	}
	public String getHouse_default_heater() {
		return house_default_heater;
	}
	public void setHouse_default_heater(String house_default_heater) {
		this.house_default_heater = house_default_heater;
	}
	public String getHouse_default_cooler_0or1() {
		return house_default_cooler_0or1;
	}
	public void setHouse_default_cooler_0or1(String house_default_cooler_0or1) {
		this.house_default_cooler_0or1 = house_default_cooler_0or1;
	}
	public String getHouse_default_cooler() {
		return house_default_cooler;
	}
	public void setHouse_default_cooler(String house_default_cooler) {
		this.house_default_cooler = house_default_cooler;
	}
	public String getHouse_default_iron_0or1() {
		return house_default_iron_0or1;
	}
	public void setHouse_default_iron_0or1(String house_default_iron_0or1) {
		this.house_default_iron_0or1 = house_default_iron_0or1;
	}
	public String getHouse_default_iron() {
		return house_default_iron;
	}
	public void setHouse_default_iron(String house_default_iron) {
		this.house_default_iron = house_default_iron;
	}
	public String getHouse_default_fireditecter_0or1() {
		return house_default_fireditecter_0or1;
	}
	public void setHouse_default_fireditecter_0or1(String house_default_fireditecter_0or1) {
		this.house_default_fireditecter_0or1 = house_default_fireditecter_0or1;
	}
	public String getHouse_default_fireditecter() {
		return house_default_fireditecter;
	}
	public void setHouse_default_fireditecter(String house_default_fireditecter) {
		this.house_default_fireditecter = house_default_fireditecter;
	}
	public String getHouse_default_coditecter_0or1() {
		return house_default_coditecter_0or1;
	}
	public void setHouse_default_coditecter_0or1(String house_default_coditecter_0or1) {
		this.house_default_coditecter_0or1 = house_default_coditecter_0or1;
	}
	public String getHouse_default_coditecter() {
		return house_default_coditecter;
	}
	public void setHouse_default_coditecter(String house_default_coditecter) {
		this.house_default_coditecter = house_default_coditecter;
	}
	public String getHouse_default_aidkit_0or1() {
		return house_default_aidkit_0or1;
	}
	public void setHouse_default_aidkit_0or1(String house_default_aidkit_0or1) {
		this.house_default_aidkit_0or1 = house_default_aidkit_0or1;
	}
	public String getHouse_default_aidkit() {
		return house_default_aidkit;
	}
	public void setHouse_default_aidkit(String house_default_aidkit) {
		this.house_default_aidkit = house_default_aidkit;
	}
	public String getHouse_default_firesofwa_0or1() {
		return house_default_firesofwa_0or1;
	}
	public void setHouse_default_firesofwa_0or1(String house_default_firesofwa_0or1) {
		this.house_default_firesofwa_0or1 = house_default_firesofwa_0or1;
	}
	public String getHouse_default_firesofwa() {
		return house_default_firesofwa;
	}
	public void setHouse_default_firesofwa(String house_default_firesofwa) {
		this.house_default_firesofwa = house_default_firesofwa;
	}
	public String getHouse_default_bedrock_0or1() {
		return house_default_bedrock_0or1;
	}
	public void setHouse_default_bedrock_0or1(String house_default_bedrock_0or1) {
		this.house_default_bedrock_0or1 = house_default_bedrock_0or1;
	}
	public String getHouse_default_bedrock() {
		return house_default_bedrock;
	}
	public void setHouse_default_bedrock(String house_default_bedrock) {
		this.house_default_bedrock = house_default_bedrock;
	}
	
	
	
	
	
	
	public String getHouse_loaction_fulladdress() {
		return house_loaction_fulladdress;
	}
	public void setHouse_loaction_fulladdress(String house_loaction_fulladdress) {
		this.house_loaction_fulladdress = house_loaction_fulladdress;
	}
	public String getHouse_loaction_detailaddress() {
		return house_loaction_detailaddress;
	}
	public void setHouse_loaction_detailaddress(String house_loaction_detailaddress) {
		this.house_loaction_detailaddress = house_loaction_detailaddress;
	}

	public float getHouse_xlocation() {
		return house_xlocation;
	}
	public void setHouse_xlocation(float house_xlocation) {
		this.house_xlocation = house_xlocation;
	}
	public float getHouse_ylocation() {
		return house_ylocation;
	}
	public void setHouse_ylocation(float house_ylocation) {
		this.house_ylocation = house_ylocation;
	}
	public String getHouse_xlocation_str() {
		return house_xlocation_str;
	}
	public void setHouse_xlocation_str(String house_xlocation_str) {
		this.house_xlocation_str = house_xlocation_str;
	}
	public String getHouse_ylocation_str() {
		return house_ylocation_str;
	}
	public void setHouse_ylocation_str(String house_ylocation_str) {
		this.house_ylocation_str = house_ylocation_str;
	}
	public String getHouse_location() {
		return house_location;
	}
	public void setHouse_location(String house_location) {
		this.house_location = house_location;
	}
	public String getHouse_location_sido() {
		return house_location_sido;
	}
	public void setHouse_location_sido(String house_location_sido) {
		this.house_location_sido = house_location_sido;
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
	
	
	
	
	
	
	public String getHouse_bathroom_type_0or1() {
		return house_bathroom_type_0or1;
	}
	public void setHouse_bathroom_type_0or1(String house_bathroom_type_0or1) {
		this.house_bathroom_type_0or1 = house_bathroom_type_0or1;
	}
	public String getHouse_bathroom_type() {
		return house_bathroom_type;
	}
	public void setHouse_bathroom_type(String house_bathroom_type) {
		this.house_bathroom_type = house_bathroom_type;
	}
	public int getHouse_bathroom_amount() {
		return house_bathroom_amount;
	}
	public void setHouse_bathroom_amount(int house_bathroom_amount) {
		this.house_bathroom_amount = house_bathroom_amount;
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
		return "HouseVO [house_maxperson=" + house_maxperson + ", house_bedroom_amount=" + house_bedroom_amount
				+ ", house_bed_amount=" + house_bed_amount + ", house_bed_type_single=" + house_bed_type_single
				+ ", house_bed_type_double=" + house_bed_type_double + ", house_bed_type_queen=" + house_bed_type_queen
				+ ", house_bathroom_amount=" + house_bathroom_amount + ", house_bathroom_type=" + house_bathroom_type
				+ ", house_location=" + house_location + ", house_location_sido=" + house_location_sido
				+ ", house_location_gugun=" + house_location_gugun + ", house_location_postnum="
				+ house_location_postnum + ", house_xlocation=" + house_xlocation + ", house_ylocation="
				+ house_ylocation + ", house_location_fulladdress=" + house_loaction_fulladdress
				+ ", house_location_detailaddress=" + house_loaction_detailaddress + ", house_defaultsetting="
				+ house_defaultsetting + ", house_default_tv=" + house_default_tv + ", house_default_wifi="
				+ house_default_wifi + ", house_default_heater=" + house_default_heater + ", house_default_cooler="
				+ house_default_cooler + ", house_default_iron_0or1=" + house_default_iron_0or1
				+ ", house_default_iron=" + house_default_iron + ", house_default_fireditecter="
				+ house_default_fireditecter + ", house_default_coditecter=" + house_default_coditecter
				+ ", house_default_aidkit=" + house_default_aidkit + ", house_default_firesofwa="
				+ house_default_firesofwa + ", house_default_bedrock=" + house_default_bedrock
				+ ", house_default_livingroom_type=" + house_default_livingroom_type + ", house_default_kitchen="
				+ house_default_kitchen + ", house_default_laundry_washer=" + house_default_laundry_washer
				+ ", house_default_laundry_dryer=" + house_default_laundry_dryer + ", house_default_parking="
				+ house_default_parking + ", house_default_gym=" + house_default_gym + ", house_default_pool="
				+ house_default_pool + ", house_desc1=" + house_desc1 + ", house_desc2=" + house_desc2
				+ ", house_desc3=" + house_desc3 + ", house_desc4=" + house_desc4 + ", house_desc5=" + house_desc5
				+ ", house_photo=" + house_photo + ", house_photourl=" + house_photourl + ", house_name=" + house_name
				+ ", house_price_default_parInt=" + house_price_default_parInt + ", house_price_max_parInt="
				+ house_price_max_parInt + ", house_price_default=" + house_price_default + ", house_price_max="
				+ house_price_max + ", house_theme_bbq=" + house_theme_bbq + ", house_theme_pet=" + house_theme_pet
				+ ", house_theme_party=" + house_theme_party + ", house_theme_pool=" + house_theme_pool
				+ ", house_theme_farm=" + house_theme_farm + ", house_condition_childok=" + house_condition_childok
				+ ", house_condition_babyok=" + house_condition_babyok + ", house_condition_smokeok="
				+ house_condition_smokeok + ", house_restrict_stairs=" + house_restrict_stairs
				+ ", house_restrict_noise=" + house_restrict_noise + ", house_restrict_pet=" + house_restrict_pet
				+ ", house_restrict_cantpark=" + house_restrict_cantpark + ", house_restrict_commonspace="
				+ house_restrict_commonspace + ", house_restrict_facility=" + house_restrict_facility
				+ ", house_restrict_cctv=" + house_restrict_cctv + ", house_restrict_weapon=" + house_restrict_weapon
				+ ", house_restrict_beast=" + house_restrict_beast + ", house_checkin_time=" + house_checkin_time
				+ ", house_checkout_time=" + house_checkout_time + ", house_star=" + house_star + ", house_status="
				+ house_status + ", house_host_id=" + house_host_id + ", house_regdate=" + house_regdate + "]";
	}
	
	
	
	
	
	
}
