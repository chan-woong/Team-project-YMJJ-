<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant - Main</title>
<link rel="stylesheet" href="${root}/resources/css/restaurant/Restaurant_Main_Admin.css"/>
</head>
<body>

<div id="title"><a>Restaurant</a></div>

<div id="Main">

	<div style="font-size: 17px;"id="tag">
	
		<div style="border: 0px solid blue; float: left;" onclick="location.href='${root}/restaurant/main.do?RTtype=횟집'">횟집</div>
				
		<div style="border: 0px solid blue; float: left;" onclick="location.href='${root}/restaurant/main.do?RTtype=한식'">한식</div>
				
		<div style="border: 0px solid blue; float: left;" onclick="location.href='${root}/restaurant/main.do?RTtype=중국식'">중국식</div>
				
		<div style="border: 0px solid blue; float: left;" onclick="location.href='${root}/restaurant/main.do?RTtype=일식'">일식</div>
				
		<div style="border: 0px solid blue; float: left;" onclick="location.href='${root}/restaurant/main.do?RTtype=까페'">까페</div>
				
		<div style="border: 0px solid blue; float: left;" onclick="location.href='${root}/restaurant/main.do?RTtype=식육(숯불구이)'">식육(숯불구이)</div>
				
		<div style="border: 0px solid blue; float: left;" onclick="location.href='${root}/restaurant/main.do?RTtype=외국음식전문점(인도.태국등)'">외국음식전문점(인도.태국등)</div>
		
	</div>
	
	<c:if test="${Mid == 'admin'}">
   	 	<div id="btn_type">
		<input type="button" onclick="location.href='${root}/restaurant/write.do'" value="추가"/>
	</div>
	</c:if>
	<div style="font-size: 17px;" id="list">
		<c:forEach var="restaurantDto" items="${restaurantList}">
	         <li style="width: 340px; height: 200px; margin-left: 40px; ">
	            <a href="${root}/restaurant/introduction.do?RTnumber=${restaurantDto.RTnumber}&pageNumber=${currengPage}&Mid=${Mid}">
	            	<div><img alt="pictures" src="${root}/resources/img/${restaurantDto.RTIname}"></div>
	            	<div style="text-align: center; font-weight: bold;">${restaurantDto.RTname}</div>
	            </a>
	         </li>
        </c:forEach>
   </div>
		
	<div style="font-size: 17px" id="page">
		<%-- 총 페이지 수 --%>
		<fmt:parseNumber var="pageCount" value="${count/boardSize + (count % boardSize == 0 ? 0:1)}" integerOnly="true"/>
		<%-- 페이지 블럭 --%>
		<c:set var="pageBlock" value="${3}"/>
		
		<%-- 요청 페이지의 시작페이지 / 끝페이지 번호 --%>
		<fmt:parseNumber var="result" value="${(currengPage-1)/pageBlock}" integerOnly="true"/>
		<c:set var="startPage" value="${result*pageBlock+1}"/>
		<c:set var="endPage" value="${startPage+pageBlock-1}"/>
		
		<c:if test="${endPage >  pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		
		<c:if test="${startPage > pageBlock }">
			<a href="${root}/restaurant/main.do?pageNumber=${startPage-pageBlock}&RTtype=${RTtype}">[이전]</a>
		</c:if>
		
		<c:forEach var="i"  begin="${startPage}" end="${endPage}">
			<a href="${root}/restaurant/main.do?pageNumber=${i}&RTtype=${RTtype}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage < pageCount }">
			<a href="${root}/restaurant/main.do?pageNumber=${startPage+pageBlock}&RTtype=${RTtype}">[다음]</a>
		</c:if>
			
		<br/>
	</div>
	

</div>
</body>
</html>