<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 확인</title>
</head>
<body>
	<c:set var ="root" value="${pageContext.request.contextPath}"/>
	<c:if test="${check == 1}">
		<script type="text/javascript">
			alert("회원가입이 완료 되었습니다.");		// alert 알람창
			location.href="${root}/member/login.do";					// location.href = 홈페이지 이동
		</script>
	</c:if>
	
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("회원가입에 실패했습니다.");		// alert 알람창
			location.href="${root}/member/register.do";					// location.href = 홈페이지 이동
		</script>
	</c:if>
	
</body>
</html>