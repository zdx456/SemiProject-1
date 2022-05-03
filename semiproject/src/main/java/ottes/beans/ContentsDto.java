package ottes.beans;

public class ContentsDto {
	private int contentsNo;
	private int regionNo;
	private int genreNo;
	private String contentsTitle;
	private int contentsViews;
	private String contentsGrade;
	private int contentsTime;
	private String contentsDirector;
	private String contentsSummary;
	
	public ContentsDto() {
		super();
	}

	public int getContentsNo() {
		return contentsNo;
	}

	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}

	public int getRegionNo() {
		return regionNo;
	}

	public void setRegionNo(int regionNo) {
		this.regionNo = regionNo;
	}

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	public String getContentsTitle() {
		return contentsTitle;
	}

	public void setContentsTitle(String contentsTitle) {
		this.contentsTitle = contentsTitle;
	}

	public int getContentsViews() {
		return contentsViews;
	}

	public void setContentsViews(int contentsViews) {
		this.contentsViews = contentsViews;
	}

	public String getContentsGrade() {
		return contentsGrade;
	}

	public void setContentsGrade(String contentsGrade) {
		this.contentsGrade = contentsGrade;
	}

	public int getContentsTime() {
		return contentsTime;
	}

	public void setContentsTime(int contentsTime) {
		this.contentsTime = contentsTime;
	}

	public String getContentsDirector() {
		return contentsDirector;
	}

	public void setContentsDirector(String contentsDirector) {
		this.contentsDirector = contentsDirector;
	}

	public String getContentsSummary() {
		return contentsSummary;
	}

	public void setContentsSummary(String contentsSummary) {
		this.contentsSummary = contentsSummary;
	}

	@Override
	public String toString() {
		return "ContentsDto [contentsNo=" + contentsNo + ", regionNo=" + regionNo + ", genreNo=" + genreNo
				+ ", contentsTitle=" + contentsTitle + ", contentsViews=" + contentsViews + ", contentsGrade="
				+ contentsGrade + ", contentsTime=" + contentsTime + ", contentsDirector=" + contentsDirector
				+ ", contentsSummary=" + contentsSummary + "]";
	}
	

}