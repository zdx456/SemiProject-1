package ottes.servlet.inquiry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.InquiryDao;
import ottes.beans.ReplyDao;
import ottes.beans.ReplyDto;

@WebServlet(urlPatterns = "/admin/reply_write.svt")
public class ReplyWriteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			ReplyDto replyDto = new ReplyDto();
			replyDto.setReplyContent(req.getParameter("replyContent"));
			replyDto.setReplyTarget(Integer.parseInt(req.getParameter("replyTarget")));
		
			replyDto.setReplyWriter((String)req.getSession().getAttribute("login"));

			ReplyDao replyDao = new ReplyDao();
			replyDao.insert(replyDto);
			
			InquiryDao inquiryDao = new InquiryDao();
			inquiryDao.updateReplycount(replyDto.getReplyTarget());

			resp.sendRedirect("inquiry_detail.jsp?inquiryNo=" + replyDto.getReplyTarget());
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}