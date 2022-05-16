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
		"/inquiry/*",
		"/mypage/*",
		"/client/exit_finish.jsp",
		"/client/exit.jsp",
		"/client/information.jsp",
		"/client/mypage.jsp",
		"/client/password.jsp",
		"/client/password.jsp",
		"/client/exit.kh",
		"/client/information.kh",
		"/client/logout.svt",
		"/contents/review_insert.svt",
		"/contents/review_edit.svt",
		"/contents/review_delete.svt"
})
public class LoginClientFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			String ClientId = (String) req.getSession().getAttribute("login");
			
			if(ClientId == null) {
				resp.sendRedirect(req.getContextPath()+ "/client/login.jsp");	
			}
			else {
				chain.doFilter(request, response);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
