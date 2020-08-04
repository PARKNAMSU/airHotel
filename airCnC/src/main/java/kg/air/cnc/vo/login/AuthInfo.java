package kg.air.cnc.vo.login;

// 회원 정보 세션 유지.
public class AuthInfo {
	
	private String id;
	private String name;
	
	public AuthInfo(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
