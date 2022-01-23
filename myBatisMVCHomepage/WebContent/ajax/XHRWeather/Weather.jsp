<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청</title>
<script type="text/javascript" src="../xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer() {
		var url ="https://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
		sendRequest("GET", url, null, fromServer);
	}
	function fromServer() {
		if (xhr.readyState==4&&xhr.status==200) {

		}
		alert(xhr.status);
	}
</script>
</head>
<body onload="toServer()">

</body>
</html>