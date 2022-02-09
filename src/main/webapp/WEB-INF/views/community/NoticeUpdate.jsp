<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/community/ReviewStyle.css" />
<!-- 어드민 계정 노티스 작성 -->
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
					onclick="location.href='https://www.naver.com/';">
					<a>Review</a>
				</div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='http://122.34.87.29:8181/practice1/css/EventList.jsp';">
					<a>Event</a>
				</div>
				<div id="detail" style="border-right: 0px; cursor: pointer;"
					onclick="location.href='https://maplestory.nexon.com/News/Notice';">
					<a>Notice</a>
				</div>
				<div id="detail"
					style="height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>
			
			
			
			<!-- 본문 -->
			<form action="${root}/community/NoticeUpdateOk.do" method="post">			
			<div id="content">			
				<div id="mid1" style="height: 118px;">
					<span id="viewcount"
						style="font-size: 50px; margin-top: 30px; margin-left: 30px;">Notice</span>
				</div>

				<div id="noticemid1">
					<div style="display: inline-block;">
						<p style="font-size: 30px; line-height: 60px; margin-left: 50px;">Title</p>
					</div>
					<div
						style="height: 66px; line-height: 60px; margin-left: -54px; display: inline-block;">
						<span style="vertical-align: top; margin-top: 5px;">
							
							<input type="hidden" value="${noticeBoardDto.cnumber}" name="cnumber"/>
							
							<!-- 제목 입력(title) -->
							<input
							type="text" value="${noticeBoardDto.ctitle}" name="ctitle"
							style="width: 500px; height: 35px; font-size: 17px;" /></span>
						<div
							style="border-left: 1px black solid; height: 59px; float: left; margin-left: 87px; margin-top: 0px;"></div>
					</div>
					
					<div id="noticemid2">
						<div style="height: 250px; border: 0px solid black;">
							<p
								style="width: 60px; height: 40px; margin-left: 50px; margin-top: 200px;">Text</p>
							<div
								style="height: 66px; line-height: 60px; margin-left: 0px; display: inline-block;">
								<div>
									<textarea rows="10" cols="80" name="ccontent"
										style="font-size: 17px; margin-left: 152px; margin-top: -110px;">
										${noticeBoardDto.ccontent}
										</textarea>
										<input hidden="" value="1" name="ccategory"/>
								</div>
								<div
									style="border-left: 1px black solid; height: 450px; float: left; margin-left: 150px; margin-top: -355px;"></div>

							</div>
						</div>
							<input type="reset" value="취소"
							style="float: right; margin-top: 30px; margin-right: 580px; cursor: pointer;" />
							
							<input type="submit" value="완료"
							style="float: right; margin-top: 30px; margin-right: 25px; cursor: pointer;" />
					</div>
				</div>						
			</div>
			</form>
</body>
</html>