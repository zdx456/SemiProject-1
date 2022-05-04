package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContentsDao {
	
	//컨텐츠 목록
	public List<ContentsDto> selectList() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from contents order by contents_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ContentsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setContentsNo(rs.getInt("contents_no"));
			contentsDto.setRegionName(rs.getString("region_name"));
			contentsDto.setGenreName(rs.getString("genre_name"));
			contentsDto.setContentsTitle(rs.getString("contents_title"));
			contentsDto.setContentsViews(rs.getInt("contents_views"));
			contentsDto.setContentsGrade(rs.getString("contents_grade"));
			contentsDto.setContentsTime(rs.getInt("contents_time"));
			contentsDto.setContentsDirector(rs.getString("contents_director"));
			contentsDto.setContentsSummary(rs.getString("contents_summary"));
			
			list.add(contentsDto);
			
		}
		
		con.close();
		
		return list;
	}
	
	//컨텐츠 상세 페이지
	public ContentsDto selectOne(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from contents where contents_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		ContentsDto contentsDto;
		
		if(rs.next()) {
			contentsDto = new ContentsDto();
			contentsDto.setContentsNo(rs.getInt("contents_no"));
			contentsDto.setRegionName(rs.getString("region_name"));
			contentsDto.setGenreName(rs.getString("genre_name"));
			contentsDto.setContentsTitle(rs.getString("contents_title"));
			contentsDto.setContentsViews(rs.getInt("contents_views"));
			contentsDto.setContentsGrade(rs.getString("contents_grade"));
			contentsDto.setContentsTime(rs.getInt("contents_time"));
			contentsDto.setContentsDirector(rs.getString("contents_director"));
			contentsDto.setContentsSummary(rs.getString("contents_summary"));
		}
		else {
			contentsDto = null;
		}
		
		con.close();
		
		return contentsDto;
	}
	
	//컨텐츠 삭제
	public boolean delete(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete contents where contents_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	//컨텐츠 수정
	public boolean update(ContentsDto contentsDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update contents set region_name=?, genre_name=?, contents_title=?, contents_grade=?, "
				+ "contents_time=?, contents_director=?, contents_summary=? where contents_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, contentsDto.getRegionName());
		ps.setString(2, contentsDto.getGenreName());
		ps.setString(3, contentsDto.getContentsTitle());
		ps.setString(4, contentsDto.getContentsGrade());
		ps.setInt(5, contentsDto.getContentsTime());
		ps.setString(6, contentsDto.getContentsDirector());
		ps.setString(7, contentsDto.getContentsSummary());
		ps.setInt(8, contentsDto.getContentsNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	//컨텐츠 검색
	public List<ContentsDto> selectList(String type, String keyword) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from contents where instr(#1, ?) > 0 order by contents_no desc";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		
		ResultSet rs = ps.executeQuery();
		
		List<ContentsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setContentsNo(rs.getInt("contents_no"));
			contentsDto.setRegionName(rs.getString("region_name"));
			contentsDto.setGenreName(rs.getString("genre_name"));
			contentsDto.setContentsTitle(rs.getString("contents_title"));
			contentsDto.setContentsViews(rs.getInt("contents_views"));
			contentsDto.setContentsGrade(rs.getString("contents_grade"));
			contentsDto.setContentsTime(rs.getInt("contents_time"));
			contentsDto.setContentsDirector(rs.getString("contents_director"));
			contentsDto.setContentsSummary(rs.getString("contents_summary"));
			
			list.add(contentsDto);
		}
		
		con.close();
		
		return list;
		
	}
	
	
	//컨텐츠 등록 - 시퀀스
	public int getSequence() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select contents_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	//컨텐츠 등록
	public void insert(ContentsDto contentsDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into contents("
				+ "contents_no, region_name, genre_name, contents_title, contents_grade, contents_time, contents_director, contents_summary"
				+ ") values (?, ?, ?, ?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,  contentsDto.getContentsNo());
		ps.setString(2, contentsDto.getRegionName());
		ps.setString(3, contentsDto.getGenreName());
		ps.setString(4, contentsDto.getContentsTitle());
		ps.setString(5, contentsDto.getContentsGrade());
		ps.setInt(6, contentsDto.getContentsTime());
		ps.setString(7, contentsDto.getContentsDirector());
		ps.setString(8, contentsDto.getContentsSummary());
		
		ps.execute();
		
		con.close();
		
	}
	
	//페이징 - 전체 목록
	public List<ContentsDto> selectListByPaging(int page, int size) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
				+ "select rownum RN, TMP.* from ("
					+ "select * from contents order by contents_no desc"
					+ ") TMP"
				+ ") where RN between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		int end = page * size;
		int begin = end - (size-1);
		
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<ContentsDto> list = new ArrayList<>();
				
		while(rs.next()) {
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setContentsNo(rs.getInt("contents_no"));
			contentsDto.setRegionName(rs.getString("region_name"));
			contentsDto.setGenreName(rs.getString("genre_name"));
			contentsDto.setContentsTitle(rs.getString("contents_title"));
			contentsDto.setContentsViews(rs.getInt("contents_views"));
			contentsDto.setContentsGrade(rs.getString("contents_grade"));
			contentsDto.setContentsTime(rs.getInt("contents_time"));
			contentsDto.setContentsDirector(rs.getString("contents_director"));
			contentsDto.setContentsSummary(rs.getString("contents_summary"));
			
			list.add(contentsDto);
			
		}
		
		con.close();
		
		return list;		
	}
	
	//페이징 - 검색 목록
	public List<ContentsDto> selectListByPaging(int page, int size, String type, String keyword) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
				+ "select rownum RN, TMP.* from ("
					+ "select * from contents where instr(#1, ?) > 0"
					+ "order by contents_no desc"
					+ ") TMP"
				+ ") where RN between ? and ?";
		sql = sql.replace("#1", type);
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		int end = page * size;
		int begin = end - (size-1);
		
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<ContentsDto> list = new ArrayList<>();
				
		while(rs.next()) {
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setContentsNo(rs.getInt("contents_no"));
			contentsDto.setRegionName(rs.getString("region_name"));
			contentsDto.setGenreName(rs.getString("genre_name"));
			contentsDto.setContentsTitle(rs.getString("contents_title"));
			contentsDto.setContentsViews(rs.getInt("contents_views"));
			contentsDto.setContentsGrade(rs.getString("contents_grade"));
			contentsDto.setContentsTime(rs.getInt("contents_time"));
			contentsDto.setContentsDirector(rs.getString("contents_director"));
			contentsDto.setContentsSummary(rs.getString("contents_summary"));
			
			list.add(contentsDto);
			
		}
		
		con.close();
		
		return list;		
	}
	
	//전체 목록 - 게시글 숫자 카운트
	public int countByPaging() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from contents";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//검색 목록 - 게시글 숫자 카운트
	public int countByPaging(String type, String keyword) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from contents";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
}























