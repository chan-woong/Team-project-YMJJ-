<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var myForm=document.getElementById("myForm");
		var input=myForm.getElementsByTagName("input");
		
		var str="";
		for (var i = 0; i < input.length; i++) {
			//alert(input[i].value);
			str += input[i].value + "<br/>";
		}
		var result=document.getElementById("result");
		result.innerHTML=str;
	}
	
	function change() {
		var myForm=document.getElementById("myForm");
		var input=myForm.getElementsByTagName("input");
		var img=document.getElementById("img");
		for (var i = 0; i < input.length; i++) {
			if(input[i].checked==true){
				//alert(input[i].value);
				img.innerHTML="<img width='200' height='200' src='./../image/"+input[i].value+".jpg'/>";
			}
				
		}
	}
</script>
</head>
<body onload="sub()">
	<div id="result"></div>
	<br/><br/>
	
	<form id="myForm">
		<input type="radio" name="select" value="Chrysanthemum" onchange="change()"/>
		<label>꽃</label>
		
		<input type="radio" name="select" value="Desert" onchange="change()"/>
		<label>사막</label>
		
		<input type="radio" name="select" value="Hydrangeas" onchange="change()"/>
		<label>꽃</label>
		
		<input type="radio" name="select" value="Jellyfish" onchange="change()"/>
		<label>해파리</label>
		
		<br/><br/>
		
		<div id="img"></div>
	</form>
</body>
</html>