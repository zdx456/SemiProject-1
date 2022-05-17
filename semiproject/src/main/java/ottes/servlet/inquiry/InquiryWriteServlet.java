package ottes.servlet.inquiry;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.InquiryDao;
import ottes.beans.InquiryDto;

@WebServlet(urlPatterns = "/inquiry/inquiry_write.svt")
public class InquiryWriteServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			InquiryDto inquiryDto = new InquiryDto();
			inquiryDto.setInquiryType(req.getParameter("inquiryType"));
			inquiryDto.setInquiryTitle(req.getParameter("inquiryTitle"));
			inquiryDto.setInquiryContent(req.getParameter("inquiryContent"));

			String clientId = (String) req.getSession().getAttribute("login");
			inquiryDto.setInquiryWriter(clientId);

			InquiryDao inquiryDao = new InquiryDao();
			inquiryDto.setInquiryNo(inquiryDao.getSequence());
			inquiryDao.insert(inquiryDto);
			
			// 문의 접수 완료 후 등록 완료 안내 페이지로 이동
			resp.sendRedirect(req.getContextPath()+"/inquiry/write_success.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}	
