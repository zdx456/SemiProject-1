package ottes.servlet.adminContents;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ActorDao;
import ottes.beans.AttachmentDao;
import ottes.beans.ContentsActorDao;
import ottes.beans.ContentsAttachmentDao;
import ottes.beans.ContentsDao;
import ottes.beans.OttContentsDao;

@WebServlet(urlPatterns = "/adminContents/delete.svt")
public class ContentsDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//준비
			int contentsNo = Integer.parseInt(req.getParameter("contentsNo"));
			
			//처리
			//(2) 배우 테이블 삭제
			ActorDao actorDao = new ActorDao();
			actorDao.delete(contentsNo);
			
			//(3) 컨텐츠-배우 테이블 삭제
			ContentsActorDao contentsActorDao = new ContentsActorDao();
			contentsActorDao.delete(contentsNo);
			
			//(4) 첨부파일 테이블 삭제
			AttachmentDao attachmentDao = new AttachmentDao();
			attachmentDao.delete(contentsNo);
			
			//(5) 컨텐츠-첨부파일 테이블 삭제
			ContentsAttachmentDao contentsAttachmentDao = new ContentsAttachmentDao();
			contentsAttachmentDao.delete(contentsNo);
			
			//(6) ott별 컨텐츠 테이블 삭제
			OttContentsDao ottContentsDao = new OttContentsDao();
			ottContentsDao.delete(contentsNo);
			
			//(1) 컨텐츠 테이블 삭제
			ContentsDao contentsDao = new ContentsDao();
			contentsDao.delete(contentsNo);
			
			
			//출력
			resp.sendRedirect(req.getContextPath() + "/adminContents/list.jsp");

			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
