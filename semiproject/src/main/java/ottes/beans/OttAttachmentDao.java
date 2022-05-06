package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OttAttachmentDao {

	
public void insert(OttAttachmentDto ottAttachmentDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into ott_attachment(ott_no, attachment_no) values(?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ottAttachmentDto.getOttNo());
		ps.setInt(2, ottAttachmentDto.getAttachmentNo());
		ps.execute();
		
		con.close();
	}
}
