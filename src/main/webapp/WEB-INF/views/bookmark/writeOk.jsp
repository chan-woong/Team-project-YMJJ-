<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 글작성</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	
	<c:if test="${check > 0 }">
		<script type="text/javascript">
			alert("북마크 추가가 완료 되었습니다.");
			location.href="${root}/restaurant/introduction.do?RTnumber=${RTnumber}&pageNumber=${pageNumber}&Mid=${Mid}"
		</script>
	</c:if>
	
	<c:if test="${check == 0 }">
		<script type="text/javascript">
			alert("북마크 추가가 되지 않았습니다.");
			location.href="${root}/restaurant/introduction.do?RTnumber=${RTnumber}&pageNumber=${pageNumber}"
			
		</script>
	</c:if>
	
</body>
</html>