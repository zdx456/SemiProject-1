package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OttContentsDao {
	
	public void insert(OttContentsDto ottContentsDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into ott_contents(ott_no, contents_no) values(?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ottContentsDto.getOttNo());
		ps.setInt(2, ottContentsDto.getContentsNo());
		
		ps.execute();
		
		con.close();
	}
	
	public boolean delete(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete ott_contents where contents_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	
}











