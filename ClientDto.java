package semiproject;
import java.sql.Date;
//to string 비밀번호 생성자 뺏어요
public class ClientDto {
	private String clientId; 
	private String clientPw;
	private String clientNick;
	private Date clientJoindate;
	private String clientGender;
	private String clientGrade;
	private Date clientBirth;
	private String clientEmail;
	@Override
	public String toString() {
		return "ClientDto [clientId=" + clientId + ", clientNick=" + clientNick + ", clientJoindate=" + clientJoindate
				+ ", clientGender=" + clientGender + ", clientGrade=" + clientGrade + ", clientBirth=" + clientBirth
				+ ", clientEmail=" + clientEmail + "]";
	}
	public ClientDto() {
		super();
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getClientPw() {
		return clientPw;
	}
	public void setClientPw(String clientPw) {
		this.clientPw = clientPw;
	}
	public String getClientNick() {
		return clientNick;
	}
	public void setClientNick(String clientNick) {
		this.clientNick = clientNick;
	}
	public Date getClientJoindate() {
		return clientJoindate;
	}
	public void setClientJoindate(Date clientJoindate) {
		this.clientJoindate = clientJoindate;
	}
	public String getClientGender() {
		return clientGender;
	}
	public void setClientGender(String clientGender) {
		this.clientGender = clientGender;
	}
	public String getClientGrade() {
		return clientGrade;
	}
	public void setClientGrade(String clientGrade) {
		this.clientGrade = clientGrade;
	}
	public Date getClientBirth() {
		return clientBirth;
	}
	public void setClientBirth(Date clientBirth) {
		this.clientBirth = clientBirth;
	}
	public String getClientEmail() {
		return clientEmail;
	}
	public void setClientEmail(String clientEmail) {
		this.clientEmail = clientEmail;
	}
}
