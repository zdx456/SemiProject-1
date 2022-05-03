package ottes.beans;

public class RegionDto {
	private int regionNo;
	private String regionName;
	
	public RegionDto() {
		super();
	}
	
	public int getRegionNo() {
		return regionNo;
	}
	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	
	@Override
	public String toString() {
		return "RegionDto [regionNo=" + regionNo + ", regionName=" + regionName + "]";
	}

}