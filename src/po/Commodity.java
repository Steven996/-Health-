package po;

public class Commodity {
	private int commodity_id;
	private String commodity_name;
	private int commodity_totalCount;
	private String commodity_picture;
	private String commodity_price;
	private String commodity_detail;
	private String commodity_type;
	private String commodity_type_name;
	public String getCommodity_type_name() {
		return commodity_type_name;
	}
	public void setCommodity_type_name(String commodity_type_name) {
		this.commodity_type_name = commodity_type_name;
	}
	public int getCommodity_id() {
		return commodity_id;
	}
	public void setCommodity_id(int commodity_id) {
		this.commodity_id = commodity_id;
	}
	public String getCommodity_name() {
		return commodity_name;
	}
	public void setCommodity_name(String commodity_name) {
		this.commodity_name = commodity_name;
	}
	public int getCommodity_totalCount() {
		return commodity_totalCount;
	}
	public void setCommodity_totalCount(int commodity_totalCount) {
		this.commodity_totalCount = commodity_totalCount;
	}
	public String getCommodity_picture() {
		return commodity_picture;
	}
	public void setCommodity_picture(String commodity_picture) {
		this.commodity_picture = commodity_picture;
	}
	public String getCommodity_price() {
		return commodity_price;
	}
	public void setCommodity_price(String commodity_price) {
		this.commodity_price = commodity_price;
	}
	public String getCommodity_detail() {
		return commodity_detail;
	}
	public void setCommodity_detail(String commodity_detail) {
		this.commodity_detail = commodity_detail;
	}
	
	public String getCommodity_type() {
		return commodity_type;
	}
	public void setCommodity_type(String commodity_type) {
		this.commodity_type = commodity_type;
	}
	public String toString() {
		return "Commodity [commodity_id="+commodity_id+",commodity_name="+commodity_name+",commodity_type="+commodity_type+",commodity_type_name="+commodity_type_name+",commodity_totalCount="+commodity_totalCount+","
				+ "commodity_picture="+commodity_picture+",commodity_price="+commodity_price+",commodity_detail="+commodity_detail+"]";
	}
}
