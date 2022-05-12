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
	
	
	public List<OttDto> findPrice(int contentsNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from ott O left outer join ott_contents C on O.ott_no = C.ott_no where C.contents_no = ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		
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
	

	public OttDto selectOne(String ottName) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ott where ott_name = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, ottName);
		ResultSet rs = ps.executeQuery();
		
		OttDto ottDto;
		
		if(rs.next()) {
			ottDto = new OttDto();
			ottDto.setOttNo(rs.getInt("ott_no"));
			ottDto.setOttName(rs.getString("ott_name"));
			ottDto.setOttPrice(rs.getInt("ott_price"));
		}
		else {
			ottDto = null;
		}
		
		con.close();
		
		return ottDto;
	}
	
	//서비스 중인 ott 목록 출력
	public List<OttDto> selectList(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ott O"
				+ "    left outer join ott_contents C on O.ott_no = C.ott_no"
				+ "    where contents_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
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
	
	public List<OttDto> selectCheckbox(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ott O"
				+ "    left outer join ott_contents C on O.ott_no = C.ott_no"
				+ "    where contents_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
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
	
	//콘텐츠 수정에서 등록 시 선택 된 ott 체크박스 유지하기 위함
	public List<OttCheckVO> checkList(int contentsNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ott A left outer join (select * from ott_contents where contents_no = ?) B on A.ott_no = B.ott_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		List<OttCheckVO> list = new ArrayList<>();
		while(rs.next()) {
			OttCheckVO ottCheckVO = new OttCheckVO();
			
			ottCheckVO.setOttNo(rs.getInt("ott_no"));
			ottCheckVO.setOttName(rs.getString("ott_name"));
			ottCheckVO.setOttPrice(rs.getInt("ott_price"));
			ottCheckVO.setCheck(rs.getInt("contents_no") > 0);//true면 체크된 항목
			
			list.add(ottCheckVO);
		}
		
		con.close();
		
		return list;
	}

}









