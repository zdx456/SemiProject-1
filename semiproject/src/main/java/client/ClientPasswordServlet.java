package client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientDao;
import ottes.beans.ClientDto;


@WebServlet(urlPatterns = "/client/password.kh")
public class ClientPasswordServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//준비
			req.setCharacterEncoding("UTF-8");
			String currentPw = req.getParameter("currentPw");
			String changePw = req.getParameter("changePw");
			
			String clientId = (String) req.getSession().getAttribute("login");
			
			//처리
			//1. 기존 비밀번호와 변경할 비밀번호가 일치하는지 검사
			boolean isSamePassword = currentPw == null || changePw == null || currentPw.equals(changePw);
			if(isSamePassword) {
				resp.sendRedirect("password.jsp?error=1");
				return;
			}
			
			//2. 현재 비밀번호가 DB의 비밀번호와 일치하는지 검사
			ClientDao clientDao = new ClientDao();
			ClientDto clientDto = clientDao.selectOne(clientId);
			
			boolean isCorrectPassword = currentPw.equals(clientDto.getClientPw());
			if(!isCorrectPassword) {
				resp.sendRedirect("password.jsp?error=2");
				return;
			}
			
			clientDao.changePassword(clientId, changePw);
			
			resp.sendRedirect("mypage.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}

