package ottes.beans;

public class LikeContentsDto {
	
	private String clientId;
	private int contentsNo;
	private int likeNo;
	
	
	public LikeContentsDto() {
		super();
	}
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

	@Override
	public String toString() {
		return "LikeContentsDto [clientId=" + clientId + ", contentsNo=" + contentsNo + ", likeNo=" + likeNo + "]";
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	
}
