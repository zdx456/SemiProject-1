package ottes.beans;

import java.sql.Date;

public class NoticeDto {
	private int noticeNo;
	private String noticeWriter;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeDate;
	
	// 이전글
	private int noticeNoPrev;
	private String noticeTitlePrev;
	private Date noticeDatePrev;
	
	// 다음글
	private int noticeNoNext;
	private String noticeTitleNext;
	private Date noticeDateNext;
	
	public NoticeDto() {
		super();
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}
	
	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeNoPrev() {
		return noticeNoPrev;
	}

	public void setNoticeNoPrev(int noticeNoPrev) {
		this.noticeNoPrev = noticeNoPrev;
	}	

	public String getNoticeTitlePrev() {
		return noticeTitlePrev;
	}

	public void setNoticeTitlePrev(String noticeTitlePrev) {
		this.noticeTitlePrev = noticeTitlePrev;
	}

	public Date getNoticeDatePrev() {
		return noticeDatePrev;
	}

	public void setNoticeDatePrev(Date noticeDatePrev) {
		this.noticeDatePrev = noticeDatePrev;
	}

	public int getNoticeNoNext() {
		return noticeNoNext;
	}

	public void setNoticeNoNext(int noticeNoNext) {
		this.noticeNoNext = noticeNoNext;
	}	
	
	public String getNoticeTitleNext() {
		return noticeTitleNext;
	}

	public void setNoticeTitleNext(String noticeTitleNext) {
		this.noticeTitleNext = noticeTitleNext;
	}

	public Date getNoticeDateNext() {
		return noticeDateNext;
	}

	public void setNoticeDateNext(Date noticeDateNext) {
		this.noticeDateNext = noticeDateNext;
	}

	@Override
	public String toString() {
		return "NoticeDto [noticeNo=" + noticeNo + ", noticeWriter=" + noticeWriter + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + "]";
	}
}