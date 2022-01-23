<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var dauther=document.getElementById("dauther");
		var oldBrother=dauther.previousSibling;			//손위
		var yougerBrother=dauther.nextSibling;			//손아래
		//alert(oldBrother.nodeType + "," + yougerBrother.nodeType);
		var older=dauther.previousSibling.previousSibling;
		var youger=dauther.nextSibling.nextSibling;
		//alert(older.nodeType + "," + youger.nodeType);
		
		var disp=document.getElementById("disp");
		var str="오빠 자식 : "+ older.childNodes[0].nodeValue + "<br/>";
		str +="동생 자식 : "+ youger.childNodes[0].nodeValue + "<br/>";
		disp.innerHTML=str;
	}
</script>
</head>
<body onload="sub()">
	<div>
		<div>
			<span id="firsSon">첫째입니다.</span>
			<span id="dauther">둘째입니다.</span>
			<span id="secondSou">셋째입니다.</span>
		</div>
	</div>
	
	<div id="disp"></div>
</body>
</html>