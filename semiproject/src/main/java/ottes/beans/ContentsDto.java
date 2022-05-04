package ottes.beans;

public class ContentsDto {
	private int contentsNo;
	private String regionName;
	private String genreName;
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
	public String getRegionName() {
		return regionName;
	}
	public void setRegionName(String regionName) {
		this.regionName = regionName;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
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
		return "ContentsDto [contentsNo=" + contentsNo + ", regionName=" + regionName + ", genreName=" + genreName
				+ ", contentsTitle=" + contentsTitle + ", contentsViews=" + contentsViews + ", contentsGrade="
				+ contentsGrade + ", contentsTime=" + contentsTime + ", contentsDirector=" + contentsDirector
				+ ", contentsSummary=" + contentsSummary + "]";
	}
	
	
	

}