package kg.air.cnc.vo;

import java.util.Date;

public class Admin_salesVO {
	private int admin_sales_seq;
	private int admin_sales;
	private int admin_sales_house_seq;
	private Date admin_sales_regdate;
	private String admin_sales_date;
	private int admin_sales_compare_before;
	private float admin_sales_persant;
	private String searchConditionFirst;
	private String searchConditionSecond;
	private String searchType;
	private int sumSales;
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
	public int getAdmin_sales_seq() {
		return admin_sales_seq;
	}
	public void setAdmin_sales_seq(int admin_sales_seq) {
		this.admin_sales_seq = admin_sales_seq;
	}
	public int getAdmin_sales() {
		return admin_sales;
	}
	public void setAdmin_sales(int admin_sales) {
		this.admin_sales = admin_sales;
	}
	public int getAdmin_sales_house_seq() {
		return admin_sales_house_seq;
	}
	public void setAdmin_sales_house_seq(int admin_sales_house_seq) {
		this.admin_sales_house_seq = admin_sales_house_seq;
	}

	public Date getAdmin_sales_regdate() {
		return admin_sales_regdate;
	}
	public void setAdmin_sales_regdate(Date admin_sales_regdate) {
		this.admin_sales_regdate = admin_sales_regdate;
	}
	public String getAdmin_sales_date() {
		return admin_sales_date;
	}
	public void setAdmin_sales_date(String admin_sales_date) {
		this.admin_sales_date = admin_sales_date;
	}
	public int getAdmin_sales_compare_before() {
		return admin_sales_compare_before;
	}
	public void setAdmin_sales_compare_before(int admin_sales_compare_before) {
		this.admin_sales_compare_before = admin_sales_compare_before;
	}
	public float getAdmin_sales_persant() {
		return admin_sales_persant;
	}
	public void setAdmin_sales_persant(float admin_sales_persant) {
		this.admin_sales_persant = admin_sales_persant;
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
	
}
