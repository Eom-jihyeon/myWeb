package sample;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MyFirstServlet extends HttpServlet {
       
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset = UTF-8");
		PrintWriter out = response.getWriter();
		Date date = new Date();
		out.println("<html>");
		out.println("<body>");
		out.println("<My First Servlet Program!>");
		out.println("<br>");
		out.println(date.toString());
		out.println("</body>");
		out.println("</html>");
	}
}
