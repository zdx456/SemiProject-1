package ottes.servlet.inquiry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.InquiryDao;
import ottes.beans.ReplyDao;

@WebServlet(urlPatterns = "/admin/reply_delete.svt")
public class ReplyDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int replyNo = Integer.parseInt(req.getParameter("replyNo"));
			int replyTarget = Integer.parseInt(req.getParameter("replyTarget"));

			ReplyDao replyDao = new ReplyDao();
			boolean success = replyDao.delete(replyNo);

			if(success) {
				InquiryDao inquiryDao = new InquiryDao();
				inquiryDao.updateReplycount(replyTarget);
				resp.sendRedirect("inquiry_detail.jsp?inquiryNo=" + replyTarget);
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