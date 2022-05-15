package ottes.servlet.genre;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.LikeGenreDao;
import ottes.beans.LikeGenreDto;

@WebServlet(urlPatterns = "/genre/genre_update.svt")
public class LikeGenreUpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String clientId = (String) req.getSession().getAttribute("login");
			LikeGenreDao likeGenreDao = new LikeGenreDao();

			boolean haveGenre = req.getParameter("genreName") != null && !req.getParameter("genreName").equals("");

			if (haveGenre) {
				// 배열로 받기! 체크박스 값 여러개 가능 하므로
				String[] whatIsGenreName = req.getParameterValues("genreName");

				// String 배열은 int 배열로 변환 (stream 이용)
//				int[] ottNoArray = Arrays.stream(ottNoStr).mapToInt(Integer::parseInt).toArray();

				likeGenreDao.delete(clientId);

				for (int i = 0; i < whatIsGenreName.length; i++) {
					String genreName = whatIsGenreName[i];

					likeGenreDao.insert2(clientId, genreName);
				}

				resp.sendRedirect(req.getContextPath() + "/client/mypage.jsp");
			} else {
				likeGenreDao.delete(clientId);
				resp.sendRedirect(req.getContextPath() + "/client/mypage.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}

	}

}