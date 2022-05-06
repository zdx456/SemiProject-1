package ottes.servlet.adminClient;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;

@WebServlet(urlPatterns = "/adminClient/list.svt")
public class AdminListServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			ClientDao clientDao = new ClientDao();
			List<ClientDto> list =  clientDao.select();
			
			resp.setContentType("text/plain; charset=UTF-8");
			for(ClientDto clientDto : list) {
				resp.getWriter().println(clientDto);
			}

			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
