<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 댓글 리스트</title>
<script type="text/javascript" src="${root}/ajax/xhr/xhr.js"></script>
<script type="text/javascript" src="${root}/reply/replyWrite.js"></script>
<script type="text/javascript" src="${root}/reply/replyDelete.js"></script>
<script type="text/javascript" src="${root}/reply/replyUpdate.js"></script>
<link type="text/css" rel="stylesheet" href="${root}/css/reply/reply.css"/>
</head>
<body>
	<h3>댓글 리스트</h3>
	<div>
		<input type="text" size="45" id="writReply" name="writer"/>
		<input type="button" value="댓글 작성" onclick="writeToserver('${root}')"/>
	</div>
	<div id="listAllDiv">
		<!-- 새로운 실시간 한줄 댓글 -->
		
		<!-- 기존 실시간 한줄 댓글 -->
		<c:forEach var="replyDto" items="${replyList}">
			<div class="replyDiv" id="${replyDto.bunho}">
				<span class="cssBunho">${replyDto.bunho}</span>
				<span class="cssReply">${replyDto.line_reply}</span>
				<span class="cssUpDel">
					<a href="javascript:deleteToServer('${replyDto.bunho}','${root}')">삭제</a>&nbsp;
					<a href="javascript:upSelectToServer('${replyDto.bunho}','${root}')">수정</a>
				</span>
			</div>
		</c:forEach>
	</div>
</body>
</html>