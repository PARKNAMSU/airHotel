package kg.air.cnc.vo;

import java.util.Date;

public class Reservation_ChartVO {
	private String reschart_date;
	private int reschart_num;
	private int reschart_compare_before;
	private float reschart_persant;
	private int reschart_sum;
	private Date reschart_regdate;

	public Date getReschart_regdate() {
		return reschart_regdate;
	}
	public void setReschart_regdate(Date reschart_regdate) {
		this.reschart_regdate = reschart_regdate;
	}
	public String getReschart_date() {
		return reschart_date;
	}
	public void setReschart_date(String reschart_date) {
		this.reschart_date = reschart_date;
	}
	public int getReschart_num() {
		return reschart_num;
	}
	public void setReschart_num(int reschart_num) {
		this.reschart_num = reschart_num;
	}
	public int getReschart_compare_before() {
		return reschart_compare_before;
	}
	public void setReschart_compare_before(int reschart_compare_before) {
		this.reschart_compare_before = reschart_compare_before;
	}
	public float getReschart_persant() {
		return reschart_persant;
	}
	public void setReschart_persant(float reschart_persant) {
		this.reschart_persant = reschart_persant;
	}
	public int getReschart_sum() {
		return reschart_sum;
	}
	public void setReschart_sum(int reschart_sum) {
		this.reschart_sum = reschart_sum;
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
	private String searchConditionFirst;
	private String searchConditionSecond;
	private String searchType;
}
