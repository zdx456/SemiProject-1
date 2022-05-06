package ottes.beans;

public class AttachmentDto {
	
	private int attachmentNo;
	private String attachmentUploadname;
	private String  attachmentSavename;
	private String attachmentType;
	private long attachmentSize;
	
	public AttachmentDto() {
		super();
	}
	
	public int getAttachmentNo() {
		return attachmentNo;
	}
	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}
	public String getAttachmentUploadname() {
		return attachmentUploadname;
	}
	public void setAttachmentUploadname(String attachmentUploadname) {
		this.attachmentUploadname = attachmentUploadname;
	}
	public String getAttachmentSavename() {
		return attachmentSavename;
	}
	public void setAttachmentSavename(String attachmentSavename) {
		this.attachmentSavename = attachmentSavename;
	}
	public String getAttachmentType() {
		return attachmentType;
	}
	public void setAttachmentType(String attachmentType) {
		this.attachmentType = attachmentType;
	}
	public long getAttachmentSize() {
		return attachmentSize;
	}
	public void setAttachmentSize(long attachmentSize) {
		this.attachmentSize = attachmentSize;
	}
	
	@Override
	public String toString() {
		return "AttachmentDto [attachmentNo=" + attachmentNo + ", attachmentUploadname=" + attachmentUploadname
				+ ", attachmentSavename=" + attachmentSavename + ", attachmentType=" + attachmentType
				+ ", attachmentSize=" + attachmentSize + "]";
	}

}
