<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var divNode=document.createElement("div");
		var fontNode=document.createElement("font");
		fontNode.innerHTML="내일을 수요일";

		var bNode=document.createElement("b");
		bNode.innerHTML="날씨가 추워요";
		var brNode=document.createElement("br");
		
		var div=document.createElement("div");
		div.innerHTML="눈이와요";
		
		divNode.appendChild(fontNode);
		divNode.appendChild(bNode);
		divNode.appendChild(brNode);
		divNode.appendChild(div);
		document.body.appendChild(divNode);
	}
</script>
</head>
<body onload="sub()">

</body>
</html>