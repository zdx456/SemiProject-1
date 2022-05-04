package ottes.beans;

public class GenreDto {
	private String genreName;
	
	public GenreDto() {
		super();
	}
	
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	
	@Override
	public String toString() {
		return "GenreDto [genreName=" + genreName + "]";
	}

}