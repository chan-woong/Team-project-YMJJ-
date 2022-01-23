<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var divNoed=document.createElement("div");
		divNoed.align="center";
		for (var i = 0; i < 10; i++) {
			var spanNoed=document.createElement("span");
			spanNoed.innerHTML="내용"+(i+1);
			
			var brNoed=document.createElement("br");
			
			divNoed.appendChild(spanNoed);
			divNoed.appendChild(brNoed);
		}
		divNoed.removeChild(brNoed);
		document.body.appendChild(divNoed);
		var disp=document.getElementById("disp");
		document.body.removeChild(disp);
	}
</script>
</head>
<body onload="sub()">
	<div id="disp">AJAX시작입니다.</div>
</body>
</html>