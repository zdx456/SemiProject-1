package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	
	// 평균 평점 높은순 컨텐츠 12개 포스터 출력
	public List<ContentsAttachmentDto> selectScoreList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select A.contents_no, B.attachment_no "
							+ "from review A join contents_attachment B on A.contents_no = B.contents_no "
							+ "group by A.contents_no, B.attachment_no "
							+ "order by avg(review_score) desc"
						+ ") TMP"
					+ ") where rn between 1 and 12";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	
	// 관심 수가 많은 순 콘텐츠 12개 포스터 출력
	public List<ContentsAttachmentDto> selectLikeList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select A.contents_no, B.attachment_no "
							+ "from likecontents A join contents_attachment B on A.contents_no = B.contents_no "
							+ "group by A.contents_no, B.attachment_no "
							+ "order by count(A.contents_no) desc"
						+ ") TMP"
					+ ") where rn between 1 and 12";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}	
	
	// 최신순 콘텐츠 7개 포스터 출력
	public List<ContentsAttachmentDto> selectRecentList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select A.contents_no, B.attachment_no "
							+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
							+ "order by A.contents_no desc"
						+ ") TMP"
					+ ") where rn between 1 and 7";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	
	// 내 장르 콘텐츠 평균 평점순 12개 포스터 출력
	public List<ContentsAttachmentDto> selectMyGenreList(String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select B.contents_no, C.attachment_no "
							+ "from likegenre A join contents B on A.genre_name = B.genre_name "
							+ "join contents_attachment C on B.contents_no = C.contents_no "
							+ "join review D on B.contents_no = D.contents_no "
							+ "where A.client_id = ? "
							+ "group by B.contents_no, C.attachment_no "
							+ "order by avg(D.review_score) desc"
						+ ") TMP"
					+ ") where rn between 1 and 12";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	
	// 내 관심 콘텐츠 최신 관심 등록순 12개 포스터 출력
	public List<ContentsAttachmentDto> selectMyLikeList(String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select A.contents_no, B.attachment_no "
							+ "from likecontents A join contents_attachment B on A.contents_no = B.contents_no "
							+ "where A.client_id = ? "
							+ "order by A.like_no desc"
						+ ") TMP"
					+ ") where rn between 1 and 12";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, clientId);
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));

			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}	
}
