package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {

	public List<ReviewDto> selectList() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from review order by review_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
  
		List<ReviewDto> list = new ArrayList<>();
		while (rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setContentsNo(rs.getInt("contents_no"));
			reviewDto.setReviewWriter(rs.getString("review_writer"));
			reviewDto.setReviewContent(rs.getString("review_content"));
			reviewDto.setReviewScore(rs.getInt("review_score"));
			reviewDto.setReviewTime(rs.getDate("review_time"));

			list.add(reviewDto);
		}
		con.close();
		return list;
	}
	
	// 리뷰 별점 불러오기 위한 메소드
	public int avg(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql= "select avg(review_score) from review where contents_no = ? group by contents_no";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		int avg = 0;
		
		if(rs.next()) {
			avg = rs.getInt(1);
		}
		
		con.close();
		return avg;
	
	}
	
	// 내가 쓴 review 보기 위한 메소드
	public List<ReviewDto> selectList(String reviewWriter) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from review where review_writer = ? order by review_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reviewWriter);
		ResultSet rs = ps.executeQuery();
		

		List<ReviewDto> list = new ArrayList<>();
		while (rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setContentsNo(rs.getInt("contents_no"));
			reviewDto.setReviewWriter(rs.getString("review_writer"));
			reviewDto.setReviewContent(rs.getString("review_content"));
			reviewDto.setReviewScore(rs.getInt("review_score"));
			reviewDto.setReviewTime(rs.getDate("review_time"));

			list.add(reviewDto);
		}
		con.close();
		return list;
	}
	// 컨텐츠별 리뷰 보기!
		public List<ReviewDto> selectList(int contentsNo) throws Exception {
			Connection con = JdbcUtils.getConnection();
			// 컨텐츠 상세 보기에서는 리뷰 5개까지만 보여주기
			String sql = 
					"select * from( "
					+ "  select rownum RN, TMP.* from ("
					+ "  select review.* from review where contents_no = ? order by review_time desc"
					+ "        ) TMP"
					+ ") where RN between 1 and 5";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, contentsNo);
			ResultSet rs = ps.executeQuery();
			

			List<ReviewDto> list = new ArrayList<>();
			while (rs.next()) {
				ReviewDto reviewDto = new ReviewDto();
				reviewDto.setReviewNo(rs.getInt("review_no"));
				reviewDto.setContentsNo(rs.getInt("contents_no"));
				reviewDto.setReviewWriter(rs.getString("review_writer"));
				reviewDto.setReviewContent(rs.getString("review_content"));
				reviewDto.setReviewScore(rs.getInt("review_score"));
				reviewDto.setReviewTime(rs.getDate("review_time"));

				list.add(reviewDto);
			}
			con.close();
			return list;
		}

	public int getSequence() throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "select review_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int reviewNo = rs.getInt("nextval");

		con.close();
		return reviewNo;
	}

	public void insert(ReviewDto reviewDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "insert into review(review_no, contents_no, review_writer, review_content, review_score) "
				+ " values(?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reviewDto.getReviewNo());
		ps.setInt(2, reviewDto.getContentsNo());
		ps.setString(3, reviewDto.getReviewWriter());
		ps.setString(4, reviewDto.getReviewContent());
		ps.setInt(5, reviewDto.getReviewScore());
		ps.execute();

		con.close();

	}

	public boolean update(ReviewDto reviewDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = "update review set review_content = ?, review_score = ?, review_time = sysdate where review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reviewDto.getReviewContent());
		ps.setInt(2, reviewDto.getReviewScore());
		ps.setInt(3, reviewDto.getReviewNo());

		int count = ps.executeUpdate();

		con.close();
		return count > 0;
	}

	public boolean delete(int ottNo) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "delete review where review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, ottNo);
		int count = ps.executeUpdate();

		con.close();
		return count > 0;

	}
	
	public List<ReviewDto> selectListContentsByPasing(int contentsNo,int p, int s) throws Exception{
		int end = p*s;
		int begin = end -(s-1);
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from (select rownum rn, TMP.* from( "
				+ " 	  select R.*, C.client_nick, A.contents_title from review R  "
				+ "                  left outer join client C on R.review_writer = C.client_id "
				+ "                  left outer join contents A on R.contents_no = A.contents_no "
				+ "                  where R.contents_no = ? order by review_time desc  "
				+ " )"
				+ " TMP)where rn between ? and ?" ;
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		
		ResultSet rs = ps.executeQuery();
		

		List<ReviewDto> list = new ArrayList<>();
		while (rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setContentsNo(rs.getInt("contents_no"));
			reviewDto.setReviewWriter(rs.getString("review_writer"));
			reviewDto.setReviewContent(rs.getString("review_content"));
			reviewDto.setReviewScore(rs.getInt("review_score"));
			reviewDto.setReviewTime(rs.getDate("review_time"));
			reviewDto.setClientNick(rs.getString("client_nick"));
			reviewDto.setContentsTitle(rs.getString("contents_title"));

			list.add(reviewDto);
		}
		
		con.close();
		return list;
	}
	
	public List<ReviewDto> selectListWriterByPasing(String reviewWriter, int p, int s) throws Exception{
		int end = p*s;
		int begin = end -(s-1);
		Connection con = JdbcUtils.getConnection();
		String sql = "select * from (select rownum rn, TMP.* from( "
				+ " select R.*, C.client_nick, A.contents_title  from review R "
				+ "                 left outer join client C on R.review_writer = C.client_id "
				+ "                 left outer join contents A on R.contents_no = A.contents_no "
				+ "                 where R.review_writer = ? order by review_time desc"
				+ " )"
				+ " TMP)where rn between ? and ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reviewWriter);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		

		List<ReviewDto> list = new ArrayList<>();
		while (rs.next()) {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewNo(rs.getInt("review_no"));
			reviewDto.setContentsNo(rs.getInt("contents_no"));
			reviewDto.setReviewWriter(rs.getString("review_writer"));
			reviewDto.setReviewContent(rs.getString("review_content"));
			reviewDto.setReviewScore(rs.getInt("review_score"));
			reviewDto.setReviewTime(rs.getDate("review_time"));
			reviewDto.setClientNick(rs.getString("client_nick"));
			reviewDto.setContentsTitle(rs.getString("contents_title"));

			list.add(reviewDto);
		}
		con.close();
		return list;
	}
	
	public int countWriterByPasing(String reviewWriter) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql ="select count(*) from review where review_writer = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reviewWriter);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int countContentsByPasing(int contentsNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql ="select count(*) from review where contents_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public boolean checkWriter(int contentsNo, String clientId) throws Exception {
		Connection con = JdbcUtils.getConnection();
		String sql = " select * from review where contents_no = ? and review_writer = ? order by review_time desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ps.setString(2, clientId);
		
		int isWrite = ps.executeUpdate();
		
		con.close();
		
		return isWrite > 0;
	}
	}	

