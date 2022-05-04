package ottes.servlet.adminContents;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ContentsDao;
import ottes.beans.ContentsDto;

@WebServlet(urlPatterns = "/adminContents/insert.svt")
public class ContentsInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setRegionName(req.getParameter("regionName"));
			contentsDto.setGenreName(req.getParameter("genreName"));
			contentsDto.setContentsTitle(req.getParameter("contentsTitle"));
			contentsDto.setContentsGrade(req.getParameter("contentsGrade"));
			contentsDto.setContentsTime(Integer.parseInt(req.getParameter("contentsTime")));
			contentsDto.setContentsDirector(req.getParameter("ContentsDirector"));
			contentsDto.setContentsSummary(req.getParameter("ContentsSummary"));
			
			//처리
			ContentsDao contentsDao = new ContentsDao();
			contentsDto.setContentsNo(contentsDao.getSequence());
			contentsDao.insert(contentsDto);
			
			//출력
			resp.sendRedirect(req.getContextPath()+"/adminContents/detail.jsp?contentsNo=" + contentsDto.getContentsNo());
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
