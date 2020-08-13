package kg.air.cnc.vo;

import java.sql.Date;

public class CommonQueVO {
	private int commonq_idx;
	private String commonq_title;
	private String commonq_content;
	private String commonq_type;
	private Date commonq_regdate;
	
	public int getCommonq_idx() {
		return commonq_idx;
	}
	public void setCommonq_idx(int commonq_idx) {
		this.commonq_idx = commonq_idx;
	}
	public String getCommonq_title() {
		return commonq_title;
	}
	public void setCommonq_title(String commonq_title) {
		this.commonq_title = commonq_title;
	}
	public String getCommonq_content() {
		return commonq_content;
	}
	public void setCommonq_content(String commonq_content) {
		this.commonq_content = commonq_content;
	}
	public String getCommonq_type() {
		return commonq_type;
	}
	public void setCommonq_type(String commonq_type) {
		this.commonq_type = commonq_type;
	}
	public Date getCommonq_regdate() {
		return commonq_regdate;
	}
	public void setCommonq_regdate(Date commonq_regdate) {
		this.commonq_regdate = commonq_regdate;
	}
	@Override
	public String toString() {
		return "CommonQueVO [commonq_idx=" + commonq_idx + ", commonq_title=" + commonq_title + ", commonq_content="
				+ commonq_content + ", commonq_type=" + commonq_type + ", commonq_regdate=" + commonq_regdate + "]";
	}
	
	
}
