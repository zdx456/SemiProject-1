package ottes.beans;

public class OttContentsDto {
	
	private int ottNo;
	private int contentsNo;
	
	public OttContentsDto() {
		super();
	}
	
	public int getOttNo() {
		return ottNo;
	}
	public void setOttNo(int ottNo) {
		this.ottNo = ottNo;
	}
	public int getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}
	
	@Override
	public String toString() {
		return "OttContentsDto [ottNo=" + ottNo + ", contentsNo=" + contentsNo + "]";
	}
	
	

}
