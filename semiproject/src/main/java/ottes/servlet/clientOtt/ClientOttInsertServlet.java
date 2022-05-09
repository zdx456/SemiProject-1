package ottes.servlet.clientOtt;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ottes.beans.ClientOttDao;

@WebServlet(urlPatterns = "/mypage/client_ott_insert.svt")
public class ClientOttInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String clientId = (String)req.getSession().getAttribute("login");
			
			//배열로 받기! 체크박스 값 여러개 가능 하므로
			String [] ottNoStr = req.getParameterValues("ottNo") ;
			
			// String 배열은 int 배열로 변환 (stream 이용)
			int [] ottNoArray = Arrays.stream(ottNoStr).mapToInt(Integer::parseInt).toArray();
			
			ClientOttDao clientOttDao = new ClientOttDao();
			
			clientOttDao.delete(clientId);
			
			for(int i = 0; i < ottNoArray.length; i++) {
				int ottNo = ottNoArray[i];
				
				clientOttDao.insert(clientId, ottNo);
			}
			
			
			resp.sendRedirect(req.getContextPath()+"/mypage/main.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	
	}
}
