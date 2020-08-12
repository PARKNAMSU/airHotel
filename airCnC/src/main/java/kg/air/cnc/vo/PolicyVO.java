package kg.air.cnc.vo;

import java.sql.Date;

public class PolicyVO {
	private int policy_idx;
	private String policy_title;
	private String policy_writer;
	private String policy_content;
	private Date policy_regdate;
	public int getPolicy_idx() {
		return policy_idx;
	}
	public void setPolicy_idx(int policy_idx) {
		this.policy_idx = policy_idx;
	}
	public String getPolicy_title() {
		return policy_title;
	}
	public void setPolicy_title(String policy_title) {
		this.policy_title = policy_title;
	}
	public String getPolicy_writer() {
		return policy_writer;
	}
	public void setPolicy_writer(String policy_writer) {
		this.policy_writer = policy_writer;
	}
	public String getPolicy_content() {
		return policy_content;
	}
	public void setPolicy_content(String policy_content) {
		this.policy_content = policy_content;
	}
	public Date getPolicy_regdate() {
		return policy_regdate;
	}
	public void setPolicy_regdate(Date policy_regdate) {
		this.policy_regdate = policy_regdate;
	}
	@Override
	public String toString() {
		return "PolicyVO [policy_idx=" + policy_idx + ", policy_title=" + policy_title + ", policy_writer="
				+ policy_writer + ", policy_content=" + policy_content + ", policy_regdate=" + policy_regdate + "]";
	}
	
}
