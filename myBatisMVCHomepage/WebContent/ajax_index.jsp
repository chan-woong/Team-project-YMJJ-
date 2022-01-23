<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX</title>
<style type="text/css">
	a{text-decoration: none;}
</style>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<h3>기상청 Parsing</h3>
	<a href="${root}/parsing.do">기상청</a>
	<br/><br/>
	
	<h3>JSON</h3>
	<a href="${root}/json.do?msg=obj">JSON-Object</a><br/>
	<a href="${root}/json.do?msg=arr">JSON-Array</a><br/>
	<a href="${root}/json.do?msg=mix">JSON-Object,Array</a>
	<br/><br/>
	<h3>사원 목록</h3>
	<a href="${root}/sawon/list.do">사원 리스트</a><br/>
	
	
	<br/><br/>
	<h3>실시간 댓글</h3>
	<a href="${root}/reply/replyList.do">실시간 댓글 리스트</a><br/>
	
</body>
</html>