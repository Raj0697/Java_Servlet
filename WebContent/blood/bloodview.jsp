<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*;"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blood View Table</title>
</head>
<body>
<%
try
{
	int t=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/webadmin","root","");
	Statement s=c.createStatement();			
	String sq="select * from blood";
	ResultSet rs=s.executeQuery(sq);
	
	%>
	
	<br><br>
	<table border="1" border="1" align="center">
		

	<%	while(rs.next())
		{
		
			if(t==0)
			{ %>
			<h1>The Blood Record Details are :</h1>
			<br><br>
			<tr><th>Donor ID</th><th>Donor Name</th><th>Age</th><th>Gender</th><th>Blood Group</th><th>Mobile No</th></tr>
			<%
			}
		
			String i=rs.getString(1);
			String n=rs.getString(2);
			String a=rs.getString(3);
			String g=rs.getString(4);
			String p=rs.getString(5);
			String m=rs.getString(6);
			t+=1;
		%>
			<tr>
			 <td><%=i%> </td>
			 <td><%=n%> </td>
			 <td><%=a%> </td>
			 <td><%=g%> </td>
			 <td><%=p%> </td>
			 <td><%=m%> </td>
			</tr>
		<%
		} 

		if(t==0)
		{
			%>
			
			<center><h1> No Record is found</h1></center>
						
			<%
		}
}
catch(Exception e)
{
	out.print(e.getMessage());
}

%>


</body>
</html>