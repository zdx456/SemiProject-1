package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LikeContentsDao {
	

	// 컨텐츠 좋아요 등록
	
public void insert(LikeContentsDto likeContentsDto) throws Exception{
	Connection con = JdbcUtils.getConnection();
	String sql = "insert into likecontents values (?, ?)";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, likeContentsDto.getClientId());
	ps.setInt(2, likeContentsDto.getContentsNo());
	
	ps.execute();
	con.close();
}



	// 좋아요 목록

	public List<LikeContentsDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from likecontents order by contents_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<LikeContentsDto> list = new ArrayList<>();
		while(rs.next()) {
			LikeContentsDto likeContentsDto = new LikeContentsDto();
			likeContentsDto.setClientId(rs.getString("client_id"));
			likeContentsDto.setContentsNo(rs.getInt("contents_no"));
			
			list.add(likeContentsDto);
		}
		con.close();
		return list;
	}
	
	public boolean update(LikeContentsDto likeContentsDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update likecontents set contents_no = ? where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, likeContentsDto.getContentsNo());
		ps.setString(2, likeContentsDto.getClientId());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	public boolean delete(String clientId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete likecontents where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	public LikeContentsDto selectOne(String clientId) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from likecontents where client_id = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ResultSet rs = ps.executeQuery();
		
		LikeContentsDto likeContentsDto;
		
		if(rs.next()) {
			likeContentsDto = new LikeContentsDto();
			likeContentsDto.setClientId(rs.getString("client_id"));

		}
		else {
			likeContentsDto = null;
		}
		
		con.close();
		
	return likeContentsDto;
}
	
	public LikeContentsDto find(String clientId, int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from likecontents where client_id = ? and contents_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ps.setInt(2, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		LikeContentsDto likeContentsDto;
		
		if(rs.next()) {
			likeContentsDto = new LikeContentsDto();
			likeContentsDto.setClientId(rs.getString("client_id"));
			likeContentsDto.setContentsNo(rs.getInt("contents_no"));

		}
		else {
			likeContentsDto = null;
		}
		
		con.close();
		
	return likeContentsDto;
}
	
	public int count() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from likecontents";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		LikeContentsDto likeContentsDto;

		  int likeCount = 0;
	        
	        if(rs.next()) { 
	        	likeCount = rs.getInt(1);
	        }
		
		con.close();
		
	return likeCount;
}
	

	
}
