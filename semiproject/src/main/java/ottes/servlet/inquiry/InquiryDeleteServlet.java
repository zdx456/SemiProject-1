package ottes.servlet.inquiry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.InquiryDao;

@WebServlet(urlPatterns = "/inquiry/delete.svt")
public class InquiryDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int inquiryNo = Integer.parseInt(req.getParameter("inquiryNo"));
			
			InquiryDao inquiryDao = new InquiryDao();
			boolean success = inquiryDao.delete(inquiryNo);

			if(success) {
				resp.sendRedirect("list.jsp");
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