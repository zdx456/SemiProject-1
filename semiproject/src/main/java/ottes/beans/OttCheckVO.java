package ottes.beans;

public class OttCheckVO {
	private int ottNo, ottPrice;
	private String ottName;
	private boolean check;
	
	public OttCheckVO() {
		super();
	}
	
	public int getOttNo() {
		return ottNo;
	}
	public void setOttNo(int ottNo) {
		this.ottNo = ottNo;
	}
	public int getOttPrice() {
		return ottPrice;
	}
	public void setOttPrice(int ottPrice) {
		this.ottPrice = ottPrice;
	}
	public String getOttName() {
		return ottName;
	}
	public void setOttName(String ottName) {
		this.ottName = ottName;
	}
	public boolean isCheck() {
		return check;
	}
	public void setCheck(boolean check) {
		this.check = check;
	}
	@Override
	public String toString() {
		return "OttCheckVO [ottNo=" + ottNo + ", ottPrice=" + ottPrice + ", ottName=" + ottName + ", check=" + check
				+ "]";
	}
}
