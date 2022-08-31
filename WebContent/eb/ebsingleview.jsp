<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*;"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Electricity View Records</title>
</head>
<body><form action="ebsingleview.jsp">
	<center><h1>Electricity View Records</h1></center>
	<br>
	<h2>Enter the Customer ID : <input type="text" name="custid" >&ensp;&ensp;<input type="submit" value="Check"></h2>
	</form>
	<%
	String id=request.getParameter("custid");
	if(id!=null)
	{
	try
	{
	int t=0;
	Class.forName("com.mysql.jdbc.Driver");
	Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/webadmin","root","");
	Statement s=c.createStatement();			
	ResultSet rs=s.executeQuery("select * from eb where cid="+id+"");
	
	%>
	
	<br><br>
	<table  border="1" align="center">
	
	<%	while(rs.next())
		{
		
			if(t==0)
			{ %>
			
			<tr><th>Customer ID</th><th>Customer Name</th><th>Gender</th><th>Address</th><th>Phone</th><th>Connection Type</th><th>Current Reading</th><th>Previous Reading</th><th>Actual Reading</th><th>Amount</th></tr>
			<%
			}
		
			String n=rs.getString(1);
			String i=rs.getString(2);
			String g=rs.getString(3);
			String a=rs.getString(4);
			String p=rs.getString(5);
			String cc=rs.getString(6);
			String cr=rs.getString(7);
			String pr=rs.getString(8);
			String ar=rs.getString(9);
			String m=rs.getString(10);
			t+=1;
		%>
			<tr>
			 <td><%=i%> </td>
			 <td><%=n%> </td>
			 <td><%=g%> </td>
			 <td><%=a%> </td>
			 <td><%=p%> </td>
			 <td><%=cc%> </td>
			 <td><%=cr%> </td>
			 <td><%=pr%> </td>
			 <td><%=ar%> </td>
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
	}
	
	%>
</body>
</html>