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

	public boolean edit(ReviewDto reviewDto) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "update review set review_content = ? review score = ? where review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, reviewDto.getReviewContent());
		ps.setInt(2, reviewDto.getReviewScore());
		ps.setInt(3, reviewDto.getReviewNo());

		int count = ps.executeUpdate();

		con.close();
		return count > 0;
	}

	public boolean delete(int reviewNo) throws Exception {
		Connection con = JdbcUtils.getConnection();

		String sql = "delete review where review_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, reviewNo);
		int count = ps.executeUpdate();

		con.close();
		return count > 0;
	}
}