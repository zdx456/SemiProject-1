package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;


@WebServlet(urlPatterns = "/client/find_id.kh")
public class ClientFindIdServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//System.out.println("ClientFindIdServlet >> client/find_id.kh ");			
			req.setCharacterEncoding("UTF-8");
			ClientDto clientDto = new ClientDto();
			clientDto.setClientNick(req.getParameter("clientNick"));
			clientDto.setClientEmail(req.getParameter("clientEmail"));	
			clientDto.setClientBirth(req.getParameter("clientBirth"));
			
			ClientDao clientDao = new ClientDao();
			String clientId = clientDao.findId(clientDto);			
			if(clientId == null) {
				resp.sendRedirect("find_id.jsp?error");
			}
			else {
				resp.sendRedirect("find_id_result.jsp?clientId="+clientId);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}