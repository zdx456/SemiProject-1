package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InquiryDao {
	// 문의&오류 접수 게시판 리스트 출력
	public List<InquiryDto> selectListByPaging(int p, int s) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from inquiry order by inquiry_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<InquiryDto> list = new ArrayList<>();
		while(rs.next()) {
			InquiryDto inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
			
			list.add(inquiryDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 내가 접수한 문의&오류 리스트 출력
	public List<InquiryDto> selectMyListByPaging(int p, int s, String writer) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from inquiry where inquiry_writer = ? order by inquiry_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, writer);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<InquiryDto> list = new ArrayList<>();
		while(rs.next()) {
			InquiryDto inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
			
			list.add(inquiryDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 문의&오류 게시판 리스트 출력 (옵션 검색 결과)
	public List<InquiryDto> selectListByPaging(int p, int s, String option, String keyword) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from inquiry where instr(#1, ?) > 0 order by inquiry_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		sql = sql.replace("#1", option);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<InquiryDto> list = new ArrayList<>();
		while(rs.next()) {
			InquiryDto inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
			
			list.add(inquiryDto);
		}
		
		con.close();
		
		return list;
	}

	// 문의&오류 게시판 리스트 출력 (통합 검색 결과)
	public List<InquiryDto> selectListByPaging(int p, int s, String keyword) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from inquiry where instr(inquiry_writer, ?) > 0 or instr(inquiry_title, ?) > 0 or instr(inquiry_content, ?) > 0 "
							+ "order by inquiry_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setInt(4, begin);
		ps.setInt(5, end);
		ResultSet rs = ps.executeQuery();
		
		List<InquiryDto> list = new ArrayList<>();
		while(rs.next()) {
			InquiryDto inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
			
			list.add(inquiryDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 내가 접수한 문의&오류 리스트 출력 (통합 검색 결과)
	public List<InquiryDto> selectMyListByPaging(int p, int s, String keyword, String writer) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from inquiry where instr(inquiry_title, ?) > 0 or instr(inquiry_content, ?) > 0 and inquiry_writer = ? order by inquiry_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, writer);
		ps.setInt(4, begin);
		ps.setInt(5, end);
		ResultSet rs = ps.executeQuery();
		
		List<InquiryDto> list = new ArrayList<>();
		while(rs.next()) {
			InquiryDto inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
			
			list.add(inquiryDto);
		}
		
		con.close();
		
		return list;
	}	
	
	// 문의&오류 게시판 리스트 출력 (정렬)
	public List<InquiryDto> selectListSortByPaging(int p, int s, String type) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from inquiry where inquiry_type = ? order by inquiry_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<InquiryDto> list = new ArrayList<>();
		while(rs.next()) {
			InquiryDto inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
			
			list.add(inquiryDto);
		}
		
		con.close();
		
		return list;
	}	

	// 내가 접수한 문의&오류 리스트 출력 (정렬)
	public List<InquiryDto> selectMyListSortByPaging(int p, int s, String type, String writer) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from inquiry where inquiry_type = ? and inquiry_writer = ? order by inquiry_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);
		ps.setString(2, writer);
		ps.setInt(3, begin);
		ps.setInt(4, end);
		ResultSet rs = ps.executeQuery();
		
		List<InquiryDto> list = new ArrayList<>();
		while(rs.next()) {
			InquiryDto inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
			
			list.add(inquiryDto);
		}
		
		con.close();
		
		return list;
	}	
	
	// 페이지 카운팅
	public int countByPaging() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from inquiry";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	// 페이지 카운팅 (옵션 검색 결과)
	public int countByPaging(String option, String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from inquiry where instr(#1, ?) > 0";
		sql = sql.replace("#1", option);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}

	// 페이지 카운팅 (통합 검색 결과)
	public int countByPaging(String keyword) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from inquiry where instr(inquiry_writer, ?) > 0 or instr(inquiry_title, ?) > 0 or instr(inquiry_content, ?) > 0";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setString(2, keyword);	
		ps.setString(3, keyword);	
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	// 페이지 카운팅 (정렬)
	public int countSortByPaging(String type) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from inquiry where inquiry_type = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	// 내 문의 페이지 카운팅
	public int countMyListByPaging(String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from inquiry where inquiry_writer = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);	
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}

	// 내 문의 페이지 카운팅 (통합 검색 결과)
	public int countMyListByPaging(String keyword, String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from inquiry where instr(inquiry_title, ?) > 0 or instr(inquiry_content, ?) > 0 and inquiry_writer = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setString(2, keyword);	
		ps.setString(3, clientId);	
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	// 내 문의 페이지 카운팅 (정렬)
	public int countMyListSortByPaging(String type, String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from inquiry where inquiry_type = ? and inquiry_writer = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, type);	
		ps.setString(2, clientId);	
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}	
	
	// 문의&오류 게시글 상세보기
	public InquiryDto selectOne(int inquiryNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from inquiry where inquiry_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, inquiryNo);
		ResultSet rs = ps.executeQuery();
		
		InquiryDto inquiryDto;
		if(rs.next()) {
			inquiryDto = new InquiryDto();
			
			inquiryDto.setInquiryNo(rs.getInt("inquiry_no"));
			inquiryDto.setInquiryWriter(rs.getString("inquiry_writer"));
			inquiryDto.setInquiryType(rs.getString("inquiry_type"));
			inquiryDto.setInquiryTitle(rs.getString("inquiry_title"));
			inquiryDto.setInquiryContent(rs.getString("inquiry_content"));
			inquiryDto.setInquiryDate(rs.getDate("inquiry_date"));
			inquiryDto.setInquiryReplycount(rs.getInt("inquiry_replycount"));
		}
		else {
			inquiryDto = null;
		}
		con.close();		
		return inquiryDto;
	}
	
	// 문의&오류 게시글 등록을 위한 시퀸스 생성
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select inquiry_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	// 문의&오류 게시글 등록
	public void insert(InquiryDto inquiryDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into inquiry("
							+ "inquiry_no, inquiry_writer, inquiry_type, inquiry_title, inquiry_content"
					+ ") values(?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, inquiryDto.getInquiryNo());
		ps.setString(2, inquiryDto.getInquiryWriter());
		ps.setString(3, inquiryDto.getInquiryType());
		ps.setString(4, inquiryDto.getInquiryTitle());
		ps.setString(5, inquiryDto.getInquiryContent());
		ps.execute();
		
		con.close();
	}
	
	//	문의&오류 게시글 삭제
	public boolean delete(int inquiryNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete inquiry where inquiry_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, inquiryNo);
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	// 문의&오류 게시글 댓글 수 갱신
	public boolean updateReplycount(int inquiryNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update inquiry set inquiry_replycount = ("
									+ "select count(*) from reply where reply_target = ?"
						+ ") where inquiry_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, inquiryNo);
		ps.setInt(2, inquiryNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
