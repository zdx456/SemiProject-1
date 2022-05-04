package ottes.beans;

public class ContentsActorDto {
	private int contentsNo;
	private int actorNo;
	
	public ContentsActorDto() {
		super();
	}
	
	public int getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}
	public int getActorNo() {
		return actorNo;
	}
	public void setActorNo(int actorNo) {
		this.actorNo = actorNo;
	}
	
	@Override
	public String toString() {
		return "ContentsActorDto [contentsNo=" + contentsNo + ", actorNo=" + actorNo + "]";
	}
	
	

}
