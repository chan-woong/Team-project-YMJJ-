
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript" src="${root}/ajax/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root) {
		var url = root+"/pXML.do";
		sendRequest("GET", url, null, fromServer);
	}
	function fromServer() {
		if (xhr.readyState==4&&xhr.status==200) {
			//alert(xhr.responseXML);
			processXML();
		}
		//alert(xhr.status);
	}
	function processXML() {
		var xmlDoc=xhr.responseXML;
		
		var titleWf=xmlDoc.getElementsByTagName("wf");
		document.getElementById("titleWf").innerHTML = titleWf[0].childNodes[0].nodeValue;
		
		var location=xmlDoc.getElementsByTagName("location");
		document.getElementById("location_cnt").innerHTML = location.length + "지역" ;
		var city=location[0].getElementsByTagName("city");
		document.getElementById("city").innerHTML = city[0].childNodes[0].nodeValue;
		var data=location[0].getElementsByTagName("data");
		var wf=data[0].getElementsByTagName("wf");
		document.getElementById("Wf").innerHTML = wf[0].childNodes[0].nodeValue;
	}
</script>
</head>

<body onload="toServer('${root}')">
	<h3>날씨 정보</h3>
	<div id="titleWf"></div><br/>
	<div id="location_cnt"></div><br/>
	<div id="city"></div><br/>
	<div id="Wf"></div><br/>
</body>
</html>