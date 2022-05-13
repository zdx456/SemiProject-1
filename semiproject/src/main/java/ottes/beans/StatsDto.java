package ottes.beans;

public class StatsDto {
	
	//장르이름
	private String genreName;
	
	//OTT이름
	private String ottName;
	
	//장르별 전체 count
	private int cntTotalGenre;
	
	//OTT별 전체 count
	private int cntTotalOtt;
	
	//장르별/성별 count
	private int cntMan;
	private int cntWoman;
	
	//장르별/나이대별 count
	private int cntTen;
	private int cntTwenty;
	private int cntThirty;
	private int cntForty;
	private int cntFifty;
	private int cntSixty;
	
	//콘텐츠 개수 (sum도 포함)
	private int conTotal;
	private int conDocumentary;
	private int conDrama;
	private int conVariety;
	private int conAnimation;
	private int conMovie;
	private int conAsia;
	private int conKorea;
	private int conHollywood;
	
	
	public StatsDto() {
		super();
	}
	
	public String getGenreName() {
		return genreName;
	}
	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}
	public String getOttName() {
		return ottName;
	}
	public void setOttName(String ottName) {
		this.ottName = ottName;
	}
	public int getCntTotalGenre() {
		return cntTotalGenre;
	}
	public void setCntTotalGenre(int cntTotalGenre) {
		this.cntTotalGenre = cntTotalGenre;
	}
	public int getCntTotalOtt() {
		return cntTotalOtt;
	}
	public void setCntTotalOtt(int cntTotalOtt) {
		this.cntTotalOtt = cntTotalOtt;
	}
	public int getCntMan() {
		return cntMan;
	}
	public void setCntMan(int cntMan) {
		this.cntMan = cntMan;
	}
	public int getCntWoman() {
		return cntWoman;
	}
	public void setCntWoman(int cntWoman) {
		this.cntWoman = cntWoman;
	}
	public int getCntTen() {
		return cntTen;
	}
	public void setCntTen(int cntTen) {
		this.cntTen = cntTen;
	}
	public int getCntTwenty() {
		return cntTwenty;
	}
	public void setCntTwenty(int cntTwenty) {
		this.cntTwenty = cntTwenty;
	}
	public int getCntThirty() {
		return cntThirty;
	}
	public void setCntThirty(int cntThirty) {
		this.cntThirty = cntThirty;
	}
	public int getCntForty() {
		return cntForty;
	}
	public void setCntForty(int cntForty) {
		this.cntForty = cntForty;
	}
	public int getCntFifty() {
		return cntFifty;
	}
	public void setCntFifty(int cntFifty) {
		this.cntFifty = cntFifty;
	}
	public int getCntSixty() {
		return cntSixty;
	}
	public void setCntSixty(int cntSixty) {
		this.cntSixty = cntSixty;
	}
	public int getConTotal() {
		return conTotal;
	}
	public void setConTotal(int conTotal) {
		this.conTotal = conTotal;
	}
	public int getConDocumentary() {
		return conDocumentary;
	}
	public void setConDocumentary(int conDocumentary) {
		this.conDocumentary = conDocumentary;
	}
	public int getConDrama() {
		return conDrama;
	}
	public void setConDrama(int conDrama) {
		this.conDrama = conDrama;
	}
	public int getConVariety() {
		return conVariety;
	}
	public void setConVariety(int conVariety) {
		this.conVariety = conVariety;
	}
	public int getConAnimation() {
		return conAnimation;
	}
	public void setConAnimation(int conAnimation) {
		this.conAnimation = conAnimation;
	}
	public int getConMovie() {
		return conMovie;
	}
	public void setConMovie(int conMovie) {
		this.conMovie = conMovie;
	}
	public int getConAsia() {
		return conAsia;
	}
	public void setConAsia(int conAsia) {
		this.conAsia = conAsia;
	}
	public int getConKorea() {
		return conKorea;
	}
	public void setConKorea(int conKorea) {
		this.conKorea = conKorea;
	}
	public int getConHollywood() {
		return conHollywood;
	}
	public void setConHollywood(int conHollywood) {
		this.conHollywood = conHollywood;
	}
	
	
	
	
	
}
