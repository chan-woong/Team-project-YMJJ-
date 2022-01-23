<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sun() {
		var divNode=document.createElement("div");
		divNode.align="center";
		
		var spanNode=document.createElement("span");
		spanNode.style.color="red";
		spanNode.innerHTML="안녕하세요";
		
		divNode.appendChild(spanNode);
		document.body.appendChild(divNode);
	}
</script>
</head>
<body onload="sun()">

</body>
</html>