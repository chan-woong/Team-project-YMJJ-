<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/community/EventStyle.css" />

<!-- 어드민 계정 이벤트 목록 -->
</head>
<body>
	<div>
		<div id="title">
			<a>Community</a>
		</div>
		<div id="menuF">
			<div id="category">
				<div id="detail" style="border-left: 0px;"></div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/ReviewList.do'">
					<a>Review</a>
				</div>
				<div id="detail" style="border-right: 0px; cursor: pointer;"
					onclick="location.href='${root}/community/EventList.do'">
					<a>Event</a>
				</div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/Notice3.do'">
					<a>Notice</a>
				</div>
				<div id="detail"
					style="height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>
			<div id="content">
				<div
					style="border: 2px black solid; width: 1175px; height: 600px; margin-top: 40px; margin-left: 40px;">
					
					<c:if test="${count==0}">
						<h3>이벤트가 없습니다.</h3>
					</c:if>
						
						
						<!-- 임시 안쓰는 코드 -->
					<c:if test="${boardDto.fileName !=null}">
						
								<a href="${root}/fileboard/downLoad.do?boardNumber=${eventDto.enumber}">
									${eventDto.efilename} </a>
						
			
					</c:if>
							
					<c:if test="${count>0}">
						<c:forEach var="eventDto" items="${eventList}">
							<div id="card" onclick="location.href='${root}/community/EventRead.do?enumber=${eventDto.enumber}&pageNumber=${currentPage}'">
								<img src="${root}/resources/img/${eventDto.efilename}" width=245 height=245px/>
								<div style="text-align: center; font-style: normal;">${eventDto.etitle}</div>		
							</div>
						</c:forEach>		
					</c:if>
				</div>
				
				
				<div id="button">
					<%-- 총 페이지 수 --%>
					<fmt:parseNumber var="pageCount" value="${count/eventSize + (count % eventSize == 0 ? 0:1)}" integerOnly="true"/>
				
					<%-- 페이지 블럭 --%>
					<c:set var="pageBlock" value="${3}"/>
				
					<%-- 요청 페이지의 시작페이지 / 끝페이지 번호 --%>
					<fmt:parseNumber var="result" value="${(currengPage-1)/pageBlock}" integerOnly="true"/>
					<c:set var="startPage" value="${result*pageBlock+1}"/>
					<c:set var="endPage" value="${startPage+pageBlock-1}"/>
		
					<c:if test="${endPage >  pageCount}">
						<c:set var="endPage" value="${pageCount}"/>
					</c:if>
				
					<c:if test="${startPage > pageBlock}">
						<a href="${root}/community/EventList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
					</c:if>
		
					<c:forEach var="i"  begin="${startPage}" end="${endPage}">
						<a href="${root}/community/EventList.do?pageNumber=${i}">[${i}]</a>
					</c:forEach>
		
					<c:if test="${endPage < pageCount}">
						<a href="${root}/community/EventList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
					</c:if>
				
					<!-- 가이드 이미지
					<button id="button1"><</button>
					<button id="button1">1</button>
					<button id="button1">2</button>
					<button id="button1">3</button>
					<button id="button1">></button>
					-->
				</div>
	
				
							
				
				<c:if test="${Mid == null }">
				
				</c:if>
				
				<c:if test="${Mid == 'admin' }">
					<div>
						<input type="button" value="작성"
						onclick="location.href='${root}/community/EventWrite.do'"
						style="float: right; margin-right: 30px; cursor: pointer;" />
					</div>
				
				</c:if>
					
			</div>

		</div>
	</div>

</body>
</html>