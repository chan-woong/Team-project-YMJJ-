<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var ="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록 보기</title>
<style type="text/css">
	a{text-decoration: none;}
</style>
</head>
<body>
	<a href="${root}/index.jsp">시작 페이지</a>
	<div align="center">
		<table>
			<tr>
				<td width="620px" bgcolor="D1DBDB" align="right" height="30px">
					<a href="${root}/fileboard/write.do">글쓰기</a>
				</td>
			</tr>
		</table>
		
		<c:if test="${count == 0}">
			<table>
				<tr>
					<td width="620px" height="30px" align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${count > 0}">
			<table border="1">
				<tr>
					<td width="35px" height="30px" align="center">번호</td>
					<td width="250px" height="30px" align="center">제목</td>
					<td width="70px" height="30px" align="center">작성자</td>
					<td width="100x" height="30px" align="center">작성일</td>
					<td width="50px" height="30px" align="center">조회수</td>
				</tr>
				<c:forEach var="boardDto" items="${boardList}">
					<tr>
					<td width="50px" height="30px" align="center">${boardDto.boardNumber}</td>
					<td width="300px" height="30px" align="left">
						<c:if test="${boardDto.sequenceLevel > 0}">
							<c:forEach begin="0" end="${boardDto.sequenceLevel}">
								&nbsp;&nbsp;&nbsp;&nbsp;
							</c:forEach>
							[답글]
						</c:if>
						<a href="${root}/fileboard/read.do?boardNumber=${boardDto.boardNumber}&pageNumber=${currentPage}">${boardDto.subject}</a>
					</td>
					<td width="70px" height="30px" align="center">${boardDto.writer}</td>
					<td width="120x" height="30px" align="center"><fmt:formatDate value="${boardDto.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td width="50px" height="30px" align="center">${boardDto.readCount}</td>
				</tr>
				</c:forEach>
			</table>
		</c:if>
		<br/><br/>
		<!-- 페이지 번호 -->
		<fmt:parseNumber var="pageCount" value="${count/boardSize + (count % boardSize == 0 ? 0:1)}" integerOnly="true"/>
		<c:set var="pageBlock" value="${3}"/>
		
		<!-- 블락 시작번호   -->
		<fmt:parseNumber var="result" value="${((currentPage-1)/pageBlock)}" integerOnly="true"/>
		<c:set var="startPage" value="${result * pageBlock+1}"/>
		
		<!-- 블락 끝번호  -->
		<c:set var="endPage" value="${startPage+pageBlock-1}"/>
		
		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		<!-- 이전 버튼 -->
		<c:if test="${startPage > pageBlock}">
			<a href="${root}/fileboard/list.do?pageNumber=${startPage - pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="${root}/fileboard/list.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		<!-- 다음 버튼 -->
		<c:if test="${endPage < pageCount}">
			<a href="${root}/fileboard/list.do?pageNumber=${endPage + pageBlock}">[다음]</a>
		</c:if>
		<!-- 
		<div>
			총 페이지 수 : ${pageCount}
			시작 페이지 번호 : ${startPage}
			끝 페이지 번호 : ${endPage}
		</div>
		 -->
	</div>
</body>
</html>