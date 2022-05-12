package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClientOttDao {

	public void insert(String clientId, int ottNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into client_ott values (?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
	
			ps.setString(1, clientId);
			ps.setInt(2, ottNo);
		
		ps.execute();
		
		con.close();
	}
	
	public boolean update(String clientId, int ottNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update client_ott set ott_no=? where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, ottNo);
		ps.setString(1, clientId);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	public boolean delete(String clientId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete from client_ott where client_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, clientId);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	public boolean delete(int ottNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete from client_ott where ott_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, ottNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	public List<ClientOttDto> selectList(String clientId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from client_ott where client_id = ? order by ott_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ResultSet rs = ps.executeQuery();
		List<ClientOttDto> list = new ArrayList<>();
		while(rs.next()) {
			ClientOttDto clientOttDto = new ClientOttDto();
			
			clientOttDto.setClientId(rs.getString("client_id"));
			clientOttDto.setOttNo(rs.getInt("ott_no"));
			list.add(clientOttDto);
			
		}
		con.close();
		return list;
	
	}
	


}
