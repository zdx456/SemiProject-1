package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ActorDao {
	
	// 배우 생성 - 시퀀스
	public int getSequence() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select actor_seq.nextval from dual";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		rs.next();
		
		int number = rs.getInt("nextval");
		
		con.close();
		
		return number;
	}
	
	// 배우 생성
	// @author : 이기주
	public void insert(ActorDto actorDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into actor(actor_no, actor_name1, actor_name2, actor_name3, actor_name4) values(?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, actorDto.getActorNo());
		ps.setString(2, actorDto.getActorName1());
		ps.setString(3, actorDto.getActorName2());
		ps.setString(4, actorDto.getActorName3());
		ps.setString(5, actorDto.getActorName4());
		
		ps.execute();
		
		con.close();
	}
	
	// 배우 수정
	// @author : 이기주
	public boolean update(ActorDto actorDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update actor set actor_name1 = ?, actor_name2 = ?, actor_name3 = ?, actor_name4 = ? where actor_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, actorDto.getActorName1());
		ps.setString(2, actorDto.getActorName2());
		ps.setString(3, actorDto.getActorName3());
		ps.setString(4, actorDto.getActorName4());
		ps.setInt(5, actorDto.getActorNo());
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	// 배우 목록 전체 조회
	// @author : 이기주
	public List<ActorDto> select() throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from actor";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<ActorDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ActorDto actorDto = new ActorDto();
			
			actorDto.setActorNo(rs.getInt("actor_no"));
			actorDto.setActorName1(rs.getString("actor_name1"));
			actorDto.setActorName2(rs.getString("actor_name2"));
			actorDto.setActorName3(rs.getString("actor_name3"));
			actorDto.setActorName4(rs.getString("actor_name4"));
			
			list.add(actorDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 배우 목록 이름으로 단일 조회
	// @author : 이기주
	public ActorDto selectOne(int actorNo) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from actor where actor_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, actorNo);
		ResultSet rs = ps.executeQuery();
		
		ActorDto actorDto;
		if(rs.next()) {
			actorDto = new ActorDto();
			actorDto.setActorNo(rs.getInt("actor_no"));
			actorDto.setActorName1(rs.getString("actor_name1"));
			actorDto.setActorName2(rs.getString("actor_name2"));
			actorDto.setActorName3(rs.getString("actor_name3"));
			actorDto.setActorName4(rs.getString("actor_name4"));
		}
		else {
			actorDto = null;
		}
	
		con.close();
	
		return actorDto;
	}

	// 배우삭제(이름으로 삭제)
	// @author : 이기주
	public boolean deleteActorName(String actorName) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete actor where actor_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, actorName);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	// 배우삭제(actor_no으로 삭제)
	// @author : 이기주
	public boolean deleteActorNo(int actorNo) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete actor where actor_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, actorNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
	//배우 이름 조회
	public ActorDto selectName(int contentsNo) throws Exception{
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from actor A"
				+ "    left outer join contents_actor C on C.actor_no = A.actor_no where contents_no=? order by contents_no asc";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		ActorDto actorDto;
		if(rs.next()) {
			actorDto = new ActorDto();
			actorDto.setActorNo(rs.getInt("actor_no"));
			actorDto.setActorName1(rs.getString("actor_name1"));
			actorDto.setActorName2(rs.getString("actor_name2"));
			actorDto.setActorName3(rs.getString("actor_name3"));
			actorDto.setActorName4(rs.getString("actor_name4"));
		}
		else {
			actorDto = null;
		}
		
		con.close();
		
		return actorDto;
		
	}
	
	//contents 번호로 actor 테이블 삭제하기
	public boolean delete(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "delete actor where actor_no = "
				+ "(select A.actor_no from actor A"
				+ "    left outer join contents_actor C on A.actor_no = C.actor_no "
				+ "    where contents_no = ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		int count = ps.executeUpdate();
		
		con.close();
		
		return count > 0;
	}
	
//////////////////////////
}




















