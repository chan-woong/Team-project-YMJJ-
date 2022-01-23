<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function test() {
		//alert("OK");
		var test1=document.getElementById("test1");
		test1.innerHTML="APPLE";
		
		var info=document.getElementById("info");
		info.innerHTML="바나나";
		
		var test3=document.getElementById("test3");
		var span=test3.getElementsByTagName("span");
		span[0].innerHTML="감";
		span[1].innerHTML="배";
		
		var test2=document.getElementById("test2");
		var span=test2.getElementsByTagName("span");
		var s=span[2].getElementsByTagName("span");
		s[1].innerHTML="하하";
	}
</script>
</head>
<body onload="test()">
	<div id="test1"></div>
	<div id="test2">
		<span>1</span>
		<span>2</span>
		<span>
			<span id="info"></span>
			<span></span>
		</span>
	</div>
	<div id="test3">
		<span>1</span>
		<span>1</span>
	</div>
</body>
</html>