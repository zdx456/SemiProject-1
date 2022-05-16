package ottes.servlet.ott;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.OttDao;
import ottes.beans.OttDto;

@WebServlet(urlPatterns = "/ott/update.svt") // 5/4 3:18 오타 수정 ㅠㅠ
public class OttUpdateServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ott 수정 (목록에서 바로 수정하는 걸로)
		try {
			
			OttDto ottDto = new OttDto();
			ottDto.setOttNo(Integer.parseInt(req.getParameter("ottNo")));
			ottDto.setOttName(req.getParameter("ottName"));
			ottDto.setOttPrice(Integer.parseInt(req.getParameter("ottPrice")));
			
			OttDao ottDao = new OttDao();
			
			boolean success = ottDao.update(ottDto);
			
			if(success) {
				resp.sendRedirect(req.getContextPath()+"/ott/list.jsp");
				//성공시 목록으로 이동!
			} else {
				resp.sendError(404);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
}
