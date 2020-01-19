package po;

public class Customer {
	private int customer_id;
	private String customer_name;
	private String customer_pass;
	private String customer_photo;
	private int vip;
	private double customer_height;
	private double customer_weight;
	private double customer_bmi;
	private String customer_tel;
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_pass() {
		return customer_pass;
	}
	public void setCustomer_pass(String customer_pass) {
		this.customer_pass = customer_pass;
	}
	public String getCustomer_photo() {
		return customer_photo;
	}
	public void setCustomer_photo(String customer_photo) {
		this.customer_photo = customer_photo;
	}
	public int getVip() {
		return vip;
	}
	public void setVip(int vip) {
		this.vip = vip;
	}
	public double getCustomer_height() {
		return customer_height;
	}
	public void setCustomer_height(double customer_height) {
		this.customer_height = customer_height;
	}
	public double getCustomer_weight() {
		return customer_weight;
	}
	public void setCustomer_weight(double customer_weight) {
		this.customer_weight = customer_weight;
	}
	public double getCustomer_bmi() {
		return customer_bmi;
	}
	public void setCustomer_bmi(double customer_bmi) {
		this.customer_bmi = customer_bmi;
	}
	public String getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}
	public String toString() {
		return "Customer [customer_id="+customer_id+",customer_name="+customer_name+",customer_bmi="+customer_bmi+"]";
	}
}
