<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>JSON ARR</title>
<script type="text/javascript" src="${root}/ajax/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root) {
		var url=root+"/json/jsonArr.do";
		//alert(url);
		sendRequest("GET",url,null,fromServer);
	}
	function fromServer() {
		if(xhr.readyState==4&&xhr.status==200){
			processJSON();
		}
	}
	
	function processJSON() {
		var arr=JSON.parse(xhr.responseText);
		//alert(obj);
		/*
		for (var i = 0; i < arr.data.length; i++) {
			var divBunho=document.createElement("div");
			divBunho.innerHTML=arr.data[i].name;
			var divIrum=document.createElement("div");
			divIrum.innerHTML=arr.data[i].phone;
			var divAverage=document.createElement("div");
			divAverage.innerHTML=arr.data[i].addreass;
			
			var divResult=document.getElementById("result");
			divResult.appendChild(divBunho);
			divResult.appendChild(divIrum);
			divResult.appendChild(divAverage);			
		}
		*/
		var str="<div>";
		for (var i = 0; i < arr.data.length; i++) {
			str+="<div>"+arr.data[i].name+"</div>";
			str+="<div>"+arr.data[i].phone+"</div>";
			str+="<div>"+arr.data[i].addreass+"</div><br/>";
		}
		str += "</div>";
		var divResult = document.getElementById("result");
	    divResult.innerHTML = str;

		
	}
</script>
</head>
<body onload="toServer('${root}')">
	<h3>JSON ARR</h3>
	<div id="result"></div>
</body>
</html>