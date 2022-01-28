<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>	
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${memberDto !=null}">
		<c:set var="Mid" value="${memberDto.mid}" scope="session"/>
		<c:set var="Mname" value="${memberDto.mname}" scope="session"/>
	
		<script type="text/javascript">
			alert("로그인 성공");
			location.href="${root}";
		</script>
	</c:if>
	
	<c:if test="${memberDto == null}">
		<script type="text/javascript">
			alert("입력하신 정보가 존재하지 않습니다.");
			location.href="${root}/member/login.do";
		</script>
	</c:if>
</body>
</html>










