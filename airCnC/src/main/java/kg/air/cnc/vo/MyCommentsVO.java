package kg.air.cnc.vo;

public class MyCommentsVO {
	private int comments_seq;
	private String comments_id;
	private String house_name;
	private String comments_content;
	private int comments_rate;
	private String comments_regdate;
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
	public String getHouse_name() {
		return house_name;
	}
	public void setHouse_name(String house_name) {
		this.house_name = house_name;
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
	public String getComments_regdate() {
		return comments_regdate;
	}
	public void setComments_regdate(String comments_regdate) {
		this.comments_regdate = comments_regdate;
	}
	
}
