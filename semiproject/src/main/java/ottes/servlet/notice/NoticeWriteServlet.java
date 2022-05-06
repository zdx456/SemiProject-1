package ottes.servlet.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.NoticeDao;
import ottes.beans.NoticeDto;

@WebServlet(urlPatterns = "/admin/notice_write.svt")
public class NoticeWriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			NoticeDto noticeDto = new NoticeDto();
			noticeDto.setNoticeType(req.getParameter("noticeType"));
			noticeDto.setNoticeTitle(req.getParameter("noticeTitle"));
			noticeDto.setNoticeContent(req.getParameter("noticeContent"));

			String clientId = (String) req.getSession().getAttribute("login");
			noticeDto.setNoticeWriter(clientId);

			NoticeDao noticeDao = new NoticeDao();
			noticeDto.setNoticeNo(noticeDao.getSequence());
			noticeDao.insert(noticeDto);

			resp.sendRedirect("notice_list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}