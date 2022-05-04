package ottes.servlet.adminContents;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ContentsDao;
import ottes.beans.ContentsDto;

@WebServlet(urlPatterns = "/admin/edit.svt")
public class ContentsEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			ContentsDto contentsDto = new ContentsDto();
			contentsDto.setRegionNo(Integer.parseInt(req.getParameter("regionNo")));
			contentsDto.setGenreNo(Integer.parseInt(req.getParameter("genreNo")));
			contentsDto.setContentsTitle(req.getParameter("contentsTitle"));
			contentsDto.setContentsGrade(req.getParameter("contentsGrade"));
			contentsDto.setContentsTime(Integer.parseInt(req.getParameter("contentsTime")));
			contentsDto.setContentsDirector(req.getParameter("ContentsDirector"));
			contentsDto.setContentsSummary(req.getParameter("ContentsSummary"));
			
			contentsDto.setContentsNo(Integer.parseInt(req.getParameter("contentsNo")));
			
			//처리
			ContentsDao contentsDao = new ContentsDao();
			boolean isSuccess = contentsDao.update(contentsDto);
			
			//출력
			if(isSuccess) {
				resp.sendRedirect(req.getContextPath() + "/adminContents/detail.jsp?contentsNo=" + contentsDto.getContentsNo());
			}
			else {
				resp.sendError(404);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
