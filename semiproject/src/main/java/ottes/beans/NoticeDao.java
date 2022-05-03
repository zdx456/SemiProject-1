package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {
	// 공지게시판 리스트 출력
	public List<NoticeDto> selectList() throws Exception {
		Connection con = JdbcUtils.getConnection();
			
		String sql = "select * from notice order by notice_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeType(rs.getString("notice_type"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
//			noticeDto.setNoticeContent(rs.getString("notice_type")); // 성능을 위해 우선 제외
			noticeDto.setNoticeDate(rs.getDate("notice_date"));
			
			list.add(noticeDto);
		}
		con.close();
		
		return list;
	}
}





