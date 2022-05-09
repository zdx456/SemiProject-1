package ottes.filter;

import javax.servlet.Filter;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebFilter(urlPatterns = "/*")
public class LoginTestFilter implements Filter{
	
	public void doFilter(javax.servlet.ServletRequest request, javax.servlet.ServletResponse response, javax.servlet.FilterChain chain) throws java.io.IOException ,javax.servlet.ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		req.getSession().setAttribute("login", "testuser");
		req.getSession().setAttribute("auth", "관리자");
		
		chain.doFilter(request, response);
		 
	};
}
