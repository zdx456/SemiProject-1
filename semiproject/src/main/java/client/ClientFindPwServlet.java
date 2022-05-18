package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;

@WebServlet(urlPatterns = "/client/find_pw.kh")
public class ClientFindPwServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//System.out.println("ClientFindIdServlet >> client/find_pw.kh ");		
			req.setCharacterEncoding("UTF-8");
			ClientDto clientDto = new ClientDto();
			clientDto.setClientId(req.getParameter("clientId"));
			clientDto.setClientNick(req.getParameter("clientNick"));
			clientDto.setClientBirth(req.getParameter("clientBirth"));
			clientDto.setClientEmail(req.getParameter("clientEmail"));		
			ClientDao clientDao = new ClientDao();
			String clientId = clientDao.findPw(clientDto);
			//System.out.println("clinetid="+clientId);
			
			if (!clientId.equals("")) {
			    resp.sendRedirect("set_pw.jsp");
			    req.getSession().setAttribute("clientId", clientId);
			}
			else {
			    resp.sendRedirect("find_pw.jsp?error");
			}
 
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}