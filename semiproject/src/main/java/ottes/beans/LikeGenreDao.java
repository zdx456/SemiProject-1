package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeGenreDao {

		// 선호 장르 등록하기
	
	public void insert(LikeGenreDto likeGenreDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into likegenre(client_id, genre_name) values(?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, likeGenreDto.getClientId());
		ps.setString(2, likeGenreDto.getGenreName());
		
		ps.execute();
		
		con.close();
	}
	
	// 선호 장르 단일 조회 (마이페이지에서 출력할 때 사용)
	
	public LikeGenreDto selectOne(String clientId) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from likegenre where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ResultSet rs = ps.executeQuery();
		
		LikeGenreDto likeGenreDto;
		
		if(rs.next()) {
			likeGenreDto = new LikeGenreDto();
			likeGenreDto.setClientId(rs.getString("client_id"));
			likeGenreDto.setGenreName(rs.getString("genre_name"));
		}
		else {
			likeGenreDto = null;
		}
		
		con.close();
		return likeGenreDto;
	}
	
}
