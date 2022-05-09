package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OttDao {
	// ott 시퀀스, 등록, 수정 , 삭제, 목록  메소드 생성
	
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select ott_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int ottNo = rs.getInt("nextval");

		con.close();
		return ottNo;
	}

	public void insert(OttDto ottDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into ott(ott_no, ott_name, ott_price) values (?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ottDto.getOttNo());
		ps.setString(2, ottDto.getOttName());
		ps.setInt(3, ottDto.getOttPrice());
		ps.execute();
		con.close();
	}
	
	public List<OttDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from ott order by ott_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<OttDto> list = new ArrayList<>();
		while(rs.next()) {
			OttDto ottDto = new OttDto();
			ottDto.setOttNo(rs.getInt("ott_no"));
			ottDto.setOttName(rs.getString("ott_name"));
			ottDto.setOttPrice(rs.getInt("ott_price"));
			
			list.add(ottDto);
		}
		con.close();
		return list;
	}
	
	public boolean update(OttDto ottDto) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "update ott set ott_name = ?, ott_price = ? where ott_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, ottDto.getOttName());
		ps.setInt(2, ottDto.getOttPrice());
		ps.setInt(3, ottDto.getOttNo());
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	
	public boolean delete(int ottNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "delete ott where ott_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ottNo);
		
		int count = ps.executeUpdate();
		
		con.close();
		return count > 0;
	}
	

}
