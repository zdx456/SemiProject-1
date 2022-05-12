package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GenreDao {

		// 장르 등록
	public void insert(GenreDto genreDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into genre values (?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, genreDto.getGenreName());
		
		ps.execute();
		con.close();
	}
	
		// 장르 수정
	
	public boolean update(GenreDto generDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update genre set genre_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, generDto.getGenreName());

		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
		// 장르 목록
	
	public List<GenreDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from genre order by ott_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<GenreDto> list = new ArrayList<>();
		while(rs.next()) {
			GenreDto genreDto = new GenreDto();
			genreDto.setGenreName(rs.getString("genre_name"));
			
			list.add(genreDto);
		}
		con.close();
		return list;
	}
	
}