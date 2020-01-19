package po;

public class User {
	private int user_id;
	private String user_name;
	private String user_pass;
	private int vip;
	private String user_photo;
	public String getUser_photo() {
		return user_photo;
	}

	public void setUser_photo(String user_photo) {
		this.user_photo = user_photo;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public int getVip() {
		return vip;
	}

	public void setVip(int vip) {
		this.vip = vip;
	}

	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name+","
				+ "user_pass="+user_pass+",vip="+vip+"]";
	}
}
