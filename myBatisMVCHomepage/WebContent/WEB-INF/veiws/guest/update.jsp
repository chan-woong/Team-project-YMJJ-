<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var ="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정</title>
<script type="text/javascript" src="${root}/javascript/guest/write.js"></script>
<link rel="stylesheet"  href="${root}/css/guest/WeireStyle.css">
</head>
<body>
	<a href="${root}/index.jsp">시작 페이지</a>
	<div align="center" id="form_style">
		<form action="${root}/guest/updateOk.do" method="post" name="writeForm">
			<div class="title">
				<input type="hidden" name="num" value="${guestDto.num}"/>
				<label>이름</label>
				<input type="text"name="name"size="10" value="${guestDto.name}" disabled="disabled"/>
				
				<label>비밀번호</label>
				<input type="password"name="password" value="${guestDto.password}" disabled="disabled"/>
			</div>
			
			<div class="content">
				<textarea rows="5" cols="53"name="message">${guestDto.message}</textarea>
			</div>
			
			<div class="title" style="text-align: right;">
				<input type="submit"value="수정"/>
				<input type="reset"value="취소"/>
			</div>
		</form>
	</div>
</body>
</html>