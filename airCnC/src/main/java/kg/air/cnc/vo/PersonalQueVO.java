package kg.air.cnc.vo;

import java.sql.Date;

public class PersonalQueVO {
	private int personalq_idx;
	private String personalq_title;
	private String personalq_writer;
	private String personalq_type;
	private String personalq_content;
	private String personalq_answer;
	private Date personalq_regdate;
	public int getPersonalq_idx() {
		return personalq_idx;
	}
	public void setPersonalq_idx(int personalq_idx) {
		this.personalq_idx = personalq_idx;
	}
	public String getPersonalq_title() {
		return personalq_title;
	}
	public void setPersonalq_title(String personalq_title) {
		this.personalq_title = personalq_title;
	}
	public String getPersonalq_writer() {
		return personalq_writer;
	}
	public void setPersonalq_writer(String personalq_writer) {
		this.personalq_writer = personalq_writer;
	}
	public String getPersonalq_type() {
		return personalq_type;
	}
	public void setPersonalq_type(String personalq_type) {
		this.personalq_type = personalq_type;
	}
	public String getPersonalq_content() {
		return personalq_content;
	}
	public void setPersonalq_content(String personalq_content) {
		this.personalq_content = personalq_content;
	}
	public String getPersonalq_answer() {
		return personalq_answer;
	}
	public void setPersonalq_answer(String personalq_answer) {
		this.personalq_answer = personalq_answer;
	}
	public Date getPersonalq_regdate() {
		return personalq_regdate;
	}
	public void setPersonalq_regdate(Date personalq_regdate) {
		this.personalq_regdate = personalq_regdate;
	}
	@Override
	public String toString() {
		return "PersonalQueVO [personalq_idx=" + personalq_idx + ", personalq_title=" + personalq_title
				+ ", personalq_writer=" + personalq_writer + ", personalq_type=" + personalq_type
				+ ", personalq_content=" + personalq_content + ", personalq_answer=" + personalq_answer
				+ ", personalq_regdate=" + personalq_regdate + "]";
	}
	
	
}
