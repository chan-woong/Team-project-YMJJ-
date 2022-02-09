<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet"
	href="${root}/resources/css/community/ReviewStyle.css" />
</head>
<body>
	<div>
		<div id="title">
			<a>Community</a>
		</div>
		<div id="menuF">
			<div id="category">
				<div id="detail" style="border-left: 0px;"></div>
				<div id="detail" style="border-right: 0px;"
					onclick="location.href='${root}/community/ReviewList.do';">
					<a>Review</a>
				</div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/EventList.do';">
					<a>Event</a>
				</div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/Notice3.do';">
					<a>Notice</a>
				</div>
				<div id="detail"
					style="cursor: pointer; height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>

			<c:if test="${count == 0 and Mid != null}">
				<div id="content" style="text-align: center; line-height: 750px;">
					<a href="${root}/community/ReviewWrite.do"> 아직 리뷰가 없습니다! 리뷰를
						작성해주세요! </a>
				</div>
			</c:if>

			<c:if test="${count == 0 and Mid == null}">
				<div id="content" style="text-align: center; line-height: 750px;">
					아직 리뷰가 없습니다! 리뷰를 작성해주세요!</div>
			</c:if>


			<c:if test="${count > 0}">

				<div id="content">
					<c:forEach var="reviewDto" items="${ReviewList}">
						<div id="card"
							onclick="location.href='${root}/community/ReviewRead.do?RVnumber=${reviewDto.RVnumber}&pageNumber=${currentPage}';">
							<div id="card_content">${reviewDto.RVcontent}</div>
							<div id="card_title">
								<div id="card_frame">
									<%--  								<a href="${root}/community/ReviewRead.do?RVnumber=${reviewDto.RVnumber}&pageNumber=${currentPage}"> --%>
									<img src="${root}/resources/img/${reviewDto.RVimgname}">
									</a>
									<div id="card_text">
										<div id="card_text2">제목:${reviewDto.RVtitle}</div>
										식당명:${reviewDto.RTname}
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

					<div id="reviewListBot">
						<div id="button">
							<%-- 총 페이지 수 --%>
							<fmt:parseNumber var="pageCount"
								value="${count/boardSize + (count % boardSize == 0 ? 0:1)}"
								integerOnly="true" />

							<%-- 페이지 블럭 --%>
							<c:set var="pageBlock" value="${3}" />

							<%-- 요청 페이지의 시작페이지 / 끝페이지 번호 --%>
							<fmt:parseNumber var="result"
								value="${(currentPage-1)/pageBlock}" integerOnly="true" />
							<c:set var="startPage" value="${result*pageBlock+1}" />
							<c:set var="endPage" value="${startPage+pageBlock-1}" />

							<c:if test="${endPage >  pageCount}">
								<c:set var="endPage" value="${pageCount}" />
							</c:if>

							<c:if test="${startPage > pageBlock }">
								<a
									href="${root}/community/ReviewList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
							</c:if>

							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<a href="${root}/community/ReviewList.do?pageNumber=${i}">[${i}]</a>
							</c:forEach>

							<c:if test="${endPage < pageCount }">
								<a
									href="${root}/community/ReviewList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
							</c:if>

							<!-- 						<button id="button1"><</button> -->
							<!-- 						<button id="button1">1</button> -->
							<!-- 						<button id="button1">2</button> -->
							<!-- 						<button id="button1">3</button> -->
							<!-- 						<button id="button1">></button> -->
						</div>
						<c:if test="${Mid != null}">
							<div>
								<a href="${root}/community/ReviewWrite.do"> <input
									type="button" value="작성"
									style="float: right; margin-right: 30px; cursor: pointer;" />
								</a>
							</div>
						</c:if>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>