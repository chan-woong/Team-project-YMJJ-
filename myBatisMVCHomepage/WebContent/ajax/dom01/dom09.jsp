<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function sub() {
		var firsSon=document.getElementById("firsSon");
		var firsSonParent=firsSon.parentNode;
		
		var dauther=document.getElementById("dauther");
		var dautherParent=dauther.parentNode;
		
		var secondSou=document.getElementById("secondSou");
		var secondSouGrandFather=secondSou.parentNode.parentNode;
		
		
		var str="";
		str += firsSonParent.nodeName+"&nbsp;&nbsp;";
		str += firsSonParent.nodeType+"&nbsp;&nbsp;";
		str += dautherParent.nodeName+"&nbsp;&nbsp;";
		str += dautherParent.nodeType+"&nbsp;&nbsp;";
		str += secondSouGrandFather.nodeName+"&nbsp;&nbsp;";
		str += secondSouGrandFather.nodeType+"&nbsp;&nbsp;";
		
		var disp=document.getElementById("disp");
		disp.style.color="red";
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