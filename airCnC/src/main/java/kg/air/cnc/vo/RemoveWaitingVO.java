package kg.air.cnc.vo;

import java.util.Date;

public class RemoveWaitingVO {
	private int house_seq;
	private Date house_remove_date;
	private int remove_status;

	public int getHouse_seq() {
		return house_seq;
	}

	public void setHouse_seq(int house_seq) {
		this.house_seq = house_seq;
	}

	public Date getHouse_remove_date() {
		return house_remove_date;
	}

	public void setHouse_remove_date(Date house_remove_date) {
		this.house_remove_date = house_remove_date;
	}

	public int getRemove_status() {
		return remove_status;
	}

	public void setRemove_status(int remove_status) {
		this.remove_status = remove_status;
	}

	@Override
	public String toString() {
		return "RemoveWaitingVO [house_seq=" + house_seq + ", house_remove_date=" + house_remove_date
				+ ", remove_status=" + remove_status + "]";
	}

}
