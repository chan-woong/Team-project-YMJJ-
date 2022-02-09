<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<script type="text/javascript">
	function sendAddress(RTnumber, RTname){
		opener.reviewForm.RTnumber.value=RTnumber;
		opener.reviewForm.RTname.value=RTname;
		self.close();
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<form action="${root}/community/RestaurantSearch.do" method="get">
			<table>
				<tr>
					<td>
						<input type="text" name="RTname"/>
						<input type="submit" value="검색"/>
					</td>
				</tr>
			</table>
		</form>
		
		<table>
			<c:choose>
				<c:when test="${RTlist.size()==0}">
					<tr>
						<td>검색된 결과가 없습니다.</td>
					</tr>
				</c:when>	
				
				<c:when test="${RTlist.size() > 0}">
					<tr>
						<td>아래의 우편번호를 클릭하세요.</td>
					</tr>
					
					<c:forEach var="RTlist" items="${RTlist}">
						<tr>
							<td>
								<a href="javascript:sendAddress('${RTlist.RTnumber}', '${RTlist.RTname}')">
																		    
									식당이름 : ${RTlist.RTname}, 식당번호 : ${RTlist.RTcallnumber1}-${RTlist.RTcallnumber2}-${RTlist.RTcallnumber3}
								</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
</body>
</html>