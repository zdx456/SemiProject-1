package ottes.servlet.adminContents;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ContentsDao;

@WebServlet(urlPatterns = "/adminContents/delete.svt")
public class ContentsDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//준비
			int contentsNo = Integer.parseInt(req.getParameter("contentsNo"));
			
			//처리
			ContentsDao contentsDao = new ContentsDao();
			boolean isSuccess = contentsDao.delete(contentsNo);
			
			//출력
			if(isSuccess) {
				resp.sendRedirect(req.getContextPath() + "/adminContents/list.jsp");
			}
			else {
				resp.sendError(404);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
