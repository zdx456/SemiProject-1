<%@page import="ottes.beans.AttachmentDto"%>
<%@page import="ottes.beans.AttachmentDao"%>
<%@page import="ottes.beans.ContentsDto"%>
<%@page import="java.util.List"%>
<%@page import="ottes.beans.ContentsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
    
    boolean isSearch = (type != null && !type.equals("")) &&  (keyword != null && !keyword.equals(""));
    
    ContentsDao contentsDao = new ContentsDao();
    
    List<ContentsDto> list;
    if(isSearch) {
    	list = contentsDao.selectList(type, keyword);
    }
    else {
    	list = contentsDao.selectList();
    }
    

    %>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container w600 m50">
<div class="row center">

	<!--  검색창 -->
	
	<form action="" method="post">
	
		<%if(type == null){ %>
		
					<select name="type">
						<option value="none" selected>선택</option>
						<option value="contents_title">제목</option>
						<option value="contents_grade">등급</option>
						<option value="contents_director">감독</option>
						<option value="genre_name">장르</option>
						<option value="region_name">국가</option>
					</select>
					<%} else if(type.equals("contents_title")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title" selected>제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else if(type.equals("contents_grade")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade" selected>등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else if(type.equals("contents_director")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director" selected>감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else if(type.equals("genre_name")) {%>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name" selected>장르</option>
							<option value="region_name">국가</option>
						</select>
					<%} else { %>
						<select name="type">
							<option value="none">선택</option>
							<option value="contents_title">제목</option>
							<option value="contents_grade">등급</option>
							<option value="contents_director">감독</option>
							<option value="genre_name">장르</option>
							<option value="region_name" selected>국가</option>
						</select>
		<%} %>
		
		
				<%if(isSearch){ %>
		<input type="text" name="keyword" placeholder="검색어 입력"  value=<%=keyword %>>
		<%} else { %>
		<input type="text" name="keyword" placeholder="검색어 입력" >
		<%} %>
		<input type="submit" value="검색">
	</form>
	
	<!--  검색 결과 -->
	
	<%if(list.isEmpty()){ %>
		<h2>결과가 존재하지 않습니다.</h2>
	<%} else { %>
	
	<table class="table">
					<thead>
		<h3>검색 결과가 <%=list.size() %> 건 있습니다. </h3>

						<tr>
							<td><h3>제목</h3></td>
							<td><h3>등급</h3></td>
							<td><h3>감독</h3></td>
							<td><h3>장르</h3></td>
							<td><h3>국가</h3></td>
							<td><h3>줄거리</h3></td>
						</tr>
					</thead>
					
						<tbody>
						
					<%for(ContentsDto contentsDto : list) {%>
						<tr>
							<td><a href="detail.jsp?contentsNo=<%=contentsDto.getContentsNo() %>"><%=contentsDto.getContentsTitle() %></a></td>
							<td><%=contentsDto.getContentsGrade() %></td>
							<td><%=contentsDto.getContentsDirector() %></td>
							<td><%=contentsDto.getGenreName() %></td>
							<td><%=contentsDto.getRegionName() %></td>
							<td><%=contentsDto.getContentsSummary() %>
							
						</tr>

						<%} %>
					</tbody>
	</table>
<% } %>
</div>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>