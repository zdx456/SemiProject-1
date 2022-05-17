package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AttachmentDao {
	
	//등록
	public int getSequence() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select attachment_seq.nextval from dual";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	//파일 업로드
	public void insert(AttachmentDto attachmentDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into attachment("
				+ "attachment_no, attachment_uploadname, attachment_savename, attachment_type, attachment_size"
				+ ") values (?, ?, ?, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, attachmentDto.getAttachmentNo());
		ps.setString(2, attachmentDto.getAttachmentUploadname());
		ps.setString(3, attachmentDto.getAttachmentSavename());
		ps.setString(4, attachmentDto.getAttachmentType());
		ps.setLong(5, attachmentDto.getAttachmentSize());
		ps.execute();
		
		con.close();
		
	}
	
	//파일 수정
	public boolean update(AttachmentDto attachmentDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update attachment set "
				+ "attachment_uploadname=?, attachment_savename=?, attachment_type=?, attachment_size=? "
				+ "where attachment_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, attachmentDto.getAttachmentUploadname());
		ps.setString(2, attachmentDto.getAttachmentSavename());
		ps.setString(3, attachmentDto.getAttachmentType());
		ps.setLong(4, attachmentDto.getAttachmentSize());
		ps.setInt(5, attachmentDto.getAttachmentNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
		
	}
	
	//파일 번호로 파일 정보 불러오기(다운로드할 때 필요)
	public AttachmentDto selectOne(int attachmentNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from attachment where attachment_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, attachmentNo);
		ResultSet rs = ps.executeQuery();
		
		AttachmentDto attachmentDto;
		
		if(rs.next()) {
			attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			attachmentDto.setAttachmentUploadname(rs.getString("attachment_uploadname"));
			attachmentDto.setAttachmentSavename(rs.getString("attachment_savename"));
			attachmentDto.setAttachmentType(rs.getString("attachment_type"));
			attachmentDto.setAttachmentSize(rs.getLong("attachment_size"));
		}
		else {
			attachmentDto = null;
		}
		
		con.close();
		
		return attachmentDto;
	}
	
	//파일 저장 위치 지정
	public static final String path = "D:/upload/kh91";
	
	
	//컨텐츠 번호로 파일 번호, 정보 불러오기(상세페이지에 포스터 올릴 때 필요)
	public AttachmentDto selectAttachment(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from attachment A"
				+ "    left outer join contents_attachment C on A.attachment_no = C.attachment_no where contents_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		AttachmentDto attachmentDto;
		if(rs.next()) {
			attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			attachmentDto.setAttachmentUploadname(rs.getString("attachment_uploadname"));
			attachmentDto.setAttachmentSavename(rs.getString("attachment_savename"));
			attachmentDto.setAttachmentType(rs.getString("attachment_type"));
			attachmentDto.setAttachmentSize(rs.getLong("attachment_size"));
		}
		else {
			attachmentDto = null;
		}
		
		con.close();
		
		return attachmentDto;
	}
	
	//contents 번호로 attachment 테이블 삭제하기
	public boolean delete(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete attachment where attachment_no = "
				+ "(select A.attachment_no from attachment A"
				+ "    left outer join contents_attachment C on A.attachment_no = C.attachment_no "
				+ "    where contents_no=?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	public boolean deleteOtt(int ottNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		String sql = "delete from attachment  where attachment_no = "
				+ "(select A.attachment_no from attachment A left outer join ott_attachment O on O.attachment_no = A.attachment_no where ott_no = ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ottNo);
		int count = ps.executeUpdate();
		con.close();
		
		return count > 0;
	}	
}

























