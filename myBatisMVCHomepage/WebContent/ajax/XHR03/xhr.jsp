<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJXA</title>
<script type="text/javascript" src="postXHR.js"></script>
</head>
<body>
	<h3>응답내용</h3>
	
	<form action="#" id="createForm">
		<label>아이디</label>
		<input type="text" name="id"/><br/>
		
		<label>비밀번호</label>
		<input type="password" name="password"/><br/>
		
		<input type="button" onclick="startRequest()" value="요청" /><br/>
	</form>
	
	<div id="resultDisp"></div>
</body>
</html>