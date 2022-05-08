package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;

@WebServlet(urlPatterns = "/client/set_pw.kh")
public class ClientSetPwServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
			req.setCharacterEncoding("UTF-8");
			String clientId = req.getParameter("clientId");
			String clientPw = req.getParameter("clientPw");	
			ClientDao clientDao = new ClientDao();
			clientDao.changePassword(clientId, clientPw);
			req.getSession().invalidate();		
			resp.sendRedirect("set_finish.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
