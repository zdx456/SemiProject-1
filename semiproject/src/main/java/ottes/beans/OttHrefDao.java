package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OttHrefDao {

	public List<HrefVO> selectList(int ContentsNo) throws Exception {

		Connection con = JdbcUtils.getConnection();

		String sql = "select o.ott_no, h.ott_href, C.contents_no, AT.attachment_no from ott O "
				+ "inner join ott_href H on H.ott_no = O.ott_no "
				+ "inner join ott_contents C on C.ott_no = O.ott_no "
				+ "inner join ott_attachment AT on O.ott_no = AT.ott_no "
				+ "where C.contents_no = ? "
				+ "group by O.ott_no, h.ott_href, C.contents_no, AT.attachment_no";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ContentsNo);
		ResultSet rs = ps.executeQuery();

		HrefVO hrefVO;
		List<HrefVO> list = new ArrayList<HrefVO>();

		while (rs.next()) {
			hrefVO = new HrefVO();
			hrefVO.setOttHref(rs.getString("ott_href"));
			hrefVO.setOttNo(rs.getInt("ott_no"));
			hrefVO.setContentsNo(rs.getInt("contents_no"));
			hrefVO.setAttachmentNo(rs.getInt("attachment_no"));

			list.add(hrefVO);
		}

		con.close();

		return list;

	}
}
