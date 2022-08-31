<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Electricity Billing System</title>
<script type="text/javascript">

function test()
{
		var t1=parseInt(document.getElementById("read").value);
		var t2=parseInt(document.getElementById("pre").value);
		var t=t1-t2;
		document.getElementById("act").value=t;
		var c=document.getElementById("etype").value;
		
		var dd="Domestic";
		var cc="Commercial";
		var p=0;
		
		if(t<=100&&t>=0)
		{
			if(c==dd)
			{
				p=t*1;
			}
			else if(c==cc)
			{
				p=t*2;
			}
			else
			{
				p=t*3;
			}	
		}
		else if(t<=101&&t>=200)
		{
			
			if(c==dd)
			{
				p=t*1.25;
			}
			else if(c==cc)
			{
				p=t*2.50;
			}
			else
			{
				p=t*3.75;
			}	
		}
		else if(t>=200)
		{
			
			if(c==dd)
			{
				p=t*2;
			}
			else if(c==cc)
			{
				p=t*4;
			}
			else
			{
				p=t*6;
			}	
		}
		document.getElementById("amt").value=p;
}

</script>
</head>
<body onload="star()">
		<br><br><form name="frm" action="ebupdate.jsp" method="post">
			<center><h1>Electricity Billing System Update Manipulation </h1></center>
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
			
			String sq="select * from eb where cid="+id+"";
			ResultSet rs=s.executeQuery(sq);
				while(rs.next())
				{
					
				t=1;
				String n=rs.getString(1);
				String i=rs.getString(2);
				String g=rs.getString(3);
				String a=rs.getString(4);
				String p=rs.getString(5);
				String ct=rs.getString(6);
				String cr=rs.getString(7);
				String pr=rs.getString(8);
				String ar=rs.getString(9);
				String m=rs.getString(10);
				
				%>
				<form action="ebinsert.jsp" method="get">
				<h1>The EB Customer Record Details :</h1>
				<br><br>
				<table align="center">
				<tr><td>Customer Name</td><td><input type="text" name="custn" value="<%=n%>" /></td></tr>
				<tr><td>Customer ID</td><td><input type="text" name="custi" value="<%=i%>" readonly /></td></tr>
				<tr><td>Gender</td><td><input type="radio" value="male" name="gen" <% if(g.equals("male")) { %> Checked <% } %> />Male&ensp;&ensp;
				<input type="radio" value="female" name="gen" <% if(g.equals("female")) { %> Checked <% } %> />Female
				</tr>
				<tr>
				<td>Address</td><td><textarea name="add"><%=a%></textarea></td>
				</tr>
				<tr><td>Phone</td><td><input type="text" name="phno" value="<%=p%>"/></td></tr>
				<tr><td>Category</td><td>
				<select name="etype" id="etype">
				<option value="Domestic" <% if(g.equals("Domestic")) { %> selected <% } %> >Domestic</option>
				<option value="Commercial" <% if(g.equals("Commercial")) { %> selected <% } %> >Commercial</option>
				<option value="Industrial" <% if(g.equals("Industrial")) { %> selected <% } %> >Industrial</option>
				</select>
				</td></tr>
				<tr><td>Current Reading : </td><td><input type="text" name="read" id="read" value="<%=cr%>"/></td></tr>
				<tr><td>Previous Reading : </td><td><input type="text" name="pre" id="pre"  value="<%=pr%>"/><input type="button" value="Check" onclick="return test();"/></td></tr>
				<tr><td>Actual Reading : </td><td><input type="text" name="act" id="act" value="<%=ar%>"  /></td></tr>				
				<tr><td>Amount</td><td><input type="text" name="amt" id="amt" value="<%=m%>" readonly /></td></tr>
				<tr><td><br><br></td></tr>
				<tr><td align="center" colspan="2"><input type="submit" value="submit" />&ensp;&ensp;&ensp;<input type="reset" value="Clear" /></td></tr>
				</table>
				</form>
				<%
				}
						
				if(t==0)
				{
					out.print("<h2>No Record is Found</h2>");
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