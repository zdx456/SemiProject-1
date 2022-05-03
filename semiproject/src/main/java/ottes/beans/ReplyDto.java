package ottes.beans;

import java.sql.Date;

public class ReplyDto {
	private int replyNo;
	private int replyTarget;
	private String replyWriter;
	private String replyContent;
	private Date replyDate;
	
	public ReplyDto() {
		super();
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getReplyTarget() {
		return replyTarget;
	}

	public void setReplyTarget(int replyTarget) {
		this.replyTarget = replyTarget;
	}

	public String getReplyWriter() {
		return replyWriter;
	}

	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "ReplyDto [replyNo=" + replyNo + ", replyTarget=" + replyTarget + ", replyWriter=" + replyWriter
				+ ", replyContent=" + replyContent + ", replyDate=" + replyDate + "]";
	}	
}
