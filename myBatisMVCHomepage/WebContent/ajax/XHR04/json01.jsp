<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">
	var arr=new Array();
	var xhr=null;
	function startRequest() {
		xhr=new XMLHttpRequest();
		xhr.open("GET", "json01.txt", true);
		xhr.send();
		xhr.onreadystatechange=resultProcess;
	}
	function resultProcess() {
		if(xhr.readyState==4&&xhr.status==200){
			arr.push(xhr.responseText);
			var obj=JSON.parse(xhr.responseText);
			arr.push(obj.name);
			arr.push(obj.age);
			arr.push(obj.ki);
			
			var ulNode=document.createElement("ul");
			var liName=document.createElement("li");
			liName.innerHTML=obj.name;

			var liAge=document.createElement("li");
			liAge.innerHTML=obj.age;

			var liKi=document.createElement("li");
			liKi.innerHTML=obj.ki;

			ulNode.appendChild(liName);
			ulNode.appendChild(liAge);
			ulNode.appendChild(liKi);
			document.getElementById("resultDist").appendChild(ulNode);
		}
		//alert(arr.join("\n"));
	}
</script>
</head>
<body onload="startRequest()">
	<!-- 
		1. JSON(Javascript Object Notation)문법
			1) "{"중괄로 시작해서"}" 중괄로로 끝난다.
			2) {} 데이터 쌍들의 집합 {"key" : "value"}
			3) 배열 형태호 저장 가능 {"list" : [{...},{...}]}
	 -->
	 <div id="resultDist"></div>
</body>
</html>