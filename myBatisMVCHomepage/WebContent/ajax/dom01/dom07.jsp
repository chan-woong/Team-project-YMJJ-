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
		var melon=document.getElementById("melon");
		var melonChild=melon.childNodes;
		arr.push(melonChild.length);
		arr.push("\n");
		/*
		for (var i = 0; i < melonChild.length; i++) {
			arr.push(melonChild[i].nodeName);
			arr.push(melonChild[i].nodeType);
			arr.push("\n");
		}
		*/
		//nodeType -> 1:태그, 2:속성, 3:텍스트
		for (var i = 0; i < melonChild.length; i++) {
			if (melonChild[i].nodeType==1) {
				arr.push(melonChild[i].childNodes[0].nodeValue);
			}
		}
		alert(arr.join("\n"));
	}
</script>
</head>
<body>
	<div id="melon">
		<span>가</span><i>나</i><b>다</b>
	</div>
	<input type="button"value="클릭" onclick="sub()"/>
</body>
</html>