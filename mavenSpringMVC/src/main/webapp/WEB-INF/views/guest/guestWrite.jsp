<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록 쓰기</title>
<link rel="stylesheet"  href="${root}/css/guest/guestStyle.css"/>
<script type="text/javascript" src="${root}/javascript/guest/write.js"></script>
</head>
<body>
	<%-- 방명록 List, 총레코드 수 , 한페이지당 게시물 수, 요청페이지 --%>
	<div align="center">
		<form class="form_style" 
				  action="${root}/guest/writeOk.do"
				  method="post">
				  
			<div class="title">
				<label>이름</label>
				<input type="text" name="name" size="10" style="margin-right:10px;"/>
				
				<label>비밀번호</label>
				<input type="password" name="password"/>
			</div>
			
			<div class="content">
				<textarea rows="5" cols="55" name="message"></textarea>
			</div>
			
			<div class="title" style="text-align:right;" >
				<input type="submit" value="확인"/>
				<input type="reset" value="취소"/>
			</div>
		</form>
	</div>
</body>
</html>











