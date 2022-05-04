package ottes.servlet.ott;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.OttDao;

@WebServlet (urlPatterns = "/ott/delete.svt")
public class OttDeleteServlet extends HttpServlet{
	@Override
	//ott 삭제 (목록에서 바로 삭제)
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int ottNo = Integer.parseInt(req.getParameter("ottNo"));
			
			OttDao ottDao = new OttDao();
			
			boolean success = ottDao.delete(ottNo);
			
			if(success) {
				resp.sendRedirect(req.getContextPath()+"/ott/list.jsp");
				//성공시 ott 목록으로 이동!
			} else {
				resp.sendError(404);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
