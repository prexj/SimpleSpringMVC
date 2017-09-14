<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript">
function dosearch(val){
	if ( $( val ).is(':checked') ) { 
        var rows="";
        $.getJSON( "serchAJAX",{skill  : val.value}, function( data ) {
  	      $.each( data , function( index, item ) {
  	    	  rows += "<tr><td>" + item.fname + "</td></tr>";
  	    	 // $('#tblProducts').append(rows);
  	      });
  	    $('#tblProducts').html(rows);
        }); 
    }else{
    	$("#tblProducts").html('');
    }
	/* var skl=[];
	var rows = '';
	$.getJSON( "serchAJAX",{ skl:checked}, function( data ) {
	      $.each( data , function( index, item ) {
	    	  rows += "<tr><td>" + item.fname + "</td></tr>";
	    	  //$('#tblProducts').append(rows);
	      });
	      $('#tblProducts').html(rows);
	}); */
}
</script>
</head>
<body>
<table>
  <thead>
	  <th> Id </th>
	  <th> FirstName </th>
	  <th> LastName </th>
	  <th> Address </th>
	  <th> Skill </th>
	 
	  <th>Action</th>
  </thead>
  <tbody>
  	<c:forEach items="${show}" var="item">
	  <tr><%-- <p>${item }</p> --%>
		  <td>${item.id }</td>
		  <td>${item.firstname }</td>
		  <td>${item.lastname }</td>
		  <td>${item.address }</td>
		  <td>${item.skill }</td>
		  <td>
		 <%--  <a href="editEmployee?id=${item.id }">EDIT</a>--%>
			  <form action="editEmployee" method="get">
			  <input type="hidden" name="id" value="${item.id }">
			  <input type="submit" name="submit" value="edit">
			  </form> 
		  </td>
		  <td>
			  <form action="deleteEmployee" method="get">
			  <input type="hidden" name="id" value="${item.id }">
			  <input type="submit" name="submit" value="delete">
			  </form>
		  </td>
	  </tr>
	</c:forEach>
  </tbody>
</table>
</body>
</html>