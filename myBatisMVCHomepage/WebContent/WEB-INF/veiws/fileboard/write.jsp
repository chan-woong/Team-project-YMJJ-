<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var ="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 작성</title>
<link rel="stylesheet" href="${root}/css/fileboard/boardStyle.css">
</head>
<body>
	<h4>
		boardNumber : ${boardNumber}
		groupNumber : ${groupNumber}
		sequenceNumber : ${sequenceNumber}
		sequenceLevel : ${sequenceLevel}
	</h4>
	<a href="${root}/index.jsp">시작 페이지</a>
	<div>
		<form action="${root}/fileboard/writeOk.do" method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="boardNumber" value="${boardNumber}"/>
			<input type="hidden" name="groupNumber" value="${groupNumber}"/>
			<input type="hidden" name="sequenceNumber" value="${sequenceNumber}"/>
			<input type="hidden" name="sequenceLevel" value="${sequenceLevel}"/>
			
			<div id="form_style">
				<div class="explanation">
					<a href="${root}/fileboard/list.do">글목록</a>
				</div>
				<div>
					<label class="title">작성자</label>
					<samp class="content"><input type="text" name="writer"/></samp>
				</div>
				<div>
					<label class="title">제목</label>
					<samp class="content">
						<input type="text" name="subject" size="50"/>
					</samp>
				</div>
				<div>
					<label class="title">이메일</label>
					<samp class="content">
						<input type="email" name="email" size="30"/>
					</samp>
				</div>
				<div>
					<label class="titleB">내용</label>
					<samp class="contentB">
						<textarea rows="13" cols="50" name="content" style="margin-top: 10px;"></textarea>
					</samp>
				</div>
				
				<div>
					<label class="title">파일명</label>
					<samp class="content">
						<input type="file" name="file"size="40"/>
					</samp>
				</div>
				<div>
					<label class="title">비밀번호</label>
					<samp class="content">
						<input type="password" name="password"/>
					</samp>
				</div>
				<div class="end">
					<input type="submit"value="글쓰기"/>
					<input type="reset"value="다시작성"/>
					<input type="button"value="목록가기" onclick="location.href='${root}/fileboard/list.do'"/>
				</div>
			</div>
		</form>
	</div>
</body>
</html>