package kg.air.cnc.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class LogVO {
	private int log_seq;
	private String log_id;
	private String log_content;
	private String log_type;
	private String log_regdate;
	@JsonIgnore
	private String startDate;
	@JsonIgnore
	private String endDate;
	public int getLog_seq() {
		return log_seq;
	}
	public void setLog_seq(int log_seq) {
		this.log_seq = log_seq;
	}
	public String getLog_id() {
		return log_id;
	}
	public void setLog_id(String log_id) {
		this.log_id = log_id;
	}
	public String getLog_content() {
		return log_content;
	}
	public void setLog_content(String log_content) {
		this.log_content = log_content;
	}
	public String getLog_type() {
		return log_type;
	}
	public void setLog_type(String log_type) {
		this.log_type = log_type;
	}
	public String getLog_regdate() {
		return log_regdate;
	}
	public void setLog_regdate(String log_regdate) {
		this.log_regdate = log_regdate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
}
