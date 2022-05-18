package ottes.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ReviewDao;
import ottes.beans.ReviewDto;

@WebServlet(urlPatterns = "/contents/review_edit.svt")
//urlPatterns는 contents 파트와 협의 후 변경 가능

public class ReviewEditServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			ReviewDto reviewDto = new ReviewDto();
			reviewDto.setReviewNo(Integer.parseInt(req.getParameter("reviewNo")));
			reviewDto.setContentsNo(Integer.parseInt(req.getParameter("contentsNo")));
			reviewDto.setReviewScore(Integer.parseInt(req.getParameter("reviewScore")));
			reviewDto.setReviewContent(req.getParameter("reviewContent"));

			ReviewDao reviewDao = new ReviewDao();
			boolean success = reviewDao.update(reviewDto);

			if (success) {
				// 수정 성공 시 컨텐츠 상세 페이지 그대로 유지
				resp.sendRedirect(req.getContextPath()+"/contents/detail.jsp?contentsNo=" + reviewDto.getContentsNo());
			} else {
				resp.sendError(404);
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
