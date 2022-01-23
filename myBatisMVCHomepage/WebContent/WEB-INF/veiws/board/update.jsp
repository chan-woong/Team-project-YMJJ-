<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var ="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<link rel="stylesheet" href="${root}/css/board/boardStyle.css">
</head>
<body>
	<a href="${root}/index.jsp">시작 페이지</a>
	<div>
		<form action="${root}/board/updateOk.do" method="post">
		
			<input type="hidden" name="boardNumber" value="${boardDto.boardNumber}"/>
			<input type="hidden" name="pageNumber" value="${pageNumber}"/>
			
			<div id="form_style">
				<div class="explanation">
					<a href="${root}/board/list.do">글목록</a>
				</div>
				<div>
					<label class="title">작성자</label>
					<samp class="content"><input type="text" name="writer" value="${boardDto.writer}" disabled="disabled"/></samp>
				</div>
				<div>
					<label class="title">제목</label>
					<samp class="content">
						<input type="text" name="subject" size="50" value="${boardDto.subject}"/>
					</samp>
				</div>
				<div>
					<label class="title">이메일</label>
					<samp class="content">
						<input type="email" name="email" size="30" value="${boardDto.email}"/>
					</samp>
				</div>
				<div>
					<label class="titleB">내용</label>
					<samp class="contentB">
						<textarea rows="13" cols="50" name="content" style="margin-top: 10px;">${boardDto.content}</textarea>
					</samp>
				</div>
				<div>
					<label class="title">비밀번호</label>
					<samp class="content">
						<input type="password" name="password" value="${boardDto.password}"disabled="disabled"/>
					</samp>
				</div>
				<div class="end">
					<input type="submit"value="글수정"/>
					<input type="reset"value="다시작성"/>
					<input type="button"value="목록보기" onclick="location.href='${root}/board/list.do?pageNumber=${pageNumber}'"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>