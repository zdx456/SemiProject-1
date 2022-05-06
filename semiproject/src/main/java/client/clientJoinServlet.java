package client;


import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;



@WebServlet(urlPatterns = "/Client/join.ott")
public class clientJoinServlet extends HttpServlet{
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         
         ClientDto clientDto = new ClientDto();
         clientDto.setClientId(req.getParameter("clientId"));
         clientDto.setClientPw(req.getParameter("clientPw"));
         clientDto.setClientNick(req.getParameter("clientNick"));
         clientDto.setClientNick(req.getParameter("clientNick"));
         clientDto.setClientBirth(req.getParameter("clientBirth"));
         clientDto.setClientEmail(req.getParameter("clientEmail"));
         
         //처리
         ClientDao clientDao = new ClientDao();
         clientDao.insert(clientDto);
         
         
         //출력
         resp.sendRedirect(req.getContextPath()+"/Client/join_finish.jsp");
      }
      catch(Exception e) {
         e.printStackTrace();
         resp.sendError(500);
      }
   }
}