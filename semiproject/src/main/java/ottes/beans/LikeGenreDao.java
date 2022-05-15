package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	// 선호 장르 입력 구문 수정
	// @author: 이기주
	public void insert2(String clientId, String genreName) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into likegenre values (?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
	
			ps.setString(1, clientId);
			ps.setString(2, genreName);
		
		ps.execute();
		
		con.close();
	}
	
	
	// 선호 장르 삭제 구문 추가
	// @author: 이기주
	public boolean delete(String clientId) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete from likegenre where client_id=?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, clientId);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
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
	
	// 회원 선호장르 리스트 출력 하는 기능
	// 회원 1명을 지정해서 해당 하는 회원의 모든 장르 이름을 검색합니다.
	// 이후 genre테이블의 이름과 같다면 선호하는 장르가 추가되어 있는것이므로 마이페이지, 수정페이지에 노출되도록 설계했습니다.
	// @author : 이기주
	public List<LikeGenreDto> selectLikeGenreList(String clientId) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select genre_name from likegenre where client_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ResultSet rs = ps.executeQuery();
		
		LikeGenreDto likeGenreDto;
		List<LikeGenreDto> list = new ArrayList<LikeGenreDto>();
		
		while(rs.next()) {
			likeGenreDto = new LikeGenreDto();
			likeGenreDto.setGenreName(rs.getString("genre_name"));
			
			list.add(likeGenreDto);
		}
		con.close();
		
	return list;
	}
	
	public void update(LikeGenreDto likeGenreDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into likegenre(client_id, genre_name) values(?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, likeGenreDto.getClientId());
		ps.setString(2, likeGenreDto.getGenreName());
		
		ps.execute();
		
		con.close();
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	장르DAO - selectList 에 SQL구문 수정
//	기존) select * from genre order by ott_no desc
//	변경) select * from genre order genre_name asc
//	*이유 : genre테이블에 데이터는 genre_name 밖에 없기 때문에, ott_no으로 정렬할 수 없음.
//	@author : 이기주
	
	public List<GenreDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from genre order genre_name asc";
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
