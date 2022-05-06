package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {
	// 공지&FAQ 게시판 리스트 출력
	public List<NoticeDto> selectListByPaging(int p, int s) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from notice order by notice_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeDate(rs.getDate("notice_date"));
			noticeDto.setNoticeType(rs.getString("notice_type"));
			
			list.add(noticeDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 공지&FAQ 게시판 리스트 출력 (검색 결과)
	public List<NoticeDto> selectListByPaging(int p, int s, String type, String keyword) throws Exception {
		int end = p * s;
		int begin = end - (s - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select * from notice where instr(#1, ?) > 0 order by notice_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeDate(rs.getDate("notice_date"));
			noticeDto.setNoticeType(rs.getString("notice_type"));
			
			list.add(noticeDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 페이지 카운팅
	public int countByPaging() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from notice";
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
		
		String sql = "select count(*) from notice where instr(#1, ?) > 0";
		sql = sql.replace("#1", type);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);		
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	// 공지&FAQ 게시글 상세보기
	public NoticeDto selectOne(int noticeNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from notice where notice_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeNo);
		ResultSet rs = ps.executeQuery();
		
		NoticeDto noticeDto;
		if(rs.next()) {
			noticeDto = new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeDate(rs.getDate("notice_date"));
			noticeDto.setNoticeType(rs.getString("notice_type"));
		}
		else {
			noticeDto = null;
		}
		con.close();		
		return noticeDto;
	}
	
	// 공지&FAQ 게시글 등록을 위한 시퀸스 생성
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select notice_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	// 공지&FAQ 게시글 등록
	public void insert(NoticeDto noticeDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into notice("
							+ "notice_no, notice_writer, notice_title, notice_content, notice_type"
					+ ") values(?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, noticeDto.getNoticeNo());
		ps.setString(2, noticeDto.getNoticeWriter());
		ps.setString(3, noticeDto.getNoticeTitle());
		ps.setString(4, noticeDto.getNoticeContent());
		ps.setString(5, noticeDto.getNoticeType());
		ps.execute();
		
		con.close();
	}
	
	//	공지&FAQ 게시글 수정 : 제목, 내용, 말머리
	public boolean update(NoticeDto noticeDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update notice "
							+ "set notice_title = ?, notice_content = ?, notice_type = ? "
							+ "where notice_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, noticeDto.getNoticeTitle());
		ps.setString(2, noticeDto.getNoticeContent());
		ps.setString(3, noticeDto.getNoticeType());
		ps.setInt(4, noticeDto.getNoticeNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	//	공지&FAQ 게시글 삭제
	public boolean delete(int noticeNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete notice where notice_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeNo);
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
}
