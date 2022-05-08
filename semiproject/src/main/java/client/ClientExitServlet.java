package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;


@WebServlet(urlPatterns = "/client/exit.kh")
public class ClientExitServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {			
			req.setCharacterEncoding("UTF-8");
			String clientId = (String)req.getSession().getAttribute("login");
			String clientPw = req.getParameter("clientPw");					
			ClientDao clientDao = new ClientDao();
			ClientDto clientDto = clientDao.selectOne(clientId);
			boolean isPasswordCorrect = clientPw != null && clientPw.equals(clientDto.getClientPw());
			if(!isPasswordCorrect) {
				resp.sendRedirect("exit.jsp?error");
				return;
			}			
			clientDao.deleteClient(clientId,clientPw);				
			req.getSession().removeAttribute("login");
			req.getSession().removeAttribute("auth");			
			resp.sendRedirect("exit_finish.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}







