<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Electricity Board Record Registration</title>
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
<body>
		
			<center><h1>Electricity Billing System </h1></center>
			<br><br><form name="frm" action="ebinsert.jsp" method="post" >
			<table align="center">
			<%
					String name=null,id=null,gen=null,add=null,ph=null,g=null,cr=null,pr=null;
					Integer cr1=null;
					Integer pr1=null;
					int cre=0;
					//String sub=request.getParameter("sub");
					//
					//if(sub!=null )
					//{
					//	 name=request.getParameter("custn");
					//	 id=request.getParameter("custi");
					//	 gen=request.getParameter("gen");
					//	 add=request.getParameter("add");
					//	 ph=request.getParameter("phno");
					//	 g=request.getParameter("etype");
					//	 cr=request.getParameter("read");
					//	 pr=request.getParameter("pre");
						 					
					//	 	cr1=Integer.parseInt(cr);
					//		pr1=Integer.parseInt(pr);
					//	cre=cr1-pr1;
						
					
			%>
			
				<tr><td>Customer Name</td><td><input type="text" name="custn" <% if(name!=null) { %> value="<%=name%>" <% } %> /></td></tr>
				<tr><td>Customer ID</td><td><input type="text" name="custi" <% if(id!=null) { %> value="<%=id%>" <% } %> /></td></tr>
				<tr><td>Gender</td><td><input type="radio" value="male" name="gen" <% if(gen.equals("male")) { %> Checked <% } %> />Male&ensp;&ensp;
				<input type="radio" value="female" name="gen" <% if(gen.equals("female")) { %> Checked <% } %> />Female
				</tr>
				<tr>
				<td>Address</td><td><textarea name="add"><% if(add!=null) { %> value="<%=add%>" <% } %></textarea></td>
				</tr>
				<tr><td>Phone</td><td><input type="text" name="phno" <% if(ph!=null) { %> value="<%=ph%>" <% } %> /></td></tr>
				<tr><td>Category</td><td>
				<select name="etype" id="etype">
				<option value="Domestic" <% if(g.equals("Domestic")) { %> selected <% } %> >Domestic</option>
				<option value="Commercial" <% if(g.equals("Commercial")) { %> selected <% } %> >Commercial</option>
				<option value="Industrial" <% if(g.equals("Industrial")) { %> selected <% } %> >Industrial</option>
				</select>
				</td></tr></table>
				<form name="data" action="ebjsp.jsp" method="post">
					<table  align="center">
					
					<tr><td>Current Reading : </td><td><input type="text" name="read" id="read" <% if(cr1!=null) { %> value="<%=cr1%>" <% }  %> /></td></tr>
					<tr><td>Previous Reading : </td><td><input type="text" name="pre" id="pre"  <% if(pr1!=null) { %> value="<%=pr1%>" <% }  %>/>
					<input type="submit" value="Check" name="sub" /></td></tr>
					<%
					//}
					%>
					<tr><td>Actual Reading : </td><td><input type="text" name="act" id="act" value="0" readonly /></td></tr>
					</table>
				</form>
				<tr><td>Amount</td><td><input type="text" name="amt" id="amt" value="0" /></td></tr>
				<tr><td><br><br></td></tr>
				<tr><td align="center" colspan="2"><input type="submit" value="submit" />&ensp;&ensp;&ensp;<input type="reset" value="Clear" /></td></tr>
			</table>
			</form>
</body>
</html>