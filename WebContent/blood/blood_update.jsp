<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blood Update Management</title>
</head>
<body>
<form action="blood_update.jsp" method="get">
	<center><h1>Blood Update Management</h1></center>
	<br>
	<h3>Enter the Donor ID : <input type="text" name="id"></h3><input type="submit" value="Check" />
</form>
	<%
		String id=request.getParameter("id");
		
		if(id!=null)
		{	
			try
			{
			int t=0;
			Class.forName("com.mysql.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/webadmin","root","");
			Statement s=c.createStatement();			
			
			String sq="select * from blood where D_id="+id+"";
			ResultSet rs=s.executeQuery(sq);
			%>
			<!-- <table border="1" border="1" align="center">  -->
			<%	while(rs.next())
				{			
					String i=rs.getString(1);
					String n=rs.getString(2);
					String a=rs.getString(3);
					String g=rs.getString(4);
					String p=rs.getString(5);
					String m=rs.getString(6);
					t=1;
				%>
					<h1>The Blood Record Details :</h1>
					<br><br>				 
				    <form name="frm" action="blood_insert.jsp" method="post" ><center>
					<br><h1>Online Blood Banking</h1>
					<br>
					<table>
					<tr><td>Donor ID : </td><td><input type="text" name="d_id" id=""  value="<%=i%>"/> </td></tr>
					<tr><td>Donor Name : </td><td><input type="text" name="d_n" id="d_n" value="<%=n%>"/></td></tr>
					<tr><td>Age : </td><td><input type="text" name="age" id="age" value="<%=a%>" /></td></tr>
					<tr><td>Gender : </td><td><input type="radio" name="gender" id="m" value="Male" <% if(g.equals("Male")) { %> Checked <% } %> >Male  
					<input type="radio" name="gender" value="Female" id="f" <% if(g.equals("Female")) { %> Checked <% } %> />Female</td></tr>
					<tr><td>Blood Group :  </td><td>
					<select name="group" id="group" >
					<option value="A+"  <% if(p.equals("A+")) { %> selected <% } %> >A + </option>
					<option value="A-"  <% if(p.equals("A-")) { %> selected <% } %> >A - </option>
					<option value="B+"  <% if(p.equals("B+")) { %> selected <% } %> >B + </option>
					<option value="B-"  <% if(p.equals("B-")) { %> selected <% } %> >B - </option>
					<option value="AB+" <% if(p.equals("AB+")) { %> selected <% } %> >AB + </option>
					<option value="AB-" <% if(p.equals("AB-")) { %> selected <% } %> >AB - </option>
					<option value="O+"  <% if(p.equals("O+")) { %> selected <% } %> >O + </option>
					<option value="O-"  <% if(p.equals("O-")) { %> selected <% } %> >O - </option>
					</select>
					</td></tr>
					<tr><td>Phone no: </td><td><input type="text" name="phno" value="<%=m%>" ></td></tr>
					<tr><td><br></td></tr>
					<tr align="center"><td><input type="submit" value="submit" /></td><td><input type="reset" value="Reset" /></td></tr>
					
					</table></center>
					<br><br>
					<a href="bloodview.jsp"><input type="button" value="Records" /></a>
					
					</form>
				 
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