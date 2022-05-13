package ottes.beans;

public class ContentsAttachmentDto {	
	private int contentsNo;
	private int attachmentNo;
	
	// 조인용
	private String contentsTitle; // 콘텐츠 제목
	private String contentsSummary; // 콘텐츠 줄거리
	private float avgScore; // 평균 평점
	private int countLike; // 관심 수
	
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
	
	public String getContentsTitle() {
		return contentsTitle;
	}

	public void setContentsTitle(String contentsTitle) {
		this.contentsTitle = contentsTitle;
	}

	public float getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(float avgScore) {
		this.avgScore = avgScore; // 소수점 아래 둘째자리에서 내림
	}

	public int getCountLike() {
		return countLike;
	}

	public void setCountLike(int countLike) {
		this.countLike = countLike;
	}

	
	public String getContentsSummary() {
		return contentsSummary;
	}

	public void setContentsSummary(String contentsSummary) {
		this.contentsSummary = contentsSummary;
	}
	
	@Override
	public String toString() {
		return "ContentsAttachmentDto [contentsNo=" + contentsNo + ", attachmentNo=" + attachmentNo + "]";
	}
}
