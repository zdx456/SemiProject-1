package ottes.servlet.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.NoticeDao;

@WebServlet(urlPatterns = "/adminClient/notice_delete.svt")
public class NoticeDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
			
			NoticeDao noticeDao = new NoticeDao();
			boolean success = noticeDao.delete(noticeNo);

			if(success) {
				resp.sendRedirect("notice_list.jsp");
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