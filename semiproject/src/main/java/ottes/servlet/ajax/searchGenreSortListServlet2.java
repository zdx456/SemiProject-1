package ottes.servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import ottes.beans.ContentsAttachmentDao;
import ottes.beans.ContentsAttachmentDto;

@WebServlet(urlPatterns = "/search/genre_sort2.svt")
public class searchGenreSortListServlet2  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int p = Integer.parseInt(req.getParameter("p")); // 페이지 번호
			String type =  req.getParameter("type"); // 국가
			
			ContentsAttachmentDao contentsAttachmentDao = new ContentsAttachmentDao();
			List<ContentsAttachmentDto> searchList = contentsAttachmentDao.searchGenreSort(p, type); 

			ObjectMapper mapper = new ObjectMapper();
			String jsonString = mapper.writeValueAsString(searchList);

			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(jsonString);
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
