package ottes.servlet.ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.OttDao;
import ottes.beans.OttDto;

@WebServlet(urlPatterns = "/ajax/ottName.svt")
public class OttNameServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String ottName = req.getParameter("ottName");
			
			OttDao ottDao = new OttDao();
			OttDto ottDto = ottDao.selectOne(ottName);
			
			resp.setContentType("text/plain; charset=UTF-8");
			if(ottDto != null) { //ottName이 있으면
				resp.getWriter().print("N");
			} else {
				resp.getWriter().print("Y");
				}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
