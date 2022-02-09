<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제</title>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<c:set var="RTnumber" value="${RTnumber}"/>
	<c:set var="pageNumber" value="${pageNumber}"/>
	
	<div align="center"> 
		<form action="${root}/restaurant/RestaurantdeleteOk.do" method="get">
			<table border="1" style="margin-top: 300px">
				<tr>
					<td align="center" width="400">
						<li>정말로 삭제하시겠습니까?</br></li>
						<input type="button" onclick="location.href='${root}/restaurant/RestaurantdeleteOk.do?RTnumber=${RTnumber}&pageNumber=${pageNumber}'" value="삭제"/>
						<input type="button" onclick="location.href='${root}/restaurant/main.do'" value="목록"/>
					</td>
				</tr>
			
			</table>
			
		</form>
	</div>
</body>
</html>