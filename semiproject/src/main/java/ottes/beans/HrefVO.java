package ottes.beans;

public class HrefVO {
	private int ottNo;
	private String ottHref;
	private int contentsNo;
	private int attachmentNo;
	
	public int getOttNo() {
		return ottNo;
	}
	public void setOttNo(int ottNo) {
		this.ottNo = ottNo;
	}
	public String getOttHref() {
		return ottHref;
	}
	public void setOttHref(String ottHref) {
		this.ottHref = ottHref;
	}
	public int getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}
	public int getAttachmentNo() {
		return attachmentNo;
	}
	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}
	public HrefVO() {
		super();
	}
	@Override
	public String toString() {
		return "HrefVO [ottNo=" + ottNo + ", ottHref=" + ottHref + ", contentsNo=" + contentsNo + ", attachmentNo="
				+ attachmentNo + "]";
	}
	
}
