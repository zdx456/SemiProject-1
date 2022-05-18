package ottes.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ContentsDao;
import ottes.beans.ReviewDao;

@WebServlet(urlPatterns = "/contents/review_delete.svt")
//urlPatterns는 contents 파트와 협의 후 변경 가능

public class ReviewDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			int reviewNo = Integer.parseInt(req.getParameter("reviewNo"));
			int contentsNo = Integer.parseInt(req.getParameter("contentsNo"));

			ReviewDao reviewDao = new ReviewDao();
			boolean success = reviewDao.delete(reviewNo);

			if (success) {
				// 성공 시 컨텐츠 상세 페이지 그대로 유지
				resp.sendRedirect(req.getContextPath()+"/contents/detail.jsp?contentsNo=" + contentsNo);

			} else {
				resp.sendError(404);
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
