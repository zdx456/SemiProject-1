package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClientDao {
	/*
		기본적으로 메소드 이름은 기존에 우리가 배웠던 이름과 같으나, 
		사용자용, 관리자용 메소드와 같은 사용자에 따른 이름을 메소드 이름에 추가했습니다.
		ex) deleteClient = 회원이 사이트를 탈퇴함.
		ex) deleteAdmin = 관리자가 회원을 탈퇴시킴.
		
		@author : 이기주
	 */
	
	// 회원 생성
	// @author : 이기주
	public void insert(ClientDto clientDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into client(client_id, client_pw, client_nick, client_gender, client_birth, client_email)"
				+ "values(?, ?, ?, ?, ?, ?)";
		//String sql = "insert into client(client_id, client_pw, client_nick, client_gender, client_grade, client_birth, client_email)"
			//	+ "values(?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientDto.getClientId());
		ps.setString(2, clientDto.getClientPw());
		ps.setString(3, clientDto.getClientNick());
		ps.setString(4, clientDto.getClientGender());		
		ps.setString(5, clientDto.getClientBirth());
		ps.setString(6, clientDto.getClientEmail());		
		ps.execute();
		
		con.close();
	}
	
	//ps.setString(5, clientDto.getClientGrade());
	// 회원 목록 전체 조회
	// @author : 이기주
	public List<ClientDto> select() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from client";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ClientDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ClientDto clientDto = new ClientDto();
			
			clientDto.setClientId(rs.getString("client_id"));
			clientDto.setClientNick(rs.getString("client_nick"));
			clientDto.setClientJoindate(rs.getDate("client_joindate"));
			clientDto.setClientGender(rs.getString("client_gender"));
			clientDto.setClientGrade(rs.getString("client_grade"));
			clientDto.setClientBirth(rs.getString("client_birth"));
			clientDto.setClientEmail(rs.getString("client_email"));
			
			list.add(clientDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 회원목록 아이디로 단일 조회(회원용)
	// @author : 이기주
	public ClientDto selectOne(String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from client where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ResultSet rs = ps.executeQuery();
		
		ClientDto clientDto;
		if(rs.next()) {
			clientDto = new ClientDto();
			
			clientDto.setClientId(rs.getString("client_id"));
			clientDto.setClientPw(rs.getString("client_pw"));
			clientDto.setClientNick(rs.getString("client_nick"));
			clientDto.setClientBirth(rs.getString("client_birth"));
			clientDto.setClientEmail(rs.getString("client_email"));
			clientDto.setClientGrade(rs.getString("client_grade"));
			clientDto.setClientJoindate(rs.getDate("client_joindate"));
		}
		else {
			clientDto = null;
		}
		
		con.close();
		
		return clientDto;
	}
	
	// 회원목록 아이디로 단일 조회(관리자용)
		// @author : 이기주
		public ClientDto selectOneAdmin(String clientId) throws Exception {
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from client where client_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, clientId);
			ResultSet rs = ps.executeQuery();
			
			ClientDto clientDto;
			if(rs.next()) {
				clientDto = new ClientDto();
				
				//data 13개 copy
				clientDto.setClientId(rs.getString("client_id"));
				clientDto.setClientNick(rs.getString("client_nick"));
				clientDto.setClientGender(rs.getString("client_gender"));
				clientDto.setClientGrade(rs.getString("client_grade"));
				clientDto.setClientEmail(rs.getString("client_email"));
				clientDto.setClientBirth(rs.getString("client_birth"));
				clientDto.setClientJoindate(rs.getDate("client_joindate"));
			}
			else {
				clientDto = null;
			}
			
			con.close();
			
			return clientDto;
		}

	
	// 비밀번호 변경(사용자, 관리자 같이 사용)
	// @author : 이기주
	public boolean changePassword(String clientId, String changePw) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update client set client_pw = ? where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, changePw);
		ps.setString(2, clientId);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

	
	// 회원탈퇴1 (회원 본인이 탈퇴 / 매개변수 아이디, 비밀번호)
	// @author : 이기주
	public boolean deleteClient(String clientId, String clientPw) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete client where client_id = ? and client_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ps.setString(2, clientPw);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	// 회원탈퇴2 (관리자가 회원을 탈퇴 시킴 / 매개변수 아이디만)
	//@author : 이기주
	public boolean deleteAdmin(String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete client where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

	
	// 회원 정보 수정(회원용)
	//@author : 이기주
	public boolean chgInfoClient(ClientDto clientDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update client set client_nick=? , client_gender=?, client_birth=? ,client_email=? where client_id=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientDto.getClientNick());
		ps.setString(2, clientDto.getClientGender());
		ps.setString(3, clientDto.getClientBirth());
		ps.setString(4, clientDto.getClientEmail());
		ps.setString(5, clientDto.getClientId());
		
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

	// 회원 정보 수정(관리자용 회원정보 수정, 비밀번호 수정은 따로 메소드가 있기 때문에 뺐습니다.)
	// @author : 이기주
	public boolean chgInfoAdmin(ClientDto clientDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update client set "
				+ "client_nick = ?, client_gender= ?, client_grade= ?, client_birth = ?, client_email = ? "
				+ "where client_id = ? ";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientDto.getClientNick());
		ps.setString(2, clientDto.getClientGender());
		ps.setString(3, clientDto.getClientGrade());
		ps.setString(4, clientDto.getClientBirth());
		ps.setString(5, clientDto.getClientEmail());
		ps.setString(6, clientDto.getClientId());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

	public void updateLogindate(String clientId) {
		// TODO Auto-generated method stub
		
	}
	//아이디찾기
	public String findId(ClientDto clientDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select client_id from client where client_nick=? and client_email=? and client_birth=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientDto.getClientNick());
		//System.out.println("ClientDao >> findid0 >> getClient닉 "+clientDto.getClientNick());	
		ps.setString(2, clientDto.getClientEmail());
		//System.out.println("ClientDao >> findid0 >> getClientEmail "+clientDto.getClientEmail());	
		ps.setString(3, clientDto.getClientBirth());
		//System.out.println("ClientDao >> findid0 >> getClient생일l "+clientDto.getClientBirth());	
		ResultSet rs = ps.executeQuery();
		
		String clientId;
		if(rs.next()) {
			clientId = rs.getString("client_id");
			
		}
		
		else {
		   
		    clientId = null;
			
		}
		
		con.close();
		
		return clientId;
	}
	public String findPw(ClientDto clientDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select client_id from client where client_id=? and client_nick=? and client_birth=? and client_email=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientDto.getClientId());
		//System.out.println("ClientDao >> findPw0 >> getClientId "+clientDto.getClientId());
		ps.setString(2, clientDto.getClientNick());
		//System.out.println("ClientDao >> findPw0 >> getClientNick "+clientDto.getClientNick());
		ps.setString(3, clientDto.getClientBirth());
		//System.out.println("ClientDao >> findPw0 >> getClientBirth "+clientDto.getClientBirth());
		ps.setString(4, clientDto.getClientEmail());
		//System.out.println("ClientDao >> findPw0 >> getClientEmail "+clientDto.getClientEmail());	
		ResultSet rs = ps.executeQuery();
		
		String clientId;
		if(rs.next()) {
			clientId = rs.getString("client_id");
		}
		else {
			clientId = "";
		}
		//System.out.println("ClientDao >> findPw0 >> clientId "+clientId);

		con.close();
		
		return clientId;
	}
	
	// 관리자-회원목록 출력(+페이지네이션)
		// @author : 이기주
		public List<ClientDto> selectListByPaging(int p, int s) throws Exception {
			int end = p * s;
			int begin = end - (s - 1); 
			
			Connection con = JdbcUtils.getConnection();
			
			String sql = "select * from ("
					+ "select rownum rn, TMP.* from ("
						+ "select * from client order by client_id asc"
					+ ") TMP"
				+ ") where rn between ? and ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			
			List<ClientDto> list = new ArrayList<>();
			while(rs.next()) {
				ClientDto clientDto = new ClientDto();
				
				clientDto.setClientId(rs.getString("client_id"));
				clientDto.setClientNick(rs.getString("client_nick"));
				clientDto.setClientGender(rs.getString("client_gender"));
				clientDto.setClientGrade(rs.getString("client_grade"));
				
				list.add(clientDto); 
			}
			
			con.close();
			
			return list;
		}
		
		// 관리자-회원목록 출력(+페이지네이션/검색 결과)
			public List<ClientDto> selectListByPaging(int p, int s, String type, String keyword) throws Exception {
				int end = p * s;
				int begin = end - (s - 1); 
				
				Connection con = JdbcUtils.getConnection();
				
				String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from client where #1 = ? order by client_id asc"
								+ ") TMP"
							+ ") where rn between ? and ?";
				sql = sql.replace("#1", type);
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, keyword);
				ps.setInt(2, begin);
				ps.setInt(3, end);
				ResultSet rs = ps.executeQuery();
				
				List<ClientDto> list = new ArrayList<>();
				while(rs.next()) {
					ClientDto clientDto = new ClientDto();
					
					clientDto.setClientId(rs.getString("client_id"));
					clientDto.setClientNick(rs.getString("client_nick"));
					clientDto.setClientGender(rs.getString("client_gender"));
					clientDto.setClientGrade(rs.getString("client_grade"));
					
					list.add(clientDto); 
				}
				
				con.close();
				
				return list;
			}
			
			// 페이지 카운팅
			public int countByPaging() throws Exception {
				Connection con = JdbcUtils.getConnection();
				
				String sql = "select count(*) from client";
				PreparedStatement ps = con.prepareStatement(sql);
				ResultSet rs = ps.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				
				con.close();
				
				return count;
			}
			
			// 페이지 카운팅 (검색 결과)
			public int countByPaging(String type, String keyword) throws Exception {
				Connection con = JdbcUtils.getConnection();
				
				String sql = "select count(*) from client where #1 = ?";
				sql = sql.replace("#1", type);
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, keyword);		
				ResultSet rs = ps.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				
				con.close();
				
				return count;
				
			}
///////////
			public ClientDto checkNick(String clientNick) throws Exception {
				Connection con = JdbcUtils.getConnection();
				
				String sql = "select * from client where client_nick = ?";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, clientNick);
				ResultSet rs = ps.executeQuery();
				
				ClientDto clientDto;
				if(rs.next()) {
					clientDto = new ClientDto();
					

					clientDto.setClientId(rs.getString("client_id"));
					clientDto.setClientPw(rs.getString("client_pw"));
					clientDto.setClientNick(rs.getString("client_nick"));
					clientDto.setClientBirth(rs.getString("client_birth"));
					clientDto.setClientEmail(rs.getString("client_email"));
					clientDto.setClientGrade(rs.getString("client_grade"));
					clientDto.setClientJoindate(rs.getDate("client_joindate"));
				}
				
				else {
					clientDto = null;
				}
				
				con.close();
				
				return clientDto;
}

}