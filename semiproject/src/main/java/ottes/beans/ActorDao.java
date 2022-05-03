package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ActorDao {
	
	// 배우 생성
	// @author : 이기주
	public void actor(ActorDto actorDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "insert into actor(actor_no, actor_name) values(actor_seq.nextval, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, actorDto.getActorName());
		
		ps.execute();
		
		con.close();
	}
	
	// 배우 수정
	// @author : 이기주
	public boolean update(ActorDto actorDto) throws Exception {
		Connection con = JdbcUtils.getConnection();
		
		String sql = "update actor set actor_no = ?, actor_name = ? where actor_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, actorDto.getActorNo());
		ps.setString(5, actorDto.getActorName());
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
			
			actorDto.setActorNo(rs.getInt("actorNo"));
			actorDto.setActorName(rs.getString("actorName"));
			
			list.add(actorDto);
		}
		
		con.close();
		
		return list;
	}
	
	// 배우 목록 이름으로 단일 조회
	// @author : 이기주
	public ActorDto selectOne(String actorName) throws Exception{
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from actor where actor_name = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, actorName);
		ResultSet rs = ps.executeQuery();
		
		ActorDto actorDto;
		if(rs.next()) {
			actorDto = new ActorDto();
			actorDto.setActorNo(rs.getInt("actor_no"));
			actorDto.setActorName(rs.getString("actor_name"));
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
	
//////////////////////////
}