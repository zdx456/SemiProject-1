package ottes.beans;

public class GenreDto {
	private int genreNo;
	private String genreName;
	
	public GenreDto() {
		super();
	}
	
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	
	@Override
	public String toString() {
		return "GenreDto [genreNo=" + genreNo + ", genreName=" + genreName + "]";
	}

}