package ottes.beans;

public class LikeGenreDto {
	
	private String clientId;
	private String genreName;
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	public LikeGenreDto() {
		super();
	}
	@Override
	public String toString() {
		return "LikeGenreDto [clientId=" + clientId + ", genreName=" + genreName + "]";
	}

}
