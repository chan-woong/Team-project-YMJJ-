<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>JSON OBJ</title>
<script type="text/javascript" src="${root}/ajax/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root) {
		var url=root+"/json/jsonObj.do";
		//alert(url);
		sendRequest("GET",url,null,fromServer);
	}
	function fromServer() {
		if(xhr.readyState==4&&xhr.status==200){
			processJSON();
		}
	}
	
	function processJSON() {
		var obj=JSON.parse(xhr.responseText);
		//alert(obj);
		var divBunho=document.createElement("div");
		divBunho.innerHTML=obj.bunho;
		var divIrum=document.createElement("div");
		divIrum.innerHTML=obj.irum;
		var divAverage=document.createElement("div");
		divAverage.innerHTML=obj.average;
		
		var divResult=document.getElementById("result");
		divResult.appendChild(divBunho);
		divResult.appendChild(divIrum);
		divResult.appendChild(divAverage);
	}
</script>
</head>
<body onload="toServer('${root}')">
	<h3>JSON OBJ</h3>
	<div id="result"></div>
</body>
</html>