<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<body>
	<c:set var ="root" value="${pageContext.request.contextPath}"/>
	<c:if test="${check > 0}">
		<script type="text/javascript">
			alert("방명록 작성 완료 되었습니다.");
			location.href="${root}/guest/write.do";
		</script>
	</c:if>
	<c:if test="${check == 0}">
		<script type="text/javascript">
			alert("방명록 작성에 실패했습니다.");
			location.href="${root}/guest/write.do";
		</script>
	</c:if>
</body>
</html>