package ottes.servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import ottes.beans.MonthStatusDao;
import ottes.beans.MonthStatusDto;

@WebServlet(urlPatterns = "/ajax/joindateMonthChart.svt")
public class JoindateMonthChartServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int year = Integer.parseInt(req.getParameter("year"));
			
			MonthStatusDao monthStatusDao = new MonthStatusDao();
			List<MonthStatusDto> list = monthStatusDao.selectList(year);
			
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
