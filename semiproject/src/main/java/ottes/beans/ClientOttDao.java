package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ClientOttDao {

	public void insert(ClientOttDto clientOttDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into client_ott values (?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
	
		ps.setString(1, clientOttDto.getClinetId());
		ps.setInt(2, clientOttDto.getOttNo());
		
		ps.execute();
		
		con.close();
	}
	
	public boolean update(ClientOttDto clientOttDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update client_ott set ott_no=? where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, clientOttDto.getOttNo());
		ps.setString(1, clientOttDto.getClinetId());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
}
