package ottes.servlet.adminClient;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;


@WebServlet(urlPatterns = "/adminClient/edit.svt")
public class ClientEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			//준비
			ClientDto clientDto = new ClientDto();
			
			clientDto.setClientNick(req.getParameter("clientNick"));
			clientDto.setClientGender(req.getParameter("clientGender"));
			clientDto.setClientGrade(req.getParameter("clientGrade"));
			clientDto.setClientBirth(req.getParameter("clientBirth")); 
			clientDto.setClientEmail(req.getParameter("clientEmail"));
			clientDto.setClientId(req.getParameter("clientId"));
			
			//처리
			ClientDao clientDao = new ClientDao();
			boolean isSuccess = clientDao.chgInfoAdmin(clientDto);
			
			if(isSuccess) {
				resp.sendRedirect("client_detail.jsp?clientId=" + clientDto.getClientId()); 
			}
			else {
				resp.sendError(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
		
	}
}
