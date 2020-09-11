package kg.air.cnc.vo;

import java.util.Date;

public class CommentsVO {
	
	private int comments_seq;
	private String comments_id;
	private String comments_name;
	private String comments_house_seq;
	private String comments_content;
	private String comments_image;
	private int comments_rate;
	private Date comments_regdate;
	private String comments_date;
	private float comments_average;
	
	public String getComments_image() {
		return comments_image;
	}
	public void setComments_image(String comments_image) {
		this.comments_image = comments_image;
	}
	public float getComments_average() {
		return comments_average;
	}
	public void setComments_average(float comments_average) {
		this.comments_average = comments_average;
	}
	public String getComments_date() {
		return comments_date;
	}
	public void setComments_date(String comments_date) {
		this.comments_date = comments_date;
	}
	public int getComments_seq() {
		return comments_seq;
	}
	public void setComments_seq(int comments_seq) {
		this.comments_seq = comments_seq;
	}
	public String getComments_id() {
		return comments_id;
	}
	public void setComments_id(String comments_id) {
		this.comments_id = comments_id;
	}
	public String getComments_name() {
		return comments_name;
	}
	public void setComments_name(String comments_name) {
		this.comments_name = comments_name;
	}
	public String getComments_house_seq() {
		return comments_house_seq;
	}
	public void setComments_house_seq(String comments_house_seq) {
		this.comments_house_seq = comments_house_seq;
	}
	public String getComments_content() {
		return comments_content;
	}
	public void setComments_content(String comments_content) {
		this.comments_content = comments_content;
	}
	public int getComments_rate() {
		return comments_rate;
	}
	public void setComments_rate(int comments_rate) {
		this.comments_rate = comments_rate;
	}
	public Date getComments_regdate() {
		return comments_regdate;
	}
	public void setComments_regdate(Date comments_regdate) {
		this.comments_regdate = comments_regdate;
	}
	
}
