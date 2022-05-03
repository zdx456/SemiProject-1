package ottes.beans;

import java.sql.Date;

public class InquiryDto {
	private int inquiryNo;
	private String inquiryWriter;
	private String inquiryType;
	private String inquiryTitle;
	private String inquiryContent;
	private Date inquiryDate;
	private int inquiryReadcount;
	private int inquiryReplycount;
	
	public InquiryDto() {
		super();
	}

	public int getInquiryNo() {
		return inquiryNo;
	}

	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}

	public String getInquiryWriter() {
		return inquiryWriter;
	}

	public void setInquiryWriter(String inquiryWriter) {
		this.inquiryWriter = inquiryWriter;
	}

	public String getInquiryType() {
		return inquiryType;
	}

	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}

	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public String getInquiryContent() {
		return inquiryContent;
	}

	public void setInquiryContent(String inquiryContent) {
		this.inquiryContent = inquiryContent;
	}

	public Date getInquiryDate() {
		return inquiryDate;
	}

	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}

	public int getInquiryReadcount() {
		return inquiryReadcount;
	}

	public void setInquiryReadcount(int inquiryReadcount) {
		this.inquiryReadcount = inquiryReadcount;
	}

	public int getInquiryReplycount() {
		return inquiryReplycount;
	}

	public void setInquiryReplycount(int inquiryReplycount) {
		this.inquiryReplycount = inquiryReplycount;
	}

	@Override
	public String toString() {
		return "InquiryDto [inquiryNo=" + inquiryNo + ", inquiryWriter=" + inquiryWriter + ", inquiryType="
				+ inquiryType + ", inquiryTitle=" + inquiryTitle + ", inquiryContent=" + inquiryContent
				+ ", inquiryDate=" + inquiryDate + ", inquiryReadcount=" + inquiryReadcount + ", inquiryReplycount="
				+ inquiryReplycount + "]";
	}
}
