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
		var apple = document.getElementById("apple");
		var div=apple.getElementsByTagName("div");
		var str="";
		for (var i = 0; i < div.length; i++) {
			str += div[i].childNodes[0].nodeValue;
		}
		var banana=document.getElementById("banana");
		var bananaChukd=banana.childNodes;
		for (var i = 0; i < bananaChukd.length; i++) {
			if(bananaChukd[i].nodeType==1){
				str += bananaChukd[i].childNodes[0].nodeValue;
			}
		}
		
		var result=document.getElementById("result");
		result.style.color="red";
		result.innerHTML=str;
	}
</script>
</head>
<body onload="sub()">
	<div id="apple">
		<div>가</div>
		<div>나</div>
		<div>다</div>
		<div>라</div>
	</div>
	<div id="banana">
		<span>A</span>
		<label>B</label>
		<b>C</b>
		<p>D</p>
	</div>
	<div id="result">
	</div>
</body>
</html>