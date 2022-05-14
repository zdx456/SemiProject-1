package ottes.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StatsDao {
	
	
	//성별 선호 장르 통계 
	public List<StatsDto> genreSex() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select "
				+ "    genre_name,"
				+ "    count(*),"
				+ "    count(case when client_gender='여성' then 1 end) 여성,"
				+ "    count(case when client_gender='남성' then 1 end) 남성"
				+ "        from (select * from likegenre L left outer join client C on L.client_id = C.client_id) where client_grade='일반회원'"
				+ "    group by genre_name "
				+ "	   order by order by ("
				+ "        case genre_name "
				+ "        when '영화' then 1"
				+ "        when '드라마' then 2"
				+ "        when '다큐멘터리' then 3"
				+ "        when '애니메이션' then 4"
				+ "        when '버라이어티' then 5"
				+ "        when '없음' then 6"
				+ "        end)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<StatsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			
			StatsDto statsDto = new StatsDto();
			statsDto.setGenreName(rs.getString("genre_name"));
			statsDto.setCntTotalGenre(rs.getInt("count(*)"));
			statsDto.setCntMan(rs.getInt("남성"));
			statsDto.setCntWoman(rs.getInt("여성"));
			
			list.add(statsDto);
		}
		
		con.close();
		
		return list;
		
	}
	
	//연령대별 선호 장르 통계
	public List<StatsDto> genreAge() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select "
				+ "    genre_name,"
				+ "    count(*),"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 0 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 20 then 1 end) 십대이하,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 20 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 30 then 1 end) 이십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 30 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 40 then 1 end) 삼십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 40 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 50 then 1 end) 사십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 50 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 60 then 1 end) 오십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 60 then 1 end) 육십대이상"
				+ "        from (select * from likegenre L left outer join client C on L.client_id = C.client_id) where client_grade='일반회원'"
				+ "    group by genre_name order by genre_name"
				+ "	   order by ("
				+ "        case genre_name "
				+ "        when '영화' then 1"
				+ "        when '드라마' then 2"
				+ "        when '다큐멘터리' then 3"
				+ "        when '애니메이션' then 4"
				+ "        when '버라이어티' then 5"
				+ "        when '없음' then 6"
				+ "        end)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<StatsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			StatsDto statsDto = new StatsDto();
			statsDto.setGenreName(rs.getString("genre_name"));
			statsDto.setCntTotalGenre(rs.getInt("count(*)"));
			statsDto.setCntTen(rs.getInt("십대이하"));
			statsDto.setCntTwenty(rs.getInt("이십대"));
			statsDto.setCntThirty(rs.getInt("삼십대"));
			statsDto.setCntForty(rs.getInt("사십대"));
			statsDto.setCntFifty(rs.getInt("오십대"));
			statsDto.setCntSixty(rs.getInt("육십대이상"));
			
			list.add(statsDto);
		}
		
		con.close();
		
		return list;
	}
	
	//성별 OTT 통계
	public List<StatsDto> ottSex() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select "
				+ "    ott_name,"
				+ "    count(*),"
				+ "    count(case when client_gender='여성' then 1 end) 여성,"
				+ "    count(case when client_gender='남성' then 1 end) 남성"
				+ "        from (select * from client_ott O "
				+ "    left outer join client C on O.client_no = C.client_id "
				+ "    left outer join ott T on T.ott_no = O.ott_no) where client_grade='일반회원'"
				+ "        group by ott_name"
				+ "        order by ott_name";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<StatsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			
			StatsDto statsDto = new StatsDto();
			statsDto.setOttName(rs.getString("ott_name"));
			statsDto.setCntTotalOtt(rs.getInt("count(*)"));
			statsDto.setCntMan(rs.getInt("남성"));
			statsDto.setCntWoman(rs.getInt("여성"));
			
			list.add(statsDto);
		}
		
		con.close();
		
		return list;
	}
	
	//연령별 OTT 통계
	public List<StatsDto> ottAge() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "select "
				+ "    ott_name,"
				+ "    count(*),"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 0 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 20 then 1 end) 십대이하,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 20 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 30 then 1 end) 이십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 30 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 40 then 1 end) 삼십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 40 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 50 then 1 end) 사십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 50 and TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) < 60 then 1 end) 오십대,"
				+ "    count(case when TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), TO_char(client_birth,'YYYYMMDD')) / 12) >= 60 then 1 end) 육십대이상"
				+ "        from (select * from client_ott O "
				+ "    left outer join client C on O.client_no = C.client_id "
				+ "    left outer join ott T on T.ott_no = O.ott_no) where client_grade='일반회원'"
				+ "    group by ott_name"
				+ "    order by ott_name";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<StatsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			StatsDto statsDto = new StatsDto();
			statsDto.setOttName(rs.getString("ott_name"));
			statsDto.setCntTotalOtt(rs.getInt("count(*)"));
			statsDto.setCntTen(rs.getInt("십대이하"));
			statsDto.setCntTwenty(rs.getInt("이십대"));
			statsDto.setCntThirty(rs.getInt("삼십대"));
			statsDto.setCntForty(rs.getInt("사십대"));
			statsDto.setCntFifty(rs.getInt("오십대"));
			statsDto.setCntSixty(rs.getInt("육십대이상"));
			
			list.add(statsDto);
		}
		
		con.close();
		
		return list;
	}
	
	public List<StatsDto> contentsCount() throws Exception {
		
		Connection con = JdbcUtils.getConnection();
		
		String sql = "with ott_name (ott_name, 전체, 영화, 드라마, 다큐멘터리, 애니메이션, 버라이어티, 아시아, 한국, 할리우드) as ("
				+ "select "
				+ "    ott_name, "
				+ "    count(*) 전체,"
				+ "    count(case when genre_name='영화' then 1 end) 영화,"
				+ "    count(case when genre_name='드라마' then 1 end) 드라마,"
				+ "    count(case when genre_name='다큐멘터리' then 1 end) 다큐멘터리,"
				+ "    count(case when genre_name='애니메이션' then 1 end) 애니메이션,"
				+ "    count(case when genre_name='버라이어티' then 1 end) 버라이어티,"
				+ "    count(case when region_name='아시아' then 1 end) 아시아,"
				+ "    count(case when region_name='한국' then 1 end) 한국,"
				+ "    count(case when region_name='할리우드' then 1 end) 할리우드"
				+ "    from (select * from contents C"
				+ "        left outer join ott_contents O on C.contents_no = O.contents_no"
				+ "        left outer join ott T on T.ott_no = O.ott_no) group by ott_name order by ott_name"
				+ "        ) select ott_name, sum(전체), sum(영화), sum(드라마), sum(다큐멘터리), sum(애니메이션), sum(버라이어티), sum(아시아), sum(한국), sum(할리우드) from ott_name"
				+ "        group by rollup(ott_name)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<StatsDto> list = new ArrayList<>();
		
		while(rs.next()) {
			StatsDto statsDto = new StatsDto();
			statsDto.setOttName(rs.getString("ott_name"));
			statsDto.setConTotal(rs.getInt("sum(전체)"));
			statsDto.setConMovie(rs.getInt("sum(영화)"));
			statsDto.setConDrama(rs.getInt("sum(드라마)"));
			statsDto.setConDocumentary(rs.getInt("sum(다큐멘터리)"));
			statsDto.setConAnimation(rs.getInt("sum(애니메이션)"));
			statsDto.setConVariety(rs.getInt("sum(버라이어티)"));
			statsDto.setConAsia(rs.getInt("sum(아시아)"));
			statsDto.setConKorea(rs.getInt("sum(한국)"));
			statsDto.setConHollywood(rs.getInt("sum(할리우드)"));
			
			list.add(statsDto);
		}
		
		con.close();
		
		return list;
		
	}

}












