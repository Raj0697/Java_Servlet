<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blood Management</title>
<script type="text/javascript">


</script>

</head>
<body><form name="frm" action="blood_insert.jsp" method="post" ><center>
		<br><h1>Online Blood Banking</h1>
		<br>
		<table>
		<tr><td><h2>Donor ID : </h2></td><td><input type="text" name="d_id" id="" /> </td></tr>
		<tr><td><h2>Donor Name : </h2></td><td><input type="text" name="d_n" id="d_n" /></td></tr>
		<tr><td><h2>Age : </h2></td><td><input type="text" name="age" id="age" /></td></tr>
		<tr><td><h2>Gender : </h2></td><td><input type="radio" name="gender" id="m" value="Male" />Male  <input type="radio" name="gender" value="Female" id="f" />Female</td></tr>
		<tr><td><h2>Blood Group :  </h2></td><td>
		<select name="group" id="group">
		<option value="A+">A + </option>
		<option value="A-">A - </option>
		<option value="B+">B + </option>
		<option value="B-">B - </option>
		<option value="AB+">AB + </option>
		<option value="AB-">AB - </option>
		<option value="O+">O + </option>
		<option value="O-">O - </option>
		</select></td></tr>
		<tr><td><h2>Phone no: </h2></td><td><input type="text" name="phno" /></td></tr>
		<tr><td><br></td></tr>
		<tr align="center"><td><input type="submit" value="submit" /></td><td><input type="reset" value="Reset" /></td></tr>
		
		</table></center>
		<br><br>
		<a href="bloodview.jsp"><input type="button" value="Records" /></a>
		
		</form>
</body>
</html>
