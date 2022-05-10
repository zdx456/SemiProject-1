package ottes.beans;

public class LikeContentsDto {
	
	private String clientId;
	private int contentsNo;
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public int getContentsNo() {
		return contentsNo;
	}
	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}
	public LikeContentsDto() {
		super();
	}
	@Override
	public String toString() {
		return "LikeContentsDto [clientId=" + clientId + ", contentsNo=" + contentsNo + "]";
	}
	
}
