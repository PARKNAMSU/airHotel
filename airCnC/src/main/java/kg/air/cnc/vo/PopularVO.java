package kg.air.cnc.vo;

public class PopularVO {
	private int popular_house_seq;
	private int popular_price_default;
	private int popular_price_max;

	public int getPopular_house_seq() {
		return popular_house_seq;
	}

	public void setPopular_house_seq(int popular_house_seq) {
		this.popular_house_seq = popular_house_seq;
	}

	public int getPopular_price_default() {
		return popular_price_default;
	}

	public void setPopular_price_default(int popular_price_default) {
		this.popular_price_default = popular_price_default;
	}

	public int getPopular_price_max() {
		return popular_price_max;
	}

	public void setPopular_price_max(int popular_price_max) {
		this.popular_price_max = popular_price_max;
	}

	@Override
	public String toString() {
		return "PopularVO [popular_house_seq=" + popular_house_seq + ", popular_price_default=" + popular_price_default
				+ ", popular_price_max=" + popular_price_max + "]";
	}

}
