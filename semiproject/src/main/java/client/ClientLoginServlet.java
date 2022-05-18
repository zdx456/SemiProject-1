package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;



@WebServlet(urlPatterns = "/client/login.kh")
public class ClientLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			req.setCharacterEncoding("UTF-8");
			String clientId = req.getParameter("clientId");
			String clientPw = req.getParameter("clientPw");
			
			
			ClientDao clientDao = new ClientDao();	
			ClientDto clientDto = clientDao.selectOne(clientId);						
			boolean isLogin = clientDto != null && clientDto.getClientPw().equals(clientPw);			
			
			if(isLogin) {
				clientDao.updateLogindate(clientId);
				req.getSession().setAttribute("login", clientId);				
				req.getSession().setAttribute("auth", clientDto.getClientGrade());
				
				resp.sendRedirect(req.getContextPath());
			}
			else {
				resp.sendRedirect("login.jsp?error");
			} 
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}