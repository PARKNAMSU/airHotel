package kg.air.cnc.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Host_sales_chartVO {
	private int host_sales_seq;
	private int host_sales;
	private int host_house_seq;
	private Date host_sales_regdate;
	private String host_sales_date;
	private int host_sales_compare_before;
	private float host_sales_persant;
	private String host_id;
	private String searchConditionFirst;
	private String searchConditionSecond;
	private String searchType;
	private int sumSales;
	private Map<Integer, Integer> sumSalesEachHouse = new HashMap<Integer, Integer>();
	private ArrayList<Integer> house_seq_list = new ArrayList<Integer>();
	
	public ArrayList<Integer> getHouse_seq_list() {
		return house_seq_list;
	}
	public void setHouse_seq_list(ArrayList<Integer> house_seq_list) {
		this.house_seq_list = house_seq_list;
	}
	public Map<Integer, Integer> getSumSalesEachHouse() {
		return sumSalesEachHouse;
	}
	public void setSumSalesEachHouse(Map<Integer, Integer> sumSalesEachHouse) {
		this.sumSalesEachHouse = sumSalesEachHouse;
	}
	public int getHost_sales_seq() {
		return host_sales_seq;
	}
	public void setHost_sales_seq(int host_sales_seq) {
		this.host_sales_seq = host_sales_seq;
	}
	public int getHost_sales() {
		return host_sales;
	}
	public void setHost_sales(int host_sales) {
		this.host_sales = host_sales;
	}
	public int getHost_house_seq() {
		return host_house_seq;
	}
	public void setHost_house_seq(int host_house_seq) {
		this.host_house_seq = host_house_seq;
	}
	public Date getHost_sales_regdate() {
		return host_sales_regdate;
	}
	public void setHost_sales_regdate(Date host_sales_regdate) {
		this.host_sales_regdate = host_sales_regdate;
	}
	public String getHost_sales_date() {
		return host_sales_date;
	}
	public void setHost_sales_date(String host_sales_date) {
		this.host_sales_date = host_sales_date;
	}
	public int getHost_sales_compare_before() {
		return host_sales_compare_before;
	}
	public void setHost_sales_compare_before(int host_sales_compare_before) {
		this.host_sales_compare_before = host_sales_compare_before;
	}
	public float getHost_sales_persant() {
		return host_sales_persant;
	}
	public void setHost_sales_persant(float host_sales_persant) {
		this.host_sales_persant = host_sales_persant;
	}
	public String getHost_id() {
		return host_id;
	}
	public void setHost_id(String host_id) {
		this.host_id = host_id;
	}
	public String getSearchConditionFirst() {
		return searchConditionFirst;
	}
	public void setSearchConditionFirst(String searchConditionFirst) {
		this.searchConditionFirst = searchConditionFirst;
	}
	public String getSearchConditionSecond() {
		return searchConditionSecond;
	}
	public void setSearchConditionSecond(String searchConditionSecond) {
		this.searchConditionSecond = searchConditionSecond;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public int getSumSales() {
		return sumSales;
	}
	public void setSumSales(int sumSales) {
		this.sumSales = sumSales;
	}
	
}
