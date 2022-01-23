<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var arr=new Array();
		
		var divNoad=document.createElement("div");
		divNoad.align="center";
		divNoad.style.color="blue";
		divNoad.id="apple";
		divNoad.innerHTML="속성 연습중 입니다.";
		divNoad.onclick=fun;
		//divNoad.onclick=function(){	fun(10,20);	};
		document.body.appendChild(divNoad);
		
		//alert(arr.join("\n"));
	}
	function abc() {alert("abc");}
	function xyz(su, value) {alert(su+","+value);}
	function fun() {
		var arr=new Array();
		var div=document.createElement("div");
		div.setAttribute("innerHTML","반가워요");
		div.setAttribute("aluge","left");
		div.setAttribute("id", "banana");
		
		arr.push(div.getAttribute("align"));
		arr.push(div.getAttribute("id"));
		
		alert(arr.join("\n"));
	}
</script>
</head>
<body onload="sub()">

</body>
</html>