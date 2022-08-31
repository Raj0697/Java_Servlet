<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*;"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EB Bill Insert</title>
</head>
<body>
<h1>Electricity Billing System</h1><br>

<%
	int t=0;
	String name=request.getParameter("custn");
	String id=request.getParameter("custi");
	String gen=request.getParameter("gen");
	String add=request.getParameter("add");
	String phno=request.getParameter("phno");
	String cat=request.getParameter("etype");
	String read=request.getParameter("read");
	String pre=request.getParameter("pre");
	String act=request.getParameter("act");
	String amt=request.getParameter("amt");

	
	out.print("The Customer Name : "+name);
	out.print("<br>");
	out.print("The Customer ID : "+id);
	out.print("<br>");
	out.print("Gender : "+gen);
	out.print("<br>");
	out.print("Address : "+add);
	out.print("<br>");
	out.print("Phone No. : "+phno);
	out.print("<br>");
	out.print("Connection Type : "+cat);
	out.print("<br>");
	out.print("Current Reading : "+read);
	out.print("<br>");
	out.print("Previous Reading : "+pre);
	out.print("<br>");
	out.print("Actual Reading : "+act);
	out.print("<br>");
	out.print("Amt : "+amt);
	out.print("<br><br>");
	
	if(name!=null&&id!=null&&gen!=null&&add!=null&&phno!=null&&cat!=null&&read!=null&&amt!=null&&pre!=null&&act!=null)
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/webadmin","root","");
			Statement s=c.createStatement();
			ResultSet rs=s.executeQuery("select * from eb where cid="+id+"");
			
			while(rs.next())
			{
				t=1;
			}
			
			if(t==0)
			{
				s.executeUpdate("insert into eb values ('"+name+"',"+id+",'"+gen+"','"+add+"',"+phno+",'"+cat+"',"+read+","+pre+","+act+","+amt+") ");
				s.close();
				c.close();
				out.print(" Sccessfully Registered ");
			}
			else
			{
				s.executeUpdate("update eb set cname='"+name+"',gender='"+gen+"',address='"+add+"',phone="+phno+",category='"+cat+"',cread="+read+",pread="+pre+",aread="+act+",amt="+amt+" where cid="+id+" ");
				s.close();
				c.close();
				out.print(" Sccessfully Changed ");
			}
					
		}
		catch(Exception e)
		{
			out.print(e.getMessage());
		}
		
	}

%>
</body>
</html>