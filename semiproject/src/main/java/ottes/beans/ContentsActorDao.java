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
		
		ps.execute();
		
		con.close();
	}
	
	
	//컨텐츠 배우 조회
	public List<ContentsActorDto> selectList(int contentsNo) throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select * from contents_actor where contents_no=?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, contentsNo);
		ResultSet rs = ps.executeQuery();
		
		List<ContentsActorDto> list = new ArrayList<>();
		
		while(rs.next()) {
			ContentsActorDto contentsActorDto = new ContentsActorDto();
			contentsActorDto.setContentsNo(rs.getInt("contents_no"));
			contentsActorDto.setActorNo(rs.getInt("actor_no"));
			
			list.add(contentsActorDto);
		}
		
		con.close();
		
		return list;
	}

}
