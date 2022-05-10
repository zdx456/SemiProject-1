package ottes.servlet.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ReviewDao;
import ottes.beans.ReviewDto;

@WebServlet(urlPatterns = "/contents/review_insert.svt")
//urlPatterns는 contents 파트와 협의 후 변경 가능
  
public class ReviewWriteServlet extends HttpServlet{
		
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 리뷰 번호 (reviewNo) +리뷰 내용(reviewContent) + 평점(reviewScore) + 컨텐츠 번호(contentsNo)
			// + 작성자 (로그인한 HttpSession)
			ReviewDto reviewDto = new ReviewDto();
			ReviewDao reviewDao = new ReviewDao();
			
			// reviewNo는 시퀀스 가져와서 사용
			reviewDto.setReviewNo(reviewDao.getSequence());
			
			reviewDto.setReviewContent(req.getParameter("reviewContent"));
			reviewDto.setReviewScore(Integer.parseInt(req.getParameter("reviewScore")));
			reviewDto.setContentsNo(Integer.parseInt(req.getParameter("contentsNo")));
			
			// writer은 로그인한 세션에서 사용
			reviewDto.setReviewWriter((String)req.getSession().getAttribute("login"));
			
			reviewDao.insert(reviewDto);
			
			// 리뷰 작성 후 컨텐츠 상세보기 페이지 그대로 돌아오기
			resp.sendRedirect("detail.jsp?contentsNo="+reviewDto.getContentsNo());
			
					
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	

}
