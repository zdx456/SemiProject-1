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
import ottes.beans.OttContentsDao;
import ottes.beans.OttContentsDto;
import ottes.beans.OttDao;
import ottes.beans.OttDto;

@WebServlet(urlPatterns = "/adminContents/insert.svt")
public class ContentsInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//Multipart 요청 처리 준비
			String path = "D:/upload/kh91";
			
			File dir = new File(path);
			dir.mkdirs();
			
			int max = 2 * 1024 * 1024; //업로드 제한 2MB
			String encoding = "UTF-8";
			DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
			
			MultipartRequest mRequest = new MultipartRequest(req, path, max, encoding, policy);
			
			//*************** 콘텐츠 정보 등록 ***************//
			//[1] contents 테이블 등록
			//[1] - 준비
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setRegionName(mRequest.getParameter("regionName"));
			contentsDto.setGenreName(mRequest.getParameter("genreName"));
			contentsDto.setContentsTitle(mRequest.getParameter("contentsTitle"));
			contentsDto.setContentsGrade(mRequest.getParameter("contentsGrade"));
			contentsDto.setContentsTime(Integer.parseInt(mRequest.getParameter("contentsTime")));
			contentsDto.setContentsDirector(mRequest.getParameter("contentsDirector"));
			contentsDto.setContentsSummary(mRequest.getParameter("contentsSummary"));
			
			//[1] - 처리
			ContentsDao contentsDao = new ContentsDao();
			contentsDto.setContentsNo(contentsDao.getSequence()); //시퀀스 등록
			contentsDao.insert(contentsDto);
			
			//*************** 첨부파일 등록 ***************//
			//[2] attachment 테이블 등록
			//[2] - 준비
			AttachmentDto attachmentDto = new AttachmentDto();
			attachmentDto.setAttachmentUploadname(mRequest.getOriginalFileName("contentsAttachment"));
			attachmentDto.setAttachmentSavename(mRequest.getFilesystemName("contentsAttachment"));
			attachmentDto.setAttachmentType(mRequest.getContentType("contentsAttachment"));
			
			File target = mRequest.getFile("contentsAttachment");
			attachmentDto.setAttachmentSize(target.length());
			
			//[2] - 처리
			AttachmentDao attachmentDao = new AttachmentDao();
			attachmentDto.setAttachmentNo(attachmentDao.getSequence()); //시퀀스 등록
			attachmentDao.insert(attachmentDto);
			
			//[3] contentsAttachment 테이블 등록 (contents와 attachment 관계 설정)
			//[3] - 준비
			ContentsAttachmentDto contentsAttachmentDto = new ContentsAttachmentDto();
			contentsAttachmentDto.setContentsNo(contentsDto.getContentsNo());
			contentsAttachmentDto.setAttachmentNo(attachmentDto.getAttachmentNo());
			
			//[3] - 처리
			ContentsAttachmentDao contentsAttachmentDao = new ContentsAttachmentDao();
			contentsAttachmentDao.insert(contentsAttachmentDto);
			
			//*************** 배우 등록 ***************//
			//[4] actor 테이블 등록
			//[4] - 준비
			ActorDto actorDto = new ActorDto();
			actorDto.setActorName1(mRequest.getParameter("actorName1"));
			actorDto.setActorName2(mRequest.getParameter("actorName2"));
			actorDto.setActorName3(mRequest.getParameter("actorName3"));
			actorDto.setActorName4(mRequest.getParameter("actorName4"));
			
			//[4] - 처리
			ActorDao actorDao = new ActorDao();
			actorDto.setActorNo(actorDao.getSequence()); //시퀀스 등록
			actorDao.insert(actorDto);
			
			//[5] contentsActor 테이블 등록
			//[5] - 준비
			ContentsActorDto contentsActorDto = new ContentsActorDto();
			contentsActorDto.setContentsNo(contentsDto.getContentsNo());
			contentsActorDto.setActorNo(actorDto.getActorNo());
			
			//[5] - 처리
			ContentsActorDao contentsActorDao = new ContentsActorDao();
			contentsActorDao.insert(contentsActorDto);
			
			//*************** OTT 등록 ***************//
			//[6] ottContents 테이블 등록
			//[6] - 준비
			//등록할 때, ott 이름으로 입력하면 ott DB에서 해당하는 ott번호를 가져와서 등록한다.
			//그러므로 ott번호를 알고있을 필요 없음 
			
			String[] ottNames = mRequest.getParameterValues("ottName");
			
			for(int i = 0; i < ottNames.length; i++) {
				
				OttContentsDto ottContentsDto = new OttContentsDto();			
				
				OttDao ottDao = new OttDao();

				String ottName = ottNames[i];
				OttDto ottDto = ottDao.selectOne(ottName);
				
				ottContentsDto.setOttNo(ottDto.getOttNo());
				ottContentsDto.setContentsNo(contentsDto.getContentsNo());
				
				//[6] - 처리
				OttContentsDao ottContentsDao = new OttContentsDao();
				ottContentsDao.insert(ottContentsDto);
				
			}
			
			
			//출력
			resp.sendRedirect(req.getContextPath()+"/adminContents/detail.jsp?contentsNo=" + contentsDto.getContentsNo());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
