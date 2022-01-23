<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var ="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 쓰기</title>
<script type="text/javascript" src="${root}/javascript/guest/write.js"></script>
<link rel="stylesheet"  href="${root}/css/guest/WeireStyle.css">
</head>
<body>
	<a href="${root}/index.jsp">시작 페이지</a>
	<div align="center" id="form_style">
		<c:if test="${count==0 || currentPage==1}">
			<form action="${root}/guest/writeOk.do" method="post" name="writeForm">
				<div class="title">
					<label>이름</label>
					<input type="text"name="name"size="10"/>
					
					<label>비밀번호</label>
					<input type="password"name="password"/>
				</div>
				
				<div class="content">
					<textarea rows="5" cols="53"name="message"></textarea>
				</div>
				
				<div class="title" style="text-align: right;">
					<input type="submit"value="확인"/>
					<input type="reset"value="취소"/>
				</div>
			</form>
		</c:if>
		<!-- ${guestList.size()} -->
		<c:if test="${guestList.size() > 0}">
			<c:forEach var="guestDto" items="${guestList}">
				<div id="form_style" style="height: 130px;">
					<div class="disp" style="border-width: 1px;">
						${guestDto.name}
						<fmt:formatDate value="${guestDto.writeDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
						
						<a href="javascript:updateCheck('${guestDto.num}','${root}')">수정</a>
						<a href="javascript:deleteCheck('${guestDto.num}','${root}')">삭제</a>	
					</div>
					
					<div class="disp-content">${guestDto.message}</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<br/><br/><br/>
	<!-- 페이지 번호 -->
	<%-- 1. 총페이지 수 = 전체레코드 / 한 페이지당 게시물 수.. 200/10=10페이지, 201-10=21페이지  
		 2. 페이지 블락 정하기 : 10
		 	2-1) 블럭 start 번호 , end 번호 구하기
		 	2-2) 계산 방법
		 		요청페이지 : 5page, 총페이지 수 : 200/10=20page, 페이지 블럭 : 10
		 		
		 		int startPage=(int)((currentPage-1)/pageBlock)*pageBlock+1
		 								((5-1=4)/10=0.4)=0*10=0+1=1
		 								((25-1=24)/10=2.4)=2*10=20+1=21
		 		int endPage=startPage+pageBlock-1
		 						1+10-1=10
		 						21+10-1=30
		3. 이전, 다음 처리
			3-1) 이전 : startPage > pageBlock / startPage - pageBlock
			3-2) 다음 : endPage < pageCount   / startPage + pageBlock
	
	--%>
	<div align="center">
		<c:if test="${count > 0}">
			<!-- 총 페이지수  -->
			<fmt:parseNumber var="pageCount" value="${count / boardSize + (count % boardSize == 0 ? 0:1)}" integerOnly="true"/>
		</c:if>
		<!-- 페이지 블락  -->
		<c:set var="pageBlock" value="${5}"/>
		<!-- 블락 시작번호   -->
		<fmt:parseNumber var="rs" value="${((currentPage-1)/pageBlock)}" integerOnly="true"/>
		<c:set var="startPage" value="${rs * pageBlock+1}"/>
		<!-- 블락 끝번호  -->
		<c:set var="endPage" value="${startPage+pageBlock-1}"/>

		<c:if test="${endPage > pageCount}">
			<c:set var="endPage" value="${pageCount}"/>
		</c:if>
		<!-- 이전 버튼 -->
		<c:if test="${startPage > pageBlock}">
			<a href="${root}/guest/write.do?pageNumber=${startPage - pageBlock}">[이전]</a>
		</c:if>
		
		<!-- 번호 버튼 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href="${root}/guest/write.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<!-- 다음 버튼 -->
		<c:if test="${endPage < pageCount}">
			<a href="${root}/guest/write.do?pageNumber=${startPage + pageBlock}">[다음]</a>
		</c:if>
		
		<!-- <div>pageCount : ${pageCount}startPage : ${startPage}endPage : ${endPage}</div> -->
	</div>
</body>
</html>