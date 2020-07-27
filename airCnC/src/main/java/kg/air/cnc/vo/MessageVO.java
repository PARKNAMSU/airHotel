package kg.air.cnc.vo;

import java.sql.Timestamp;

public class MessageVO {
	private int message_seq;
	private String message_from_id;
	private String message_to_id;
	private String message_from_img;
	private String message_to_img;
	private String message_from_name;
	private String message_to_name;
	private String message_content;
	private String message_type;
	private Timestamp message_regdate;
	private String message_date;
	private String message_time;
	public int getMessage_seq() {
		return message_seq;
	}
	public void setMessage_seq(int message_seq) {
		this.message_seq = message_seq;
	}
	public String getMessage_from_id() {
		return message_from_id;
	}
	public void setMessage_from_id(String message_from_id) {
		this.message_from_id = message_from_id;
	}
	public String getMessage_to_id() {
		return message_to_id;
	}
	public void setMessage_to_id(String message_to_id) {
		this.message_to_id = message_to_id;
	}
	public String getMessage_from_img() {
		return message_from_img;
	}
	public void setMessage_from_img(String message_from_img) {
		this.message_from_img = message_from_img;
	}
	public String getMessage_to_img() {
		return message_to_img;
	}
	public void setMessage_to_img(String message_to_img) {
		this.message_to_img = message_to_img;
	}
	public String getMessage_from_name() {
		return message_from_name;
	}
	public void setMessage_from_name(String message_from_name) {
		this.message_from_name = message_from_name;
	}
	public String getMessage_to_name() {
		return message_to_name;
	}
	public void setMessage_to_name(String message_to_name) {
		this.message_to_name = message_to_name;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public String getMessage_type() {
		return message_type;
	}
	public void setMessage_type(String message_type) {
		this.message_type = message_type;
	}
	public Timestamp getMessage_regdate() {
		return message_regdate;
	}
	public void setMessage_regdate(Timestamp message_regdate) {
		this.message_regdate = message_regdate;
	}
	public String getMessage_date() {
		return message_date;
	}
	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}
	public String getMessage_time() {
		return message_time;
	}
	public void setMessage_time(String message_time) {
		this.message_time = message_time;
	}
	
}
