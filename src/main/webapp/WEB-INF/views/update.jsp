<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="updateEmployee" method="post">
	<table>
		<tr>
			<td>
				<input type="hidden" name="id" value="${editemp.id}"/>
				<label>FirstName</label>
			</td>
			<td>
				<input type="text" name="firstname" value="${editemp.firstname}"/>
			</td>
		</tr>
		<tr>
			<td>
				<label>LastName</label>
			</td>
			<td>
				<input type="text" name="lastname" value="${editemp.lastname}"/>
			</td>
		</tr>
		<tr>
			<td>
				<label>Address</label>
			</td>
			<td>
				<textarea name="address" rows="5" cols="60" maxlength="300">${editemp.address}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type="submit" name="submit" value="update"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>