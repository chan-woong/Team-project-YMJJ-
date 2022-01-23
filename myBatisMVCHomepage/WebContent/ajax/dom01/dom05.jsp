<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	function abc() {
		var div=document.getElementsByTagName("div");
		div[1].innerHTML="나는 바나나를 좋아합니다.";
		
		var arr=new Array();
		arr.push("node name & node value : " + div[0].nodeName + "," + div[0].nodeValue);
		arr.push("node name & node value : " + div[0].childNodes[0].nodeName + "," + div[0].childNodes[0].nodeValue);
		
		var h3=document.getElementsByTagName("h3");
		arr.push("node name & node value : " + h3[0].nodeName + "," + h3[0].nodeValue);
		arr.push("node name & node value : " + h3[0].childNodes[0].nodeName + "," + h3[0].childNodes[0].nodeValue);
		arr.push("node name & node value : " + h3[0].childNodes[1].nodeName + "," + h3[0].childNodes[1].nodeValue);
		arr.push("node name & node value : " + h3[0].childNodes[1].childNodes[0].nodeName + "," + h3[0].childNodes[1].childNodes[0].nodeValue);
		alert(arr.join("\n"));
	}
	
	function xyz() {
		var arr=new Array();
		var melon=document.getElementById("melon");
		var span=melon.getElementsByTagName("span");
		for (var i = 0; i < span.length; i++) {
			arr.push(span[i].childNodes[0].nodeValue);
		}
		alert(arr.join("\n"));
	}
	function ijk() {
		var arr=new Array();
		var banana=document.getElementById("banana");
		var fontList=banana.getElementsByTagName("font");
		
		for (var i = 0; i < fontList.length; i++) {
			var font=fontList[i];
			var span=font.getElementsByTagName("span");
			
			for (var j = 0; j < span.length; j++) {
				arr.push(span[j].childNodes[0].nodeValue);
			}
		}
		alert(arr.join("\n"));
	}
</script>
</head>
<body>
	<div>나는 사과를 좋아합니다.</div>
	<h3>나는 메론을 좋아합나다.<i>아주 많이</i></h3>
	<div></div>
	<input type="button" value="클릭" onclick="abc()"/>
	<br/><br/>
	<span id="melon">
		<span>가</span>
		<span>나</span>
		<span>다</span>
	</span>
	<input type="button" value="클릭" onclick="xyz()"/>
	<br/><br/>
	<div id="banana">
		<font>
			<span>A</span>
			<span>B</span>
			<span>C</span>
		</font>
		<font>
			<span>1</span>
			<span>2</span>
			<span>3</span>
		</font>
	</div>
	<input type="button" value="클릭" onclick="ijk()"/>
</body>
</html>