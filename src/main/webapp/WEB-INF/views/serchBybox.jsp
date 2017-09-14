<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <style>
        body         { padding-top:50px; }
        form         { margin-bottom:50px; }
    </style>
<title>Insert title here</title>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script> 
<!-- <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.13/angular.min.js"></script> -->
<script type="text/javascript">
/* var formApp = angular.module('formApp', [])

.controller('formController', function($scope) {
	
	$http.get("serchAJAX").success( function(response) {  
	       $scope.favoriteColors = response;  
	    });  */

    // we will store our form data in this object
   /*  $scope.formData = {}; */
    
/* });
$("#tblProducts").html(''); */ 
/* function employeeController($scope,$http) {  
    var url = "data.txt";  
   
    $http.get(url).success( function(response) {  
       $scope.employees = response;  
    });  
 } */
 var skl = new Array();

function dosearch(val){
	if ( $( val ).is(':checked') ) {
		 skl.push(val.value);
         var rows="";
        $.getJSON( "serchee",{skill  : val.value}, function( data ) {
  	      $.each( data , function( index, item ) {
  	    	  rows += "<tr><td>" + item.fname + "</td></tr>";
  	    	 // $('#tblProducts').append(rows);
  	      });
  	    $('#tblProducts').html(rows);
        });  
        /* for(int i = 0; i<skl.legth();i++){
		alert(skl[i]);
        }
    }else{
    	$("#tblProducts").html('');
      } */
	}

} 
</script>
</head>
<!-- <body ng-app="formApp" ng-controller="formController">
 <form action="serchAJAX" method="get">
    
        NAME INPUT
        <div class="form-group">
            <label>Name</label>
            <input type="text" class="form-control" name="name" ng-model="formData.name">
        </div>
		 <label>Favorite Colors</label>
    <div class="form-group">
        <label class="checkbox-inline">
            <input type="checkbox" name="favoriteColors" ng-="formData.favoriteColors.red"> Red
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" name="favoriteColors" ng-model="formData.favoriteColors.blue"> Blue
        </label>
        <label class="checkbox-inline">
            <input type="checkbox" name="favoriteColors" ng-model="formData.favoriteColors.green"> Green
        </label>
    </div>
        <h1 ng-show="formData.favoriteColors">Checked</h1>  
       
        <button type="submit" class="btn btn-danger btn-lg">Send Away!</button>
        
    </form> -->


 <input type="checkbox" id="isCheck" name="skl" value="java" onchange="dosearch(this);"/>java
<input type="checkbox" id="isCheck" name="skl" value="php" onchange="dosearch(this);"/>php
<input type="checkbox" id="isCheck" name="skl" value=".net" onchange="dosearch(this);"/>.Net 
 <button type="submit" onclick="" class="btn btn-danger btn-lg">Send Away!</button>

<table class="tblProducts">
        <thead>
            <tr>
                <th align="left" class="productth">fname</th>
            </tr>
        </thead>
        <tbody id="tblProducts">
        <tr><td>sdsd</td></tr>
        </tbody>
    </table>
</body>
</html>