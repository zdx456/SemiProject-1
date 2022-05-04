package ottes.servlet.ott;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.OttDao;
import ottes.beans.OttDto;

@WebServlet(urlPatterns = "/ott/insert.svt") //주소
public class OttInsertServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//ott 생성 서블릿 (생성.jsp -> servlet)
		try {
			OttDto ottDto = new OttDto();
			
			ottDto.setOttName(req.getParameter("ottName"));
			ottDto.setOttPrice(Integer.parseInt(req.getParameter("ottPrice")));
			
			OttDao ottDao = new OttDao();
			ottDto.setOttNo(ottDao.getSequence()); //ott 번호 시퀀스 
			
			ottDao.insert(ottDto);
			
			resp.sendRedirect(req.getContextPath()+"/ott/list.jsp");
			// ott 목록으로 돌아가기!
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
