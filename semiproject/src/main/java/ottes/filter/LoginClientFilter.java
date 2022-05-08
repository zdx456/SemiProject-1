package ottes.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName="f2", urlPatterns = {
		"/exam/*",
		"/score/*",
		"/product/*",
		"/Client/password.jsp", "/Client/password.kh",
		"/Client/information.jsp", "/Client/information.kh",
		"/Client/exit.jsp", "/Client/exit.kh",
		"/board/write.jsp", "/board/write.kh",
		"/board/edit.jsp", "/board/edit.kh",
		"/board/delete.kh",
		"/board/reply_insert.kh",
		"/board/reply_edit.kh",
		"/board/reply_delete.kh"
})
public class LoginClientFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			//세션 검사
			String ClientId = (String) req.getSession().getAttribute("login");

			if(ClientId == null) {
				//로그인 페이지로 강제 이동 처리
				//resp.sendError(401); //401(Unauthorize - 미인증)
			}
			else {
				//chain.doFilter(req, resp);
				chain.doFilter(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
