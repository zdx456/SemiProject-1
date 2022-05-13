package client;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/client/idCheckServlet")
    public class IdCheckServlet extends HttpServlet {
         protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             String id = request.getParameter("id");
             PrintWriter out = response.getWriter();
             if(id.equals("clientId")) {
                 out.print("fail");
             }else {
                 out.print("success");
             }
             
             
             
        
        }
   }