package kg.air.cnc.vo;

import java.util.Date;

public class CuponVO {
	private int cupon_seq;
	private String cupon_number;
	private int cupon_discount_money;
	private int cupon_discount_rate;
	private Date cupon_limit;
	private String cupon_customer_id;

	public int getCupon_seq() {
		return cupon_seq;
	}

	public void setCupon_seq(int cupon_seq) {
		this.cupon_seq = cupon_seq;
	}

	public String getCupon_number() {
		return cupon_number;
	}

	public void setCupon_number(String cupon_number) {
		this.cupon_number = cupon_number;
	}

	public int getCupon_discount_money() {
		return cupon_discount_money;
	}

	public void setCupon_discount_money(int cupon_discount_money) {
		this.cupon_discount_money = cupon_discount_money;
	}

	public int getCupon_discount_rate() {
		return cupon_discount_rate;
	}

	public void setCupon_discount_rate(int cupon_discount_rate) {
		this.cupon_discount_rate = cupon_discount_rate;
	}

	public Date getCupon_limit() {
		return cupon_limit;
	}

	public void setCupon_limit(Date cupon_limit) {
		this.cupon_limit = cupon_limit;
	}

	public String getCupon_customer_id() {
		return cupon_customer_id;
	}

	public void setCupon_customer_id(String cupon_customer_id) {
		this.cupon_customer_id = cupon_customer_id;
	}

	@Override
	public String toString() {
		return "CuponVO [cupon_seq=" + cupon_seq + ", cupon_number=" + cupon_number + ", cupon_discount_money="
				+ cupon_discount_money + ", cupon_discount_rate=" + cupon_discount_rate + ", cupon_limit=" + cupon_limit
				+ ", cupon_customer_id=" + cupon_customer_id + "]";
	}

}
