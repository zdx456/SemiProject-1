package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;

@WebServlet(urlPatterns = "/client/information.kh")
public class ClientInformationServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			ClientDto clientDto = new ClientDto();
			clientDto.setClientId((String) req.getSession().getAttribute("login"));
			clientDto.setClientNick(req.getParameter("clientNick"));
			clientDto.setClientGender(req.getParameter("clientGender"));
			clientDto.setClientBirth(req.getParameter("clientBirth"));
			clientDto.setClientEmail(req.getParameter("clientEmail"));
			clientDto.setClientPw(req.getParameter("clientPw"));
			ClientDao clientDao = new ClientDao();
			ClientDto findDto = clientDao.selectOne(clientDto.getClientId());
			boolean isPasswordCorrect = clientDto.getClientPw().equals(findDto.getClientPw());

			if (!isPasswordCorrect) {
				resp.sendRedirect("information.jsp?error");
				return;
			}
			clientDao.chgInfoClient(clientDto);
			resp.sendRedirect("mypage.jsp");
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
