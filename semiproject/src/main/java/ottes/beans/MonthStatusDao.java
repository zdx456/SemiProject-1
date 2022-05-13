package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MonthStatusDao {
	public List<MonthStatusDto> selectList(int year) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select year, month, count(C.client_id) cnt from temp_year_month T "
				+ " left outer join client C on T.month = extract(month from C.client_joindate) and T.year = extract(year from C.client_joindate) where year = ?"
				+ " group by year, month order by year, month asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, year);
		ResultSet rs =ps.executeQuery();
		
		List<MonthStatusDto> list = new ArrayList<>();
		while(rs.next()) {
			MonthStatusDto monthStatusDto = new MonthStatusDto();
			monthStatusDto.setYear(rs.getInt("year"));
			monthStatusDto.setMonth(rs.getInt("month"));
			monthStatusDto.setCnt(rs.getInt("cnt"));
			
			list.add(monthStatusDto);
		}
		
		con.close();
		return list;
	}
}
