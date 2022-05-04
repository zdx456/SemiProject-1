package ottes.beans;

public class RegionDto {

	private String regionName;
	
	public RegionDto() {
		super();
	}
	
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	
	@Override
	public String toString() {
		return "RegionDto [regionName=" + regionName + "]";
	}

}