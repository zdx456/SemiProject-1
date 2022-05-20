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
							+ "select A.contents_no, B.attachment_no, C.contents_title, avg(review_score) avg_score "
							+ "from review A join contents_attachment B on A.contents_no = B.contents_no "
							+ "join contents C on B.contents_no = C.contents_no "
							+ "group by A.contents_no, B.attachment_no, C.contents_title "
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
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));

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
							+ "select A.contents_no, B.attachment_no, C.contents_title, count(A.contents_no) count_like "
							+ "from likecontents A join contents_attachment B on A.contents_no = B.contents_no "
							+ "join contents C on A.contents_no = C.contents_no "
							+ "group by A.contents_no, B.attachment_no, C.contents_title "
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
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));

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
							+ "select B.contents_no, C.attachment_no, E.contents_title "
							+ "from likegenre A join contents B on A.genre_name = B.genre_name "
							+ "join contents_attachment C on B.contents_no = C.contents_no "
							+ "join contents E on B.contents_no = E.contents_no "
							+ "left outer join review D on B.contents_no = D.contents_no "
							+ "where A.client_id = ? "
							+ "group by B.contents_no, C.attachment_no, E.contents_title "
							+ "order by avg(D.review_score) desc nulls last"
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
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));

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
							+ "select A.contents_no, B.attachment_no, C.contents_title "
							+ "from likecontents A join contents_attachment B on A.contents_no = B.contents_no "
							+ "join contents C on B.contents_no = C.contents_no "
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
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));

			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}	
	
	// 최신순 콘텐츠 7개씩 포스터 출력 (비동기 페이징)
	public List<ContentsAttachmentDto> selectRecentListByPaging(int p) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select A.contents_no, B.attachment_no, A.contents_title "
							+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
							+ "order by A.contents_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			
			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	
	// 페이지 카운팅
	public int countByPaging() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select count(*) from contents";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	// 검색 결과 페이지
	public List<ContentsAttachmentDto> search(int p, String keyword) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 

		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from ("
						+ "select rownum rn, TMP.* from ("
							+ "select A.contents_no, B.attachment_no, A.contents_title, A.contents_summary, avg(E.review_score) avg_score, count(distinct F.like_no) count_like "
							+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
							+ "join contents_actor D on D.contents_no = B.contents_no "
							+ "join actor C on D.actor_no = C.actor_no "
							+ "left outer join review E on E.contents_no = A.contents_no "
							+ "left outer join likecontents F on F.contents_no = A.contents_no "
							+ "where instr(A.contents_title, ?) > 0 or instr(A.contents_director, ?) > 0 or instr(A.contents_summary, ?) > 0 "
							+ "or instr(C.actor_name1, ?) > 0 or instr(C.actor_name2, ?) > 0 or instr(C.actor_name3, ?) > 0 or instr(C.actor_name4, ?) > 0 "
							+ "group by A.contents_no, B.attachment_no, A.contents_title, A.contents_summary "
							+ "order by A.contents_no desc"
						+ ") TMP"
					+ ") where rn between ? and ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setString(4, keyword);
		ps.setString(5, keyword);
		ps.setString(6, keyword);
		ps.setString(7, keyword);
		ps.setInt(8, begin);
		ps.setInt(9, end);
		
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			contentsAttachmentDto.setContentsSummary(rs.getString("contents_summary"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));
			
			list.add(contentsAttachmentDto);
		}
		
		con.close();
		return list;
	}
	
	// 검색 결과 페이지 (장르 정렬)
	public List<ContentsAttachmentDto> searchGenreSort(int p, String keyword, String type) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select A.contents_no, B.attachment_no, A.contents_title, A.contents_summary, avg(E.review_score) avg_score, count(distinct F.like_no) count_like "
					+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
					+ "join contents_actor D on D.contents_no = B.contents_no "
					+ "join actor C on D.actor_no = C.actor_no "
					+ "left outer join review E on E.contents_no = A.contents_no "
					+ "left outer join likecontents F on F.contents_no = A.contents_no "
					+ "where (instr(A.contents_title, ?) > 0 or instr(A.contents_director, ?) > 0 or instr(A.contents_summary, ?) > 0 "
					+ "or instr(C.actor_name1, ?) > 0 or instr(C.actor_name2, ?) > 0 or instr(C.actor_name3, ?) > 0 or instr(C.actor_name4, ?) > 0) "
					+ "and A.genre_name = ? "
					+ "group by A.contents_no, B.attachment_no, A.contents_title, A.contents_summary "
					+ "order by A.contents_no desc"
				+ ") TMP"
			+ ") where rn between ? and ?";		
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setString(4, keyword);
		ps.setString(5, keyword);
		ps.setString(6, keyword);
		ps.setString(7, keyword);
		ps.setString(8, type);
		ps.setInt(9, begin);
		ps.setInt(10, end);
		
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			contentsAttachmentDto.setContentsSummary(rs.getString("contents_summary"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));
			
			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	
	public List<ContentsAttachmentDto> searchGenreSort(int p, String type) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select A.contents_no, B.attachment_no, A.contents_title, A.contents_summary, avg(E.review_score) avg_score, count(distinct F.like_no) count_like "
					+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
					+ "join contents_actor D on D.contents_no = B.contents_no "
					+ "join actor C on D.actor_no = C.actor_no "
					+ "left outer join review E on E.contents_no = A.contents_no "
					+ "left outer join likecontents F on F.contents_no = A.contents_no "
					+ "where A.genre_name = ? "
					+ "group by A.contents_no, B.attachment_no, A.contents_title, A.contents_summary "
					+ "order by A.contents_no desc"
				+ ") TMP"
			+ ") where rn between ? and ?";		
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, type);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			contentsAttachmentDto.setContentsSummary(rs.getString("contents_summary"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));
			
			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	// 검색 결과 페이지 (국가 정렬)
	public List<ContentsAttachmentDto> searchRegionSort(int p, String keyword, String type) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select A.contents_no, B.attachment_no, A.contents_title, A.contents_summary, avg(E.review_score) avg_score, count(distinct F.like_no) count_like "
					+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
					+ "join contents_actor D on D.contents_no = B.contents_no "
					+ "join actor C on D.actor_no = C.actor_no "
					+ "left outer join review E on E.contents_no = A.contents_no "
					+ "left outer join likecontents F on F.contents_no = A.contents_no "
					+ "where (instr(A.contents_title, ?) > 0 or instr(A.contents_director, ?) > 0 or instr(A.contents_summary, ?) > 0 "
					+ "or instr(C.actor_name1, ?) > 0 or instr(C.actor_name2, ?) > 0 or instr(C.actor_name3, ?) > 0 or instr(C.actor_name4, ?) > 0) "
					+ "and A.region_name = ? "
					+ "group by A.contents_no, B.attachment_no, A.contents_title, A.contents_summary "
					+ "order by A.contents_no desc"
				+ ") TMP"
			+ ") where rn between ? and ?";		
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setString(4, keyword);
		ps.setString(5, keyword);
		ps.setString(6, keyword);
		ps.setString(7, keyword);
		ps.setString(8, type);
		ps.setInt(9, begin);
		ps.setInt(10, end);
		
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			contentsAttachmentDto.setContentsSummary(rs.getString("contents_summary"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));			
			
			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	
	// 검색 결과 페이지 (평균 평점 정렬)
	public List<ContentsAttachmentDto> searchScoreSort(int p, String keyword) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select A.contents_no, B.attachment_no, A.contents_title, A.contents_summary, avg(E.review_score) avg_score, count(distinct F.like_no) count_like "
					+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
					+ "join contents_actor D on D.contents_no = B.contents_no "
					+ "join actor C on D.actor_no = C.actor_no "
					+ "left outer join review E on E.contents_no = A.contents_no "
					+ "left outer join likecontents F on F.contents_no = A.contents_no "
					+ "where instr(A.contents_title, ?) > 0 or instr(A.contents_director, ?) > 0 or instr(A.contents_summary, ?) > 0 "
					+ "or instr(C.actor_name1, ?) > 0 or instr(C.actor_name2, ?) > 0 or instr(C.actor_name3, ?) > 0 or instr(C.actor_name4, ?) > 0 "
					+ "group by A.contents_no, B.attachment_no, A.contents_title, A.contents_summary "
					+ "order by avg(E.review_score) desc nulls last"
				+ ") TMP"
			+ ") where rn between ? and ?";		
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setString(4, keyword);
		ps.setString(5, keyword);
		ps.setString(6, keyword);
		ps.setString(7, keyword);
		ps.setInt(8, begin);
		ps.setInt(9, end);
		
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			contentsAttachmentDto.setContentsSummary(rs.getString("contents_summary"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));			
			
			list.add(contentsAttachmentDto);
		}
		
		con.close();
		
		return list;
	}	
	
	// 검색 결과 페이지 (관심 수 정렬)
	public List<ContentsAttachmentDto> searchLikeSort(int p, String keyword) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select A.contents_no, B.attachment_no, A.contents_title, A.contents_summary, avg(E.review_score) avg_score, count(distinct F.like_no) count_like "
					+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
					+ "join contents_actor D on D.contents_no = B.contents_no "
					+ "join actor C on D.actor_no = C.actor_no "
					+ "left outer join review E on E.contents_no = A.contents_no "
					+ "left outer join likecontents F on F.contents_no = A.contents_no "
					+ "where instr(A.contents_title, ?) > 0 or instr(A.contents_director, ?) > 0 or instr(A.contents_summary, ?) > 0 "
					+ "or instr(C.actor_name1, ?) > 0 or instr(C.actor_name2, ?) > 0 or instr(C.actor_name3, ?) > 0 or instr(C.actor_name4, ?) > 0 "
					+ "group by A.contents_no, B.attachment_no, A.contents_title, A.contents_summary "
					+ "order by count(distinct F.like_no) desc"
				+ ") TMP"
			+ ") where rn between ? and ?";		
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setString(4, keyword);
		ps.setString(5, keyword);
		ps.setString(6, keyword);
		ps.setString(7, keyword);
		ps.setInt(8, begin);
		ps.setInt(9, end);
		
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			contentsAttachmentDto.setContentsSummary(rs.getString("contents_summary"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));			
			
			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}
	
	// 검색 결과 페이지 (OTT 필터)
	public List<ContentsAttachmentDto> searchOttSort(int p, String keyword, String ottNo) throws Exception {
		int end = p * 7;
		int begin = end - (7 - 1); 
		
		Connection con = JdbcUtils.getConnection();

		String sql = "select * from ("
				+ "select rownum rn, TMP.* from ("
					+ "select A.contents_no, B.attachment_no, A.contents_title, A.contents_summary, avg(E.review_score) avg_score, count(distinct F.like_no) count_like "
					+ "from contents A join contents_attachment B on A.contents_no = B.contents_no "
					+ "join contents_actor D on D.contents_no = B.contents_no "
					+ "join actor C on D.actor_no = C.actor_no "
					+ "join ott_contents O on O.contents_no = A.contents_no "
					+ "left outer join review E on E.contents_no = A.contents_no "
					+ "left outer join likecontents F on F.contents_no = A.contents_no "
					+ "where (instr(A.contents_title, ?) > 0 or instr(A.contents_director, ?) > 0 or instr(A.contents_summary, ?) > 0 "
					+ "or instr(C.actor_name1, ?) > 0 or instr(C.actor_name2, ?) > 0 or instr(C.actor_name3, ?) > 0 or instr(C.actor_name4, ?) > 0) "
					+ "and O.ott_no = ? "
					+ "group by A.contents_no, B.attachment_no, A.contents_title, A.contents_summary "
					+ "order by count(distinct F.like_no) desc"
				+ ") TMP"
			+ ") where rn between ? and ?";		
		
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, keyword);
		ps.setString(2, keyword);
		ps.setString(3, keyword);
		ps.setString(4, keyword);
		ps.setString(5, keyword);
		ps.setString(6, keyword);
		ps.setString(7, keyword);
		ps.setString(8, ottNo);
		ps.setInt(9, begin);
		ps.setInt(10, end);
		
		ResultSet rs = ps.executeQuery();

		List<ContentsAttachmentDto> list = new ArrayList<>();
		while (rs.next()) {
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(rs.getInt("contents_no"));
			contentsAttachmentDto.setAttachmentNo(rs.getInt("attachment_no"));
			contentsAttachmentDto.setContentsSummary(rs.getString("contents_summary"));
			
			contentsAttachmentDto.setContentsTitle(rs.getString("contents_title"));
			contentsAttachmentDto.setAvgScore(rs.getFloat("avg_score"));
			contentsAttachmentDto.setCountLike(rs.getInt("count_like"));			
			
			list.add(contentsAttachmentDto);
		}
		con.close();
		return list;
	}	
}
