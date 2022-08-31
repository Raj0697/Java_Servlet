

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class getcookielogin
 */
public class getcookielogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getcookielogin() {
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
		
		//p.print("Hello World");
		Cookie c1[]=rq.getCookies();
		Cookie c2[]=rq.getCookies();
		if(!c1[0].getValue().equals("") && !c2[0].getValue().equals("") )
		{
			RequestDispatcher r=rq.getRequestDispatcher("profile.html");
			r.include(rq,rp);
			p.print("<h2>Cookie Information</h2>");
			p.print("Cookie Name :: "+c1[0].getName());
			p.print("<br>");
			p.print("Cookie Value :: "+c1[0].getValue());
			p.print("<br>");
			p.print("Cookie Name :: "+c2[1].getName());
			p.print("<br>");
			p.print("Cookie Value :: "+c2[1].getValue());
			p.close();
			
		}
		else
		{
			RequestDispatcher r=rq.getRequestDispatcher("login.html");
			r.include(rq,rp);
		}
		
		
	}

}
