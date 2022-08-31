

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class product_data
 */
public class product_data extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public product_data() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest rs, HttpServletResponse rp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		PrintWriter p =rp.getWriter();
		try {
		
				rp.setContentType("text/html");
								
				String na=rs.getParameter("nam");
				String ag=rs.getParameter("age");
				String ge=rs.getParameter("gen");
				String ad=rs.getParameter("add");
				String ph=rs.getParameter("phno");
				String pr=rs.getParameter("pro");
				
				p.println("<br>The Product Details are:  ");
				p.println("<br><br>");
				p.println("The Name : "+na);
				p.println("<br>The Age  : "+ag);
				p.println("<br>The Gender : "+ge);
				p.println("<br>The Address : "+ad);
				p.println("<br>The Phone No : "+ph);
				p.println("<br>The Product : "+pr);
				
				if(na!=null&&ag!=null&&ge!=null&&ad!=null&&ph!=null&&pr!=null)
				{
					Class.forName("com.mysql.jdbc.Driver");
					Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/webadmin","root","");
					Statement s=c.createStatement();
					p.print("<br><br>");
					s.executeUpdate("insert into store values('"+na+"','"+ag+"','"+ge+"','"+ad+"',"+ph+",'"+pr+"')");
					p.println("<br><br>The Details are Uploaded Successfully");
				}
				else
				{
					p.print("The Connection is failed ");
				}
				
				
		} catch (Exception e) {
			// TODO Auto-generated catch block
			p.print(e.getMessage());
		}	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
