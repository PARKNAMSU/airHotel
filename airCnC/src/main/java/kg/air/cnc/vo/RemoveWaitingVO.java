package kg.air.cnc.vo;

import java.util.Date;

public class RemoveWaitingVO {
	private int house_seq;
	private Date house_remove_date;

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

	@Override
	public String toString() {
		return "RemoveWaitingVO [house_seq=" + house_seq + ", house_remove_date=" + house_remove_date + "]";
	}
	
	
}
