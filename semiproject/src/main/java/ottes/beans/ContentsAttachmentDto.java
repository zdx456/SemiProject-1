package ottes.beans;

public class ContentsAttachmentDto {
	
	private int contentsNo;
	private int attachmentNo;
	
	public ContentsAttachmentDto() {
		super();
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
	
	@Override
	public String toString() {
		return "ContentsAttachmentDto [contentsNo=" + contentsNo + ", attachmentNo=" + attachmentNo + "]";
	}
	
	

}
