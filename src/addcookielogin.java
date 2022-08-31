

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addcookielogin
 */
public class addcookielogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addcookielogin() {
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
	protected void doPost(HttpServletRequest rq, HttpServletResponse rp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
				rp.setContentType("text/html");
				PrintWriter p=rp.getWriter();
				String name=rq.getParameter("nam");
				String pass=rq.getParameter("pwd");
				
				if(name.equals("admin")&&pass.equals("admin"))
				{
					RequestDispatcher r=rq.getRequestDispatcher("profile.html");
					r.include(rq,rp);
					p.println();
					p.println();
					//p.println("Hello "+name+"<br/>Your Password is "+pass );
					//Add the cookie here
					Cookie c1=new Cookie("Name",name);
					Cookie c2=new Cookie("Password",pass);
					rp.addCookie(c1);
					rp.addCookie(c2);
					//p.print("<br>");
					//p.print("<a href=getcookielogin>Get the Cookie </a>");
					//p.print("<br>");
					//p.print("<a href=cookiedelete>Log out</a>");
					
				}
				else
				{
				
					RequestDispatcher r=rq.getRequestDispatcher("login.html");
					r.include(rq,rp);
					p.println("<br>");
					p.println("<br>");
					p.print("<center><h3 style=color:red;>UnAuthorized Access Denied !!!</h3><center>");
				}
				p.close();
				
	}

}
