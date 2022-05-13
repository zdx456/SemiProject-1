package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OttContentsStatusDao {
	public List<OttContentsStatusDto> selectList() throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select O.ott_name, count(A.contents_no) CNT from ott_contents A left outer join ott O on A.ott_no = O.ott_no group by O.ott_name";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs =ps.executeQuery();
		
		List<OttContentsStatusDto> list = new ArrayList<>();
		while(rs.next()) {
			OttContentsStatusDto ottContentsStatusDto = new OttContentsStatusDto();
			 ottContentsStatusDto.setOttName(rs.getString("ott_name"));
			 ottContentsStatusDto.setContentsNo(rs.getInt("CNT"));
			
			list.add(ottContentsStatusDto);
		}
		
		con.close();
		return list;
	}
}
