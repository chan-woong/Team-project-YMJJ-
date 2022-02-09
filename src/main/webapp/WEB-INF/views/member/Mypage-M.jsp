<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage - M</title>
<link rel="stylesheet" href="${root}/resources/css/member/member.css"/>
</head>
<body>
    <div>
        <div id="title"><a style="font-size: 50px;">Mypage</a></div>
        <div id="menuF">
            <div id="category">
                <div id="detail" style="border-left: 0px;"></div>
                <div id="detail" style="border-right: 0px;"><a>Account</a></div>
                <div id="detail" style="height: 690px; border-left: 0px; border-bottom: 0px;"></div>
            </div>
            <div id="content">
                <div style="float: left; margin-top: 60px; margin-left: 50px; font-size: 50px;">Account</div>
                <div style="border : 2px black solid; width: 900px; height: 640px; margin-top: 40px;margin-right: 110px;overflow: auto;">
					<c:if test="${count > 0}">
						<table border="1">
							<tr>
								<td width="200px" height="30px" align="center">ID</td>
								<td width="200px" height="30px" align="center">이름</td>
								<td width="200px" height="30px" align="center">전화번호</td>
								<td width="200px" height="30px" align="center">이메일</td>
							</tr>
							
							<c:forEach var="memberDto" items="${memberList}">
								<tr onclick="location.href='${root}/member/Mypage-M-D.do?Mid=${memberDto.mid}'">
								<td width="200px" height="30px" align="center">${memberDto.mid}</td>
								
								<td width="200px" height="30px" align="left">${memberDto.mname}</td>
								
								<td width="200px" height="30px" align="center">${memberDto.mcallnumber1} - ${memberDto.mcallnumber2} - ${memberDto.mcallnumber3}</td>
								<td width="200px" height="30px" align="center">${memberDto.memail}</td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
					<c:if test="${count == 0}">
						<table>
							<tr>
								<td width="850px" height="30" align="center">회원이 존재하지 않습니다.</td>
							</tr>
						</table>
					</c:if>
            	</div>
            </div>
        </div>
    </div>
</body>
</html>