package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContentsActorDao {
	
	//컨텐츠-배우 기능 테이블에 데이터 추가
	public void insert(ContentsActorDto contentsActorDto) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into contents_actor (contents_no, actor_no) values (?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsActorDto.getContentsNo());
		ps.setInt(2, contentsActorDto.getActorNo());
		
		ps.execute();
		
		con.close();
	}
	
	//삭제
	public boolean delete(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete contents_actor where contents_no = ?"; 
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}

}
