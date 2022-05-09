package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContentsAttachmentDao {
	
	public void insert(ContentsAttachmentDto contentsAttachmentDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into contents_attachment(contents_no, attachment_no) values(?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsAttachmentDto.getContentsNo());
		ps.setInt(2, contentsAttachmentDto.getAttachmentNo());
		ps.execute();
		
		con.close();
	}
	
	public boolean delete(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete contents_attachment where contents_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

}
