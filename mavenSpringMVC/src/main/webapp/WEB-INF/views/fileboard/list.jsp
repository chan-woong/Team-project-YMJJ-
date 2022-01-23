<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록보기</title>
<%-- <link rel="stylesheet" href="${root}/css/board/boardStyle.css"> --%>
<style type="text/css">
	a{text-decoration: none;}
</style>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td width="617" bgcolor="D1DBDB" align="right" height="30">
					<a href="${root}/fileboard/write.do">글쓰기</a>
				</td>
			</tr>
		</table>
		
		<c:if test="${count==0}">
			<table>
				<tr>
					<td width="617" height="30" align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
		</c:if>
		
		<c:if test="${count > 0}">
			<table border="1">
				<tr>
					<td width="50" height="30" align="center">번호</td>
					<td width="300" height="30" align="center">제목</td>
					<td width="70" height="30" align="center">작성자</td>
					<td width="120" height="30" align="center">작성일</td>
					<td width="50" height="30" align="center">조회수</td>
				</tr>
				
				<c:forEach var="fileBoardDto" items="${boardList}">
					<tr>
						<td width="50" height="30" align="center">${fileBoardDto.boardNumber}</td>
						
						<td width="300" height="30" align="left">
						
							<c:if test="${fileBoardDto.sequenceLevel > 0 }">
								<c:forEach begin="0" end="${fileBoardDto.sequenceLevel}">
									&nbsp;&nbsp;&nbsp;&nbsp;
								</c:forEach>
								[답글]
							</c:if>
							
							<a href="${root}/fileboard/read.do?boardNumber=${fileBoardDto.boardNumber}&pageNumber=${currengPage}">
								${fileBoardDto.subject}
							</a>
						</td>
						
						<td width="70" height="30" align="center">${fileBoardDto.writer}</td>
						<td width="120" height="30" align="center">
							<fmt:formatDate value="${fileBoardDto.writeDate}" pattern="yyyy-MM-dd hh:mm:ss"/>
						</td>
						<td width="50" height="30" align="center">${fileBoardDto.readCount}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
		<br/>
		
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
			<a href="${root}/fileboard/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i"  begin="${startPage}" end="${endPage}">
			<a href="${root}/fileboard/list.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage < pageCount }">
			<a href="${root}/fileboard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
			
		<br/><br/>
		<div>
			총 페이지 : ${pageCount }
			시작페이지 번호 : ${startPage }
			끝페이지 번호 : ${endPage }
		</div>
	</div>

</body>
</html>





















