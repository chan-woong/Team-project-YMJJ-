<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC HomePage</title>
</head>
<body>
	<c:set var ="root" value="${pageContext.request.contextPath}"/>
	<h3>회원 관리</h3>
	
	<c:if test="${id == null}">
		<a href="${root}/member/register.do">회원가입</a>&nbsp;&nbsp;
		<a href="${root}/member/login.do">로그인</a>
	</c:if>
	<c:if test="${id != null}">
		<a href="${root}/member/logout.do">로그아웃</a>&nbsp;&nbsp;
		<a href="${root}/member/update.do">회원수정</a>&nbsp;&nbsp;
		<a href="${root}/member/delete.do">회원탈퇴</a>&nbsp;&nbsp;
	</c:if>
	<c:if test="${memberLevel == 'MA'}">
		<h3>관리자 매뉴</h3>
		<a href="${root}/member/">회원목록</a>&nbsp;&nbsp;
	</c:if>
	<br/><br/>
	<h3>방명록</h3>
	<a href="${root}/guest/write.do">방명록 작성</a>
	<br/><br/>
	<h3>게시판</h3>
	<a href="${root}/board/write.do">게시판 쓰기</a>
	<a href="${root}/board/list.do">게시판 목록</a>	
	
	<br/><br/>
	<h3>파일 게시판</h3>
	<a href="${root}/fileboard/write.do">파일 게시판 쓰기</a>
	<a href="${root}/fileboard/list.do">파일 게시판 목록</a>	
</body>
</html>