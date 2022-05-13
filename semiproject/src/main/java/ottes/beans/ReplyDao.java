package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReplyDao {
	// 문의 댓글 등록을 위한 시퀸스 생성
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select reply_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	// 문의 댓글 등록
	public void insert(ReplyDto replyDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into reply(reply_no, reply_target, reply_writer, reply_content) "
							+ "values(?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyDto.getReplyNo());
		ps.setInt(2, replyDto.getReplyTarget());
		ps.setString(3, replyDto.getReplyWriter());
		ps.setString(4, replyDto.getReplyContent());
		ps.execute();
		
		con.close();
	}
	
	// 문의 댓글 출력
	public List<ReplyDto> selectList(int replyTarget) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from reply where reply_target = ? order by reply_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyTarget);
		ResultSet rs = ps.executeQuery();
		
		List<ReplyDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ReplyDto replyDto = new ReplyDto();
			
			replyDto.setReplyNo(rs.getInt("reply_no"));
			replyDto.setReplyTarget(rs.getInt("reply_target"));
			replyDto.setReplyWriter(rs.getString("reply_writer"));
			replyDto.setReplyContent(rs.getString("reply_content"));
			replyDto.setReplyDate(rs.getDate("reply_date"));

			list.add(replyDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 문의 댓글 수정
	public boolean update(ReplyDto replyDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update reply set reply_content = ? where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, replyDto.getReplyContent());
		ps.setInt(2, replyDto.getReplyNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	// 문의 댓글 삭제
	public boolean delete(int replyNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete reply where reply_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, replyNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
}
