package ottes.servlet.clientOtt;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientOttDao;
import ottes.beans.ClientOttDto;

@WebServlet(urlPatterns = "/mypage/client_ott_insert.svt")
public class ClientOttInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			ClientOttDto clientOttDto = new ClientOttDto();
			clientOttDto.setClinetId((String)req.getSession().getAttribute("login"));
			clientOttDto.setOttNo(Integer.parseInt(req.getParameter("ottNo")));
			
			ClientOttDao clientOttDao = new ClientOttDao();
			
			clientOttDao.insert(clientOttDto);
			
			resp.sendRedirect(req.getContextPath()+"/mypage/main.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
}
