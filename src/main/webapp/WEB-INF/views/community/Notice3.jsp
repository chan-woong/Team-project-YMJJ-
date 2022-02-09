<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${root}/resources/css/community/ReviewStyle.css" />
<script type="text/javascript">
	function delFun(root, cnumber){
		var url=root + "/community/NoticeDeleteOk.do?cnumber=" + cnumber;
		alert(url);
		
		location.href=url;
	}
	
	function upFun(root, cnumber){
		var url=root + "/community/NoticeUpdate.do?cnumber=" + cnumber ;
		// alert(url);
		
		location.href=url;
	}

</script>
<!-- 어드민 계정 노티스 목록 -->
</head>
<body>
	<div>
		<div id="title">
			<a>Community</a>
		</div>
		<div id="menuF">
		
			<!-- 왼쪽 카테고리 -->
			<div id="category">
				<div id="detail" style="border-left: 0px;"></div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/ReviewList.do'">
					<a>Review</a>
				</div>
				
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/EventList.do'">
					<a>Event</a>
				</div>
				
				<div id="detail" style="border-right: 0px; cursor: pointer;"
					onclick="location.href='${root}/community/Notice3.do'">
					<a>Notice</a>
				</div>
				
				<div id="detail"
					style="height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>
			
			
			<!-- 메인 -->
			<div id="content">
				<div id="mid1" style="height: 118px;">
					<span id="viewcount"
						style="font-size: 50px; margin-top: 30px; margin-left: 30px;">Notice</span>
					<span id="mid1_button">
					
						<c:if test="${Mid == 'admin' }">
							<input  type="button" value="작성" onclick="location.href='${root}/community/NoticeWrite.do'"
								style="margin-right: 50px; margin-top: 50px; height: 30px; width: 50px;" />
						</c:if>
					</span>
				</div>
				
				<!-- 메인 고지사항 -->
				<div id="notice1">	
					<c:if test="${count==0}">
						<div id="notice">
							<h3>공지사항이 없습니다.</h3>
						</div>
					</c:if>
					
					<c:if test="${count >0}">
						<c:forEach var="noticeBoardDto" items="${noticeBoardList}">
							<div id="notice">
								<details>
									<summary>${noticeBoardDto.ctitle}</summary>
									<p>${noticeBoardDto.ccontent}
										<c:if test="${Mid == 'admin' }">
											<input id="button2" type="button" value="삭제" onclick="delFun('${root}','${noticeBoardDto.cnumber}')"/>
											<input id="button2" type="button" value="수정" onclick="upFun('${root}','${noticeBoardDto.cnumber}')"/>
										</c:if>
									</p>
								</details>
							</div>
						</c:forEach>
					</c:if>		
				</div>
				
				
				
			</div>
			
			
			
		</div>
	</div>
</body>
</html>