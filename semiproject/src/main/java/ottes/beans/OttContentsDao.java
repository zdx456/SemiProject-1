package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OttContentsDao {
	
	public void insert(OttContentsDto ottContentsDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into ott_contents(ott_no, contents_no) values(?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ottContentsDto.getOttNo());
		ps.setInt(2, ottContentsDto.getContentsNo());
		
		ps.execute();
		
		con.close();
	}
	
	public boolean delete(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete ott_contents where contents_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	
public OttContentsDto selectOne(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ott_attachment O left outer join ott_contents C on O.ott_no = C.ott_no "
				+ " left outer join contents B on B.contents_no = C.contents_no "
				+ " where C.contents_no = ?";
				
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		OttContentsDto ottContentsDto;
		
		if(rs.next()) {
			ottContentsDto = new OttContentsDto();
			ottContentsDto.setContentsNo(rs.getInt("contents_no"));
			ottContentsDto.setOttNo(rs.getInt("ott_no"));

		}
		else {
			ottContentsDto = null;
		}
		
		con.close();
		
	return ottContentsDto;
}
	
}











