<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet" href="${root}/resources/css/member/member.css"/>
</head>
<body>
    <div id="login">
        <div id="log_title" style="font-size: 50px;">YMJJ</div>
        <form action="${root}/member/loginOk.do" method="post">
	        <div id="log_content">
	            <label>ID</label>
	            <input type="text" name="Mid"/>
	        </div>
	        <div id="log_content">
	            <label>Password</label>
	            <input type="password" name="Mpassword"/>
	        </div>
	        <div id="log_content">
	            <label></label>
	            <input type="submit" value="Login"/>
	            <input type="button" value="Join" id="JoinBut" onclick="location.href='${root}/member/join.do'"/>
	        </div>
        </form>
    </div>
</body>
</html>