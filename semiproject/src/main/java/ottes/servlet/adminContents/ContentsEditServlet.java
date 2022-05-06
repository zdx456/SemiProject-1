   package ottes.servlet.adminContents;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ottes.beans.ActorDao;
import ottes.beans.ActorDto;
import ottes.beans.AttachmentDao;
import ottes.beans.AttachmentDto;
import ottes.beans.ContentsActorDao;
import ottes.beans.ContentsActorDto;
import ottes.beans.ContentsAttachmentDao;
import ottes.beans.ContentsAttachmentDto;
import ottes.beans.ContentsDao;
import ottes.beans.ContentsDto;

@WebServlet(urlPatterns = "/adminContents/edit.svt")
public class ContentsEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//Multipart 요청 처리 준비
			String path = System.getProperty("user.home") + "/upload";
			
			File dir = new File(path);
			dir.mkdirs();
			
			int max = 2 * 1024 * 1024; //업로드 제한 2MB
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
			
			//*************** 콘텐츠 정보 수정 ***************//
			//[1] contents 테이블 수정
			//[1] - 준비
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setContentsNo(Integer.parseInt(mRequest.getParameter("contentsNo")));
			contentsDto.setRegionName(mRequest.getParameter("regionName"));
			contentsDto.setGenreName(mRequest.getParameter("genreName"));
			contentsDto.setContentsTitle(mRequest.getParameter("contentsTitle"));
			contentsDto.setContentsGrade(mRequest.getParameter("contentsGrade"));
			contentsDto.setContentsTime(Integer.parseInt(mRequest.getParameter("contentsTime")));
			contentsDto.setContentsDirector(mRequest.getParameter("contentsDirector"));
			contentsDto.setContentsSummary(mRequest.getParameter("contentsSummary"));
			
			//[1] - 처리
			ContentsDao contentsDao = new ContentsDao();
			contentsDao.update(contentsDto);
			
			//*************** 첨부파일 수정 ***************//
			//[2] attachment 테이블 수정
			//[2] - 준비
			AttachmentDto attachmentDto = new AttachmentDto();
			
			if(mRequest.getFile("contentsAttachment") != null) {
				attachmentDto.setAttachmentNo(Integer.parseInt(mRequest.getParameter("attachmentNo")));
				attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("contentsAttachment"));
				attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("contentsAttachment"));
				attachmentDto.setAttachmentType(mRequest.getContentType("contentsAttachment"));
				File target = mRequest.getFile("contentsAttachment");
				attachmentDto.setAttachmentSize(target.length());
				
				//[2] - 처리
				
				AttachmentDao attachmentDao = new AttachmentDao();
				attachmentDao.update(attachmentDto);
				
			}
			
			
			//*************** 배우 수정 ***************//
			//[4] actor 테이블 수정
			//[4] - 준비
			ActorDto actorDto = new ActorDto();
			actorDto.setActorNo(Integer.parseInt(mRequest.getParameter("actorNo")));
			actorDto.setActorName1(mRequest.getParameter("actorName1"));
			actorDto.setActorName2(mRequest.getParameter("actorName2"));
			actorDto.setActorName3(mRequest.getParameter("actorName3"));
			actorDto.setActorName4(mRequest.getParameter("actorName4"));
			
			//[4] - 처리
			ActorDao actorDao = new ActorDao();
			actorDao.update(actorDto);
			
		
			//출력
			resp.sendRedirect(req.getContextPath()+"/adminContents/detail.jsp?contentsNo=" + contentsDto.getContentsNo());

			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
