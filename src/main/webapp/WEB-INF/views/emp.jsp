<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
	<link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet"> 
	<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<!-- CSS -->
	<style>
	Table.GridOne 
		{
		 padding: 3px;
		 margin: 0;
		 background: lightyellow;
		 border-collapse: collapse; 
		 width:35%;
		}
	Table.GridOne Td 
		{ 
		 padding:2px;
		 border: 1px solid #ff9900;
		 border-collapse: collapse;
		} 
	</style>
	<script type="text/javascript">
	
	jQuery(document).ready(function() {
		$('#insertBut').hide();
		$('#updateBut').hide();
		
		showAll();
		
	    jQuery("#confirmationDialog").dialog({
	        autoOpen: false,
	        modal: true,
	        title:'insert Data',
	        width:600,
	        height:600,
	        open: function() {
	        	var id = $("#id").val();
	        	if(id == '' ){
	        		$('#insertBut').show();
	        		$('#updateBut').hide();
	        	}else{
	        		$('#insertBut').hide();
	        		$('#updateBut').show();
	        	}
	        },
	        close :function() {
	        	$("#id").val('');
    	    	$("#fname").val('');
    	    	$("#lname").val('');
    	    	$("#gen").val('');
    	    	$("#address").val('');
    	    	
	        	showAll();
	        } 
	    });
	});
	
	function insert(){
		$("#confirmationDialog").dialog("open");
	}
	
	function showAll(){
	      $.ajax({
	              type:"GET",
	              url:"showAll",
	              dataType: "json",
	              success:function(data)
	              { 
	            	  var rows = '';
	                  $.each( data , function( index, item ) {
	                	rows += '<tr><td>' + item.id + '</td>';
	          	  	  	rows += '<td>' + item.firstname + '</td>';
	          	  	  	rows += '<td>' + item.lastname + '</td>';
	          	  	  	rows += '<td>' + item.gender + '</td>';
	          	  		rows += '<td>' + item.address + '</td>';
	          	  		rows += '<td onclick="editAjaxData('+item.id+');" >edit</td>';
	          	  		rows += '<td onclick="showAjaxData('+item.id+');" >show single emp</td>';
	          	  		rows += '<td onclick="deleteAjaxData('+item.id+');" >Delete</td></tr>';
	          	  	  	
	          	  	  });
	          	  	  $('#tblProducts').html(rows);
	              },
	              error:function(xmlHttpRequest, textStatus, errorThrown)
	              {
	                     alert("error");
	              }
	      });
	}
	
	function insertAjaxData(){
    	var fn = $("#fname").val();
  		var ln = $("#lname").val();
  		var gn = $("#gen").val();
  		var add = $("#address").val();
    	$.ajax({
	    	   type: "post",
	    	   url: "insertInfo",
	    	   dataType: "json",  
	    	   data:{fname: fn , lname: ln , gen: gn , address: add},
	    	   success: function(response){
	    	    if(response == 1){
	    	    	
	    	    	alert('inserted');
	    	    	$('#confirmationDialog').dialog('close');
	    	    	showAll();
	    	    }
	    	   },
	    	   error: function(){      
	    	    alert('Error while request..');
	    	   }
	    });
    }
	function updateAjaxData(){
		var id = $("#id").val();
    	var fn = $("#fname").val();
  		var ln = $("#lname").val();
  		var gn = $("#gen").val();
  		var add = $("#address").val();
    	$.ajax({
	    	   type: "post",
	    	   url: "updateInfo",
	    	   dataType: "json",  
	    	   data:{id: id, fname: fn , lname: ln , gen: gn , address: add},
	    	   success: function(response){
	    	    if(response == 1){
	    	    	alert('updated');
	    	    	$('#confirmationDialog').dialog('close');
	    	    	showAll();
	    	    }
	    	   },
	    	   error: function(){      
	    	    alert('Error while request..');
	    	   }
	    });
    }
	
	function showAjaxData(id){
		$.ajax({
            type:"GET",
            url:"showSingleEmp",
            dataType: "json",
            data:{id: id },
            success:function(data)
            { 
          	  var rows = '';
                //$.each( data , function( index, item ) {
                	console.log('item.id'+data.id);
                	console.log('item.firstname'+data.firstname);
                	console.log('item.lastname'+data.lastname);
                	console.log('item.gender'+data.gender);
                	console.log('item.address'+data.address);
                	console.log('item.id'+item.dflag);
              	rows = '<tr><td>' + data.id + '</td>'
        	  	    + '<td>' + data.firstname + '</td>'+
        	  	  	'<td>' + data.lastname + '</td>'+
        	  	    '<td>' + data.gender + '</td>'+
        	  		'<td>' + data.address + '</td>'+
        	  		'<td onclick="editAjaxData('+data.id+');" >edit</td>'+
        	  		/* rows += '<td onclick="showAjaxData('+item.id+');" >show single emp</td>'; */
        	  		'<td onclick="deleteAjaxData('+data.id+');" >Delete</td></tr>';
        	  	  	
        	  	  //});
        	  	 $('#tblProducts2').html(rows);
        	  	$("#confirmationDialog2").dialog("open");
            },
            error:function(xmlHttpRequest, textStatus, errorThrown)
            {
                   alert("error");
            }
    });
	}
	function editAjaxData(id){
		alert('editAjaxData()'+id);
		
  	  $.ajax({
  	   type: "get",
  	   url: "editData",
  	   dataType: "json",  
  	   data:{id: id },
  	   success: function(response){
  		    alert(response);
  		    $("#id").val(response.id);
    		$("#fname").val(response.firstname);
    		$("#lname").val(response.lastname);
    		$("#gen").val(response.gender);
    		$("#address").val(response.address);
  	    	$("#confirmationDialog").dialog("open");
  	   },
  	   error: function(){      
  	    alert('Error while request..');
  	   }
  	  });
  	}
	
	function deleteAjaxData(id){
  	  $.ajax({
  	   type: "post",
  	   url: "deleteData",
  	   dataType: "json",  
  	   data:{id: id },
  	   success: function(response){
	  	   if(response == 1){
	  		   alert('data dleted');
	  		   showAll();
	  	   }
  	   },
  	   error: function(){      
  	   		alert('Error while request..');
  	   }
  	  });
  	 }
	</script>
</head>
<body>
	<button id="click" onclick="insert();"> Add New</button>
	<table>
	  <thead>
	  	<tr>
		  <th> Id </th>
		  <th> FirstName </th>
		  <th> Lastname </th>
		  <th> Gender </th>
		  <th> address </th>
		  <th>Action</th>
		</tr>
	  </thead>
	  <tbody id="tblProducts">
	  
	  </tbody>
	</table>
	<div id="confirmationDialog">
        <table class="GridOne">
	        <tr>
				<td>
					<input id="id" type="hidden" name="id"  value=""/>
					<label>First Name</label>
				</td> 
				<td>
					<input id="fname" type="text" name="fname"  value=""/>
				</td>         
			</tr>
			 <tr>
				<td>
					<label>Last Name</label>
				</td> 
				<td>
					<input id="lname" type="text" name="lname"  value=""/>
				</td>         
			</tr>
			 <tr>
				<td>
					<label>Gender</label>
				</td> 
				<td>
					<input id="gen" type="text" name="gen"  value=""/>
				</td>         
			</tr>
			 <tr>
				<td>
					<label>Address</label>
				</td> 
				<td>
					<textarea id="address" name="address" rows="4" cols="8" maxlength="400"></textarea>
				</td>         
			</tr>
			<tr>
				<td>
					<input type="button" id="insertBut" name="submit" onclick="insertAjaxData();" value="submit">
					<input type="button" id="updateBut" name="submit" onclick="updateAjaxData();"  value="update">
				</td>         
			</tr>
			
        </table>
</div>
<div id="confirmationDialog2">
	<table>
       <thead>
	  	<tr>
		  <th> Id </th>
		  <th> FirstName </th>
		  <th> Lastname </th>
		  <th> Gender </th>
		  <th> address </th>
		   <th> status </th>
		  <th>Action</th>
		</tr>
	  </thead>
	  <tbody id="tblProducts2">
	  
	  </tbody>
	</table>
</div>

</body>
</html>