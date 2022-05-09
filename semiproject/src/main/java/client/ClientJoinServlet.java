package client;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;



@WebServlet(urlPatterns = "/client/join.kh")
public class ClientJoinServlet extends HttpServlet{
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	   
      try {
    	  req.setCharacterEncoding("UTF-8");
         ClientDto clientDto = new ClientDto();
         clientDto.setClientId(req.getParameter("clientId"));
         clientDto.setClientPw(req.getParameter("clientPw"));
         clientDto.setClientNick(req.getParameter("clientNick"));
         clientDto.setClientGender(req.getParameter("clientGender"));
         clientDto.setClientBirth(req.getParameter("clientBirth"));
         clientDto.setClientEmail(req.getParameter("clientEmail"));
        
         ClientDao clientDao = new ClientDao();
         clientDao.insert(clientDto);

         resp.sendRedirect(req.getContextPath()+"/client/join_finish.jsp");
      }
      catch(Exception e) {
         e.printStackTrace();
         resp.sendError(500);
      }
   }
}