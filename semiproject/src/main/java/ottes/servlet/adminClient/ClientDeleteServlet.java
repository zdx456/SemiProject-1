package ottes.servlet.adminClient;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;

@WebServlet(urlPatterns = "/adminClient/delete.svt")
public class ClientDeleteServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			String clientId = req.getParameter("clientId");
			
			ClientDao clientDao = new ClientDao();
			clientDao.deleteAdmin(clientId);
			
			resp.sendRedirect("client_list.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
