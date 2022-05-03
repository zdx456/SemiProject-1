package ottes.beans;

public class ActorDto {
	private int actorNo;
	private String actorName;
	
	public ActorDto() {
		super();
	}
	
	public int getActorNo() {
		return actorNo;
	}
	public void setActorNo(int actorNo) {
		this.actorNo = actorNo;
	}
	public String getActorName() {
		return actorName;
	}
	public void setActorName(String actorName) {
		this.actorName = actorName;
	}
	
	@Override
	public String toString() {
		return "ActorDto [actorNo=" + actorNo + ", actorName=" + actorName + "]";
	}

}