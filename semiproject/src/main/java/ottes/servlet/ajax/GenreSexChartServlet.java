package ottes.servlet.ajax;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import ottes.beans.StatsDao;
import ottes.beans.StatsDto;

@WebServlet(urlPatterns = "/ajax/genreSexChart.svt")
public class GenreSexChartServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			StatsDao statsDao = new StatsDao();
			List<StatsDto> list = statsDao.genreSex();
			
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
