package po;

public class CommodityType {
	private String commodity_id;
	private int commodity_type_id;
	private String commodity_type_name;
	
	public String getCommodity_id() {
		return commodity_id;
	}
	public void setCommodity_id(String commodity_id) {
		this.commodity_id = commodity_id;
	}
	
	public int getCommodity_type_id() {
		return commodity_type_id;
	}
	public void setCommodity_type_id(int commodity_type_id) {
		this.commodity_type_id = commodity_type_id;
	}
	public String getCommodity_type_name() {
		return commodity_type_name;
	}
	public void setCommodity_type_name(String commodity_type_name) {
		this.commodity_type_name = commodity_type_name;
	}
	public String toString() {
		return "CommodityType [commodity_id="+commodity_id+",commodity_type_id="+commodity_type_id+",commodity_type_name="+commodity_type_name+"]";
	}
}
