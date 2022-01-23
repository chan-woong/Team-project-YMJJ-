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
		var dauther=document.getElementById("dauther");
		var olderBeother=dauther.previousSibling;
		var olderVlauer=getPreviousSibling(olderBeother);
		arr.push(olderVlauer);
		
		var yongerBrother=dauther.nextSibling;
		var yongerVlauer=getNextSibling(yongerBrother);
		arr.push(yongerVlauer);
		alert(arr.join("\n"));
	}
	
	function getPreviousSibling(node) {
		if(node.nodeType==1){
			return node.childNodes[0].nodeValue;	
		}
		if (node.nodeType==3) {
			return node.previousSibling.childNodes[0].nodeValue;
		}
	}
	function getNextSibling(node) {
		if(node.nodeType==1){
			return node.childNodes[0].nodeValue;	
		}
		if (node.nodeType==3) {
			return node.nextSibling.childNodes[0].nodeValue;
		}
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