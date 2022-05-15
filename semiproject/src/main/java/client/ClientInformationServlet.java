package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;
import ottes.beans.LikeGenreDao;

@WebServlet(urlPatterns = "/client/information.kh")
public class ClientInformationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			ClientDto clientDto = new ClientDto();
			clientDto.setClientId((String) req.getSession().getAttribute("login"));
			clientDto.setClientNick(req.getParameter("clientNick"));
			clientDto.setClientGender(req.getParameter("clientGender"));
			clientDto.setClientBirth(req.getParameter("clientBirth"));
			clientDto.setClientEmail(req.getParameter("clientEmail"));
			clientDto.setClientPw(req.getParameter("clientPw"));
			ClientDao clientDao = new ClientDao();
			ClientDto findDto = clientDao.selectOne(clientDto.getClientId());
			
			
			// 선호장르 입력 서블릿 구문 추가했습니다
			// @author: 이기주
			String clientId = (String) req.getSession().getAttribute("login");
			LikeGenreDao likeGenreDao = new LikeGenreDao();

			boolean haveGenre = req.getParameter("genreName") != null && !req.getParameter("genreName").equals("");

			if (haveGenre) {
				// 배열로 받기! 체크박스 값 여러개 가능 하므로
				String[] whatIsGenreName = req.getParameterValues("genreName");

				likeGenreDao.delete(clientId);

				for (int i = 0; i < whatIsGenreName.length; i++) {
					String genreName = whatIsGenreName[i];

					likeGenreDao.insert2(clientId, genreName);
				}

//				resp.sendRedirect(req.getContextPath() + "/client/mypage.jsp");
//			} else {
//				likeGenreDao.delete(clientId);
//				resp.sendRedirect(req.getContextPath() + "/client/mypage.jsp");
			}
			
			
			
			
			boolean isPasswordCorrect = clientDto.getClientPw().equals(findDto.getClientPw());

			if (!isPasswordCorrect) {
				resp.sendRedirect("information.jsp?error");
				return;
			}
			clientDao.chgInfoClient(clientDto);
			resp.sendRedirect("mypage.jsp");
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
