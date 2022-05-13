package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



public class YearStatusDao {

	public List<YearStatusDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from year_status order by year asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs =ps.executeQuery();
		
		List<YearStatusDto> list = new ArrayList<>();
		while(rs.next()) {
			YearStatusDto yearStatusDto = new YearStatusDto();
			yearStatusDto.setYear(rs.getInt("year"));
			yearStatusDto.setCnt(rs.getInt("cnt"));
			
			list.add(yearStatusDto);
		}
		
		con.close();
		return list;
	}
}
