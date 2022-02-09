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
	<div align="center" style="margin-top: 300px;"> 
		<form action="${root}/community/ReviewDeleteOk.do" method="post">
			<input type="hidden" name="RVnumber"  value="${RVnumber}"/>
			<input type="hidden" name="pageNumber"  value="${pageNumber}"/>
			<input type="hidden" name="Mid" value="${Mid}">
			<input type="hidden" name="imgPath" value="${reviewDto.RVimgpath}">
			
			<table border="1">
				<tr>
					<td align="center" bgcolor="D1DBDB" width="400">
						회원 비밀번호 입력해주세요.
					</td>
				</tr>
				
				<tr>
					<td align="center" bgcolor="D1DBDB" width="400">
						<input type="password" name="password"/>
					</td>
				</tr>
				
				<tr>
					<td align="center" width="400">
						<input type="submit" value="글삭제"/>
						<input type="button" value="글목록" onclick="location.href='${root}/community/ReviewList.do?pageNumber=${pageNumber}'"/>
					</td>
				</tr>
			
			</table>
			
		</form>
	</div>

</body>
</html>