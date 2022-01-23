<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var apple=document.getElementById("apple");
		//alert(apple.id + ","+apple.align);
		apple.align="left";
		apple.style.color="blue";

		var banana=document.getElementById("banana");
		banana.size="7";
		banana.color="red";
		

		var strawberry=document.getElementById("strawberry");
		strawberry.type="button";
		strawberry.value="딸기는 맛있습니다.";
	}
</script>
</head>
<body>
	<div id="apple" align="center">사과</div>
	<font id="banana">바나나</font>
	<input id="strawberry" type="text" value="딸기"/>
	<input type="button" value="클릭" onclick="sub()"/>
</body>
</html>