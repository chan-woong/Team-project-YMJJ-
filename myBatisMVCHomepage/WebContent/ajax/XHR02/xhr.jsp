<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJXA</title>
<script type="text/javascript" src="xhr.js"></script>
</head>
<body>
	<h3>응답내용</h3>
	
	<form action="#">
		<input type="button" value="정보요청" onclick="sendRequest()"/>
	</form>
	
	<div id="dispResult"></div>
</body>
</html>