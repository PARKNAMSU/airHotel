package kg.air.cnc.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class EventVO {
	private int event_idx;
	private String event_title;
	private String event_writer;
	private String event_content;
	private Date event_regdate;
	private String event_start;
	private String event_end;
	private MultipartFile event_img;
	private String event_url;
	public int getEvent_idx() {
		return event_idx;
	}
	public void setEvent_idx(int event_idx) {
		this.event_idx = event_idx;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_writer() {
		return event_writer;
	}
	public void setEvent_writer(String event_writer) {
		this.event_writer = event_writer;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public Date getEvent_regdate() {
		return event_regdate;
	}
	public void setEvent_regdate(Date event_regdate) {
		this.event_regdate = event_regdate;
	}
	public String getEvent_start() {
		return event_start;
	}
	public void setEvent_start(String event_start) {
		this.event_start = event_start;
	}
	public String getEvent_end() {
		return event_end;
	}
	public void setEvent_end(String event_end) {
		this.event_end = event_end;
	}
	public MultipartFile getEvent_img() {
		return event_img;
	}
	public void setEvent_img(MultipartFile event_img) {
		this.event_img = event_img;
	}
	public String getEvent_url() {
		return event_url;
	}
	public void setEvent_url(String event_url) {
		this.event_url = event_url;
	}
	@Override
	public String toString() {
		return "EventVO [event_idx=" + event_idx + ", event_title=" + event_title + ", event_writer=" + event_writer
				+ ", event_content=" + event_content + ", event_regdate=" + event_regdate + ", event_start="
				+ event_start + ", event_end=" + event_end + ", event_img=" + event_img + ", event_url=" + event_url
				+ "]";
	}
	
	
}
