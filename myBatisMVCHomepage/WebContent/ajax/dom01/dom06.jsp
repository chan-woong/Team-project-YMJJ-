<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var font1=document.getElementById("font1");
		var span1=font1.getElementsByTagName("span");
		var str1="";
		for (var i = 0; i < span1.length; i++) {
			str1 += span1[i].childNodes[0].nodeValue + ",";
		}
		//alert(str1);
		
		clear();
		var disp = document.getElementById("disp");
		disp.style.color="red";
		disp.style.fontSize="30px";
		disp.innerHTML="추출한 문자는" + str1 + "입니다.<br/><br/>";
		
		
		var font2=document.getElementById("font2");
		var span2=font2.getElementsByTagName("span");
		var str2="";
		for (var i = 0; i < span2.length; i++) {
			str2 += span2[i].childNodes[0].nodeValue + ",";
		}
		var print = document.getElementById("print");
		print.style.color="blue";
		print.style.fontSize="20px";
		print.innerHTML="추출한 문자는" + str2 + "입니다.";
	}
	function clear() {
		var font1=document.getElementById("font1");
		font1.style.display="none";
		var font2=document.getElementById("font2");
		font2.style.display="none";
		var btn=document.getElementById("btn");
		btn.style.display="none";
	}
</script>
</head>
<body>
	<font id="font1">
		<span>가</span>
		<span>나</span>
		<span>다</span>
	</font>
	<font id="font2">
		<span>A</span>
		<span>B</span>
		<span>C</span>
	</font>
	<input id="btn" type="button" value="클릭" onclick="sub()"/>
	
	<b id="disp"></b>
	<b id="print"></b>
</body>
</html>