<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<a>한식</a>
		
		<a>일식</a>
		
		<a>중식</a>
		
		<a>양식</a>
		
	</div>
	
	<div id="btn_type">
		<input type="button" onclick="location.href='${root}/restaurant/write.do'" value="추가"/>
		<input type="button" onclick="location.href='${root}/restaurant/Restaurant_Update.do'" value="수정"/>
		<input type="button" onclick="location.href='${root}/restaurant/RestaurantdeleteOk.do'" value="삭제"/>
	</div>

	<div style="font-size: 17px;" id="list">
		<c:forEach var="restaurantDto" items="${restaurantList}">
         <li style="width: 340px; height: 200px; margin-left: 40px; ">
            <a href="${root}/restaurant/introduction.do?RTnumber=${restaurantDto.RTnumber}&pageNumber=${currengPage}">
            	<div><img alt="pictures" src="${root}/resources/img/${restaurantDto.RTIname}"></div>
            	<div style="text-align: center; margin-top: 130px; font-weight: bold;">${restaurantDto.RTname}</div>
            </a>
         </li>
        </c:forEach>
   </div>
		
	<div style="font-size: 17px" id="page">
		<%-- 페이지번호  
				1. 한페이지당 게시물 수 : boardSize
				2. 총 페이지 수 : count 100 / boardSize 10 = 10page
				3. 페이지 블럭 : 
							- 시작페이지번호 : (int) ((currengPage-1)/pageBlock)*pageBlock+1    (3-1)=2/10=0.2*10=0+1=1
							- 끝페이지 번호 :  시작페이지번호+pageBlock-1
				            - 다음/이전

		--%> 
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
			<a href="${root}/restaurant/main.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i"  begin="${startPage}" end="${endPage}">
			<a href="${root}/restaurant/main.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage < pageCount }">
			<a href="${root}/restaurant/main.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
			
		<br/><br/>
		<div>
			총 페이지 : ${pageCount }
			시작페이지 번호 : ${startPage }
			끝페이지 번호 : ${endPage }
		</div>
	</div>
	

</div>
</body>
</html>