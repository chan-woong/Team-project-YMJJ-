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
		xhr.open("GET", "json03.txt", true);
		xhr.send();
		xhr.onreadystatechange=resultProcess;
	}
	function resultProcess() {
		if(xhr.readyState==4&&xhr.status==200){
			arr.push(xhr.responseText);
			var obj=JSON.parse(xhr.responseText);
			var divNode=document.createElement("div");
			
			var divName=document.createElement("div");
			divName.innerHTML=obj.name;
			
			var divAge=document.createElement("div");
			divAge.innerHTML=obj.age;

			divNode.appendChild(divName);
			divNode.appendChild(divAge);
			for (var i = 0; i < obj.cars.length; i++) {
				var ulNode=document.createElement("ul");
				
				var liNode1=document.createElement("li");
				liNode1.innerHTML=obj.cars[i].name

				ulNode.appendChild(liNode1);
				
				for (var j = 0; j < obj.cars[i].models.length; j++) {
					var liNode2=document.createElement("li");
					liNode2.innerHTML=obj.cars[i].models[j];

					ulNode.appendChild(liNode2);
				}
				divNode.appendChild(ulNode);
				
			}
			document.getElementById("resultDist").appendChild(divNode);
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