package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

public OttAttachmentDto selectOne(int ottNo) throws Exception {
	
	Connection con = JdbcUtils.getConnection();
	
	String sql = "select * from ott_attachment O left outer join ott_contents C on O.ott_no = C.ott_no "
			+ "left outer join contents B on B.contents_no = C.contents_no "
			+ "where O.ott_no = ?";
			
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, ottNo);
	ResultSet rs = ps.executeQuery();
	
	OttAttachmentDto ottAttachmentDto;
	
	if(rs.next()) {
		ottAttachmentDto = new OttAttachmentDto();
		ottAttachmentDto.setOttNo(rs.getInt("ott_no"));
		ottAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

	}
	else {
		ottAttachmentDto = null;
	}
	
	con.close();
	
return ottAttachmentDto;
}

public List<OttAttachmentDto> selectList(int contentsNo) throws Exception {
	
	Connection con = JdbcUtils.getConnection();
	
	String sql = "select * from ott_attachment O left outer join ott_contents C on O.ott_no = C.ott_no "
			+ "left outer join contents B on B.contents_no = C.contents_no "
			+ "where B.contents_no = ? ";
			
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, contentsNo);
	ResultSet rs = ps.executeQuery();
	
	OttAttachmentDto ottAttachmentDto;
	List<OttAttachmentDto> list = new ArrayList<OttAttachmentDto>();
	
	while(rs.next()) {
		ottAttachmentDto = new OttAttachmentDto();
		ottAttachmentDto.setOttNo(rs.getInt("ott_no"));
		ottAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
		
		list.add(ottAttachmentDto);
	}

	
	con.close();
	
return list;
}

public List<OttAttachmentDto> selectOttList() throws Exception {
	
	Connection con = JdbcUtils.getConnection();
	
	String sql = "select * from ott_attachment order by ott_no asc";
			
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	
	OttAttachmentDto ottAttachmentDto;
	List<OttAttachmentDto> list = new ArrayList<OttAttachmentDto>();
	
	while(rs.next()) {
		ottAttachmentDto = new OttAttachmentDto();
		ottAttachmentDto.setOttNo(rs.getInt("ott_no"));
		ottAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
		
		list.add(ottAttachmentDto);
	}
	con.close();
	
return list;
}

public int count() throws Exception {
	Connection con = JdbcUtils.getConnection();
	String sql ="select count(*) from review";
	
	PreparedStatement ps = con.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	rs.next();
	int count = rs.getInt(1);
	
	con.close();
	
	return count;
}

public boolean delete(int ottNo) throws Exception{
	Connection con = JdbcUtils.getConnection();
	String sql ="delete from ott_attachment where ott_no = ?";
	PreparedStatement ps =con.prepareStatement(sql);
	ps.setInt(1, ottNo);
	int count = ps.executeUpdate();
	
	con.close();
	return count > 0;
}
}
