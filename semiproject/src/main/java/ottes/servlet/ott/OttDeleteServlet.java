package ottes.servlet.ott;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.AttachmentDao;
import ottes.beans.ClientOttDao;
import ottes.beans.OttAttachmentDao;
import ottes.beans.OttDao;

@WebServlet(urlPatterns = "/ott/delete.svt") 
public class OttDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int ottNo = Integer.parseInt(req.getParameter("ottNo"));
			
			//Attachment 테이블
			AttachmentDao attachmentDao = new AttachmentDao();
			attachmentDao.deleteOtt(ottNo);
			
			//클라이언트-Ott 테이블
			ClientOttDao clientOttDao = new ClientOttDao();
			clientOttDao.delete(ottNo);
			
			//Ott-Attachment 테이블
			OttAttachmentDao ottAttachmentDao = new OttAttachmentDao();
			ottAttachmentDao.delete(ottNo);
			
			//Ott 테이블
			OttDao ottDao = new OttDao();
			ottDao.delete(ottNo);
			
			
			
			resp.sendRedirect(req.getContextPath()+"/ott/list.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}