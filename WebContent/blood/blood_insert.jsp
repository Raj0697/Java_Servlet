<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*;"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blood Data Inserted</title>
</head>
<body>
			<%
				int t=0;
				String did=request.getParameter("d_id");
				String dname=request.getParameter("d_n");
				String age=request.getParameter("age");
				String gen=request.getParameter("gender");
				String dg=request.getParameter("group");
				String ph=request.getParameter("phno");
						
				if(did!=null&&dname!=null&&age!=null&&gen!=null&&dg!=null&&ph!=null)
				{
					try
					{
						Class.forName("com.mysql.jdbc.Driver");
						Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/webadmin","root","");
						Statement s=c.createStatement();
						ResultSet rs=s.executeQuery("select * from blood where D_id="+did+"");
						while(rs.next())
						{
							t+=1;
						}
						if(t==0)
						{
							s.executeUpdate("insert into blood values ("+did+",'"+dname+"',"+age+",'"+gen+"','"+dg+"',"+ph+") ");	
							s.close();
							c.close();
							out.print(" Sccessfully Registered ");
						
						}
						else
						{
							s.executeUpdate("update blood set D_name='"+dname+"',age="+age+",gender='"+gen+"',grp='"+dg+"',phno="+ph+" where D_id="+did+"");
							s.close();
							c.close();
							out.print(" Sccessfully Changed ");
						}
							
				
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					
					
					out.print("The Donor ID :  "+did);
					out.print("<br>");
					out.print("The Donor Name : "+dname);
					out.print("<br>");
					out.print("The Age is : "+age);
					out.print("<br>");
					out.print("Gender is : "+gen);
					out.print("<br>");
					out.print("The Blood Group : "+dg);
					out.print("<br>");
					out.print("The Phone no : "+ph);
					out.print("<br>");
					out.print("<br>");
					
					
				}
				
			%>
</body>
</html>