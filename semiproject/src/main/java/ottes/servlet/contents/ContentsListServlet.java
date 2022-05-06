package ottes.servlet.contents;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ContentsDao;
import ottes.beans.ContentsDto;


@WebServlet(urlPatterns = "/contents/list.svt")
public class ContentsListServlet extends HttpServlet {
	
	// 컨텐츠 테이블의 전체 목록 출력하는 서블릿
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			ContentsDao contentsDao = new ContentsDao();
			List<ContentsDto> list = contentsDao.selectList();
			
			for(ContentsDto contentsDto : list) {
				resp.getWriter().println(contentsDto);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			resp.sendError(500);
		}
	}
	
	 

}
