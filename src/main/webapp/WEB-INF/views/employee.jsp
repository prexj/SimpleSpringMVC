<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="insertData" method="post">
	<table>
		<tr>
			<td>
				<label>FirstName</label>
			</td>
			<td>
				<input type="text" name="firstname" value=""/>
			</td>
		</tr>
		<tr>
			<td>
				<label>LastName</label>
			</td>
			<td>
				<input type="text" name="lastname" value=""/>
			</td>
		</tr>
		<tr>
			<td>
				<label>Address</label>
			</td>
			<td>
				<textarea name="address" rows="5" cols="60" maxlength="300"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<label>Skill</label>
			</td>
			<td>
				<input type="checkbox" id="isCheck" name="skl" value="java" onchange="dosearch(this);"/>java
				<input type="checkbox" id="isCheck" name="skl" value="php" onchange="dosearch(this);"/>php
				<input type="checkbox" id="isCheck" name="skl" value=".net" onchange="dosearch(this);"/>.Net
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" name="submit" value="Insert"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>