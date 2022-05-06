package ottes.servlet.adminContents;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.AttachmentDao;
import ottes.beans.AttachmentDto;

@WebServlet(urlPatterns = "/adminContents/file_down.svt")
public class ContentsDownloadServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			int attachmentNo = Integer.parseInt(req.getParameter("attachmentNo"));
			
			//처리
			AttachmentDao attachmentDao = new AttachmentDao();
			AttachmentDto attachmentDto = attachmentDao.selectOne(attachmentNo);
			
			if(attachmentDto == null) {
				resp.sendError(404);
				return;
			}
			
			//파일 객체 생성
			File target = new File(AttachmentDao.path, attachmentDto.getAttachmentSavename());
			
			resp.setHeader("Content-Type", "application/octest-stream");
			resp.setHeader("Content-Encoding", "UTF-8");
			resp.setHeader("Content-Length", String.valueOf(attachmentDto.getAttachmentSize()));
			
			String filename = URLEncoder.encode(attachmentDto.getAttachmentUploadname(), "UTF-8");
			resp.setHeader("Content-Disposition", "attachment; filename=\""+filename+"\"");
		
			//사용자에게 파일을 출력
			byte[] buffer = new byte[8192];
			FileInputStream in = new FileInputStream(target);
			
			while(true) {
				int size = in.read(buffer);
				if(size == -1) break;
				resp.getOutputStream().write(buffer, 0, size);
			}
			
			in.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}

}








