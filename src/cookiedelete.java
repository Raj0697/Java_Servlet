

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class cookiedelete
 */
public class cookiedelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cookiedelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter p=response.getWriter();
		try
		{
		response.setContentType("text/html");
		Cookie c1=new Cookie("Name","");
		Cookie c2=new Cookie("Password","");
		response.addCookie(c1);
		response.addCookie(c2);
		c1.setMaxAge(0);
		c2.setMaxAge(0);
		RequestDispatcher r1=request.getRequestDispatcher("getcookielogin");
		r1.include(request,response);
		p.print("<br><h2>The Cookie is Cleared </h2><br>");
		}
		catch(Exception e)
		{
			p.print(e.getMessage());
		}
		p.close();
		
	}
	

}
