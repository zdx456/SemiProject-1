package ottes.servlet.adminClient;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;


@WebServlet(urlPatterns = "/adminClient/chg_pw.svt")
public class ClientChgPwServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			String clientId = req.getParameter("clientId");
			String clientPw = req.getParameter("clientPw");
			
			//처리
			ClientDao clientDao = new ClientDao();
			clientDao.changePassword(clientId, clientPw);
			
			//출력
			resp.sendRedirect("client_chgPw_finish.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
