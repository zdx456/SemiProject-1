package ottes.servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import ottes.beans.OttContentsStatusDao;
import ottes.beans.OttContentsStatusDto;

@WebServlet(urlPatterns = "/ajax/OttContentsChart.svt")
public class OttContentsChartServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			OttContentsStatusDao ottContentsStatusDao = new OttContentsStatusDao();
			List<OttContentsStatusDto> list = ottContentsStatusDao.selectList();
			
			ObjectMapper mapper = new ObjectMapper();
			resp.setContentType("application/json; charset=UTF-8");
			resp.getWriter().print(mapper.writeValueAsString(list));
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
}
