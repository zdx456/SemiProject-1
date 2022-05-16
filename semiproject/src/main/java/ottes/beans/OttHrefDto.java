package ottes.beans;

public class OttHrefDto {
	
	private String ottHref;
	private int ottNo;
	public String getOttHref() {
		return ottHref;
	}
	public void setOttHref(String ottHref) {
		this.ottHref = ottHref;
	}
	public int getOttNo() {
		return ottNo;
	}
	public void setOttNo(int ottNo) {
		this.ottNo = ottNo;
	}
	public OttHrefDto() {
		super();
	}
	@Override
	public String toString() {
		return "OttHrefDto [ottHref=" + ottHref + ", ottNo=" + ottNo + "]";
	}

}
