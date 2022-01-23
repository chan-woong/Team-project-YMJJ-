<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		// 노드 생성, 추가 ,치환, 삭제 : createElement(), appendChild(), replaceChild(), removeChild()
		var divNode=document.createElement("div");
		var spanNode=document.createElement("span");
		spanNode.innerHTML="반가워요!!";
		var brMode=document.createElement("br");
		var bNoad=document.createElement("b");
		bNoad.innerHTML="안녕하세요!";
		divNode.appendChild(spanNode);
		divNode.appendChild(brMode);
		divNode.appendChild(bNoad);
		document.body.appendChild(divNode);
		
		var fontNoed=document.createElement("font");
		fontNoed.innerHTML="오늘은 수요일 입니다.";
		divNode.replaceChild(fontNoed, spanNode);
	}
</script>
</head>
<body onload="sub()">
	
</body>
</html>