package ottes.servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import ottes.beans.ReviewDao;
import ottes.beans.ReviewDto;

@WebServlet(urlPatterns = "/ajax/review_list.svt")
public class reviewListServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
//			http://localhost:8080/semiproject/ajax/review_list.svt?p=1&s=10&contentsNo=2 주소
			int p = Integer.parseInt(req.getParameter("p"));
			int s = Integer.parseInt(req.getParameter("s"));
			
			int contentsNo = Integer.parseInt(req.getParameter("contentsNo"));
			
			ReviewDao reviewDao = new ReviewDao();
			List<ReviewDto> list = reviewDao.selectListContentsByPasing(contentsNo, p, s);

			ObjectMapper mapper = new ObjectMapper();
			String jasonString = mapper.writeValueAsString(list);
			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(jasonString);
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
