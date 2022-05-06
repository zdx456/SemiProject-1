package ottes.beans;

public class ActorDto {
	private int actorNo;
	private String actorName1;
	private String actorName2;
	private String actorName3;
	private String actorName4;
	
	public ActorDto() {
		super();
	}
	
	public int getActorNo() {
		return actorNo;
	}
	public void setActorNo(int actorNo) {
		this.actorNo = actorNo;
	}
	public String getActorName1() {
		return actorName1;
	}
	public void setActorName1(String actorName1) {
		this.actorName1 = actorName1;
	}
	public String getActorName2() {
		return actorName2;
	}
	public void setActorName2(String actorName2) {
		this.actorName2 = actorName2;
	}
	public String getActorName3() {
		return actorName3;
	}
	public void setActorName3(String actorName3) {
		this.actorName3 = actorName3;
	}
	public String getActorName4() {
		return actorName4;
	}
	public void setActorName4(String actorName4) {
		this.actorName4 = actorName4;
	}
	
	@Override
	public String toString() {
		return "ActorDto [actorNo=" + actorNo + ", actorName1=" + actorName1 + ", actorName2=" + actorName2
				+ ", actorName3=" + actorName3 + ", actorName4=" + actorName4 + "]";
	}
	
	
	
	
}