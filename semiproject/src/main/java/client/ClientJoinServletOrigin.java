package client;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ottes.beans.AttachmentDao;
import ottes.beans.AttachmentDto;
import ottes.beans.ClientDao;
import ottes.beans.ClientDto;
import ottes.beans.ClientOttDao;
import ottes.beans.ClientOttDto;
import ottes.beans.LikeGenreDao;
import ottes.beans.LikeGenreDto;
import ottes.beans.OttAttachmentDao;
import ottes.beans.OttAttachmentDto;
import ottes.beans.OttDao;
import ottes.beans.OttDto;

@WebServlet(urlPatterns = "/client/join.kh")
public class ClientJoinServletOrigin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			req.setCharacterEncoding("UTF-8");
			ClientDto clientDto = new ClientDto();
			clientDto.setClientId(req.getParameter("clientId"));
			clientDto.setClientPw(req.getParameter("clientPw"));
			clientDto.setClientNick(req.getParameter("clientNick"));
			clientDto.setClientGender(req.getParameter("clientGender"));
			clientDto.setClientBirth(req.getParameter("clientBirth"));
			clientDto.setClientEmail(req.getParameter("clientEmail"));

			ClientDao clientDao = new ClientDao();
			clientDao.insert(clientDto);

			// --------- 선호하는 장르 등록 --------- //
			// like genre 테이블 준비
			LikeGenreDto likeGenreDto = new LikeGenreDto();
			likeGenreDto.setClientId(req.getParameter("clientId"));
			likeGenreDto.setGenreName(req.getParameter("genreName"));

			LikeGenreDao likeGenreDao = new LikeGenreDao();
			likeGenreDao.insert(likeGenreDto);

			// -------- ott 선택 페이지 등록 -----------//

			boolean haveOtt = req.getParameter("ottNo") != null && !req.getParameter("ottNo").equals("");
			
			if(haveOtt) {
			// 배열로 받기! 체크박스 값 여러개 가능 하므로
			String[] ottNoStr = req.getParameterValues("ottNo");

			// String 배열은 int 배열로 변환 (stream 이용)
			int[] ottNoArray = Arrays.stream(ottNoStr).mapToInt(Integer::parseInt).toArray();

			ClientOttDao clientOttDao = new ClientOttDao();
			String clientId = req.getParameter("clientId");


			for (int i = 0; i < ottNoArray.length; i++) {
				int ottNo = ottNoArray[i];

				clientOttDao.insert(clientId, ottNo);
			}
			}
			
			resp.sendRedirect(req.getContextPath() + "/client/join_finish.jsp");

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}
}