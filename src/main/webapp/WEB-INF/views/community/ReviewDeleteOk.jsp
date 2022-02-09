<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
</head>
<body>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("삭제 되었습니다.");
			location.href="${root}/community/ReviewList.do?pageNumber=${pageNumber}";
		</script>
	</c:if>

	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("삭제 되지않았습니다. \n 비밀번호를 확인하세요.");
			location.href= history.back();
		</script>
	</c:if>
</body>
</html>