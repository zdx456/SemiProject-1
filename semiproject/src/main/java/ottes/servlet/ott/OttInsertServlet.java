package ottes.servlet.ott;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ottes.beans.AttachmentDao;
import ottes.beans.AttachmentDto;
import ottes.beans.OttAttachmentDao;
import ottes.beans.OttAttachmentDto;
import ottes.beans.OttDao;
import ottes.beans.OttDto;

@WebServlet(urlPatterns = "/ott/insert.svt") //주소
public class OttInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ott 생성 서블릿 (생성.jsp -> servlet)
		try {
			
			//파일 첨부 준비
			String path = "D:/upload/kh91";
			
			File dir = new File(path);
			dir.mkdirs();
			
			int max = 2 * 1024 * 1024; //업로드 제한 2MB
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
			
			
			//ott 생성
			OttDto ottDto = new OttDto();
			
			ottDto.setOttName(mRequest.getParameter("ottName"));
			ottDto.setOttPrice(Integer.parseInt(mRequest.getParameter("ottPrice")));
			
			OttDao ottDao = new OttDao();
			ottDto.setOttNo(ottDao.getSequence()); //ott 번호 시퀀스 
			
			ottDao.insert(ottDto);
			
			
			// attachment 테이블 등록
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("ottLogo"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("ottLogo"));
			attachmentDto.setAttachmentType(mRequest.getContentType("ottLogo"));
			
			File target = mRequest.getFile("ottLogo");
			attachmentDto.setAttachmentSize(target.length());
			
			
			AttachmentDao attachmentDao = new AttachmentDao();
			attachmentDto.setAttachmentNo(attachmentDao.getSequence());
			attachmentDao.insert(attachmentDto);
			
			
			// ottAttachment 등록
			OttAttachmentDto ottAttachmentDto = new OttAttachmentDto();
			ottAttachmentDto.setOttNo(ottDto.getOttNo());
			ottAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
			
			
			OttAttachmentDao ottAttachmentDao = new OttAttachmentDao();
			ottAttachmentDao.insert(ottAttachmentDto);
			
			resp.sendRedirect(req.getContextPath()+"/ott/list.jsp");
			// ott 목록으로 돌아가기!
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
