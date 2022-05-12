package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;


@WebServlet(urlPatterns = "/checkId.kh")
public class ClientIdCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String clientId = req.getParameter("clientId");
			ClientDao clientDao = new ClientDao();
			ClientDto clientDto = clientDao.selectOne(clientId);
			resp.setContentType("text/plain; charset=UTF-8");
			if(clientDto != null) {
				resp.getWriter().print("no");
			}
			else {
				resp.getWriter().print("yes");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
