package ottes.beans;

	import java.sql.Date;

	public class ReviewDto {
		
		private int reviewNo;
		private int contentsNo;
		private String reviewWriter;
		private String reviewContent;
		private Date reviewTime;
		private int reviewScore;
		private String clientNick;
		private String contentsTitle;
		
		
		public String getContentsTitle() {
			return contentsTitle;
		}
		public void setContentsTitle(String contentsTitle) {
			this.contentsTitle = contentsTitle;
		}
		public String getClientNick() {
			return clientNick;
		}
		public void setClientNick(String clientNick) {
			this.clientNick = clientNick;
		}
		public int getReviewNo() {
			return reviewNo;
		}
		public void setReviewNo(int reviewNo) {
			this.reviewNo = reviewNo;
		}
		public int getContentsNo() {
			return contentsNo;
		}
		public void setContentsNo(int contentsNo) {
			this.contentsNo = contentsNo;
		}
		public String getReviewWriter() {
			return reviewWriter;
		}
		public void setReviewWriter(String reviewWriter) {
			this.reviewWriter = reviewWriter;
		}
		public String getReviewContent() {
			return reviewContent;
		}
		public void setReviewContent(String reviewContent) {
			this.reviewContent = reviewContent;
		}
		public Date getReviewTime() {
			return reviewTime;
		}
		public void setReviewTime(Date reviewTime) {
			this.reviewTime = reviewTime;
		}
		public int getReviewScore() {
			return reviewScore;
		}
		public void setReviewScore(int reviewScore) {
			this.reviewScore = reviewScore;
		}
		@Override
		public String toString() {
			return "ReviewDto [reviewNo=" + reviewNo + ", contentsNo=" + contentsNo + ", reviewWriter=" + reviewWriter
					+ ", reviewContent=" + reviewContent + ", reviewTime=" + reviewTime + ", reviewScore=" + reviewScore
					+ "]";
		}
		public ReviewDto() {
			super();
		}
		
		
		
	}

