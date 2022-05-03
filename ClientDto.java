package semiproject;
import java.sql.Date;
//to string 비밀번호 생성자 뺏어요
public class ClientDto {
	private String clientId; 
	private String clientPw;
	private String clientNick;
	private String clientBirth;
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	@Override
	public String toString() {
		return "ClientDto [clientId=" + clientId + ", clientNick=" + clientNick + ", clientBirth=" + clientBirth
				+ ", clientGrade=" + clientGrade + ", clientJoindate=" + clientJoindate + ", clientLogindate="
				+ clientLogindate + "]";
	}
	public String getClientPw() {
		return clientPw;
	}
	public void setClientPw(String clientPw) {
		this.clientPw = clientPw;
	}
	public ClientDto() {
		super();
	}
	public String getClientNick() {
		return clientNick;
	}
	public void setClientNick(String clientNick) {
		this.clientNick = clientNick;
	}
	public String getClientBirth() {
		return clientBirth;
	}
	public void setClientBirth(String clientBirth) {
		this.clientBirth = clientBirth;
	}
	public String getClientGrade() {
		return clientGrade;
	}
	public void setClientGrade(String clientGrade) {
		this.clientGrade = clientGrade;
	}
	public Date getClientJoindate() {
		return clientJoindate;
	}
	public void setClientJoindate(Date clientJoindate) {
		this.clientJoindate = clientJoindate;
	}
	public Date getClientLogindate() {
		return clientLogindate;
	}
	public void setClientLogindate(Date clientLogindate) {
		this.clientLogindate = clientLogindate;
	}
	private String clientGrade;
	private Date clientJoindate;
	private Date clientLogindate;
}
