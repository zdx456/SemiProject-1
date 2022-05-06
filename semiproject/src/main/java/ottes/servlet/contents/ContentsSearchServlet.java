package ottes.servlet.contents;

import javax.servlet.http.HttpServlet;

import ottes.beans.ContentsDao;
import ottes.beans.ContentsDto;

import java.util.List;

import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = "/contents/search.svt")
public class ContentsSearchServlet extends HttpServlet{
	
	protected void service(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws javax.servlet.ServletException ,java.io.IOException {
		
		try {
			
			String genre = req.getParameter("genre");
			String keyword = req.getParameter("keyword");
			
			// genre, keyword 둘 다 존재한다면
			boolean isSearch = genre != null && keyword != null;
			
			ContentsDao contentsDao = new ContentsDao();
			
			List<ContentsDto> list;
			
			if(isSearch) {
				list = contentsDao.selectList(genre, keyword);
			}
			else {
				list = contentsDao.selectList();
			}
			
			if(list.isEmpty()) {
				
				resp.getWriter().println("검색어가 존재하지 않습니다.");
				resp.getWriter().println("검색 결과 : " + list.size() + "개");
				
				for (ContentsDto contentsDto : list) {
					resp.getWriter().println(contentsDto);
				}
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			resp.sendError(500);

		}
		
	};

}
