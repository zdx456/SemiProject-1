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

@WebFilter(filterName="f3", urlPatterns = {
		"/adminClient/*",
		"/adminContents/detail.jsp",
		"/adminContents/edit.jsp",
		"/adminContents/insert.jsp",
		"/adminContents/list.jsp",
		"/adminContents/delete.svt",
		"/adminContents/edit.svt",
		"/adminContents/insert.svt",		
		"/adminStats/*", 
		"/ott/*"
})
public class AdminMenuFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		try {
			String clientGrade = (String) req.getSession().getAttribute("auth");
			System.out.println(clientGrade);
			
			if(clientGrade == null) {
				resp.sendRedirect(req.getContextPath()+ "/client/login.jsp");	
			}
			else if(clientGrade.equals("관리자")) {
				chain.doFilter(request, response);
			} else {
				resp.sendRedirect(req.getContextPath()+ "/client/login.jsp");	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
