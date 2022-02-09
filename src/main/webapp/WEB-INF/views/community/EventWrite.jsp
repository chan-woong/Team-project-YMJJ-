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
</head>
<!-- 어드민계정 이벤트 작성 -->
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
				<div id="detail" style="border-right: 0px; cursor: pointer;"
					onclick="location.href='http://122.34.87.29:8181/practice1/css/EventList.jsp';">
					<a>Event</a>
				</div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='http://122.34.87.29:8181/practice1/css/Notice.jsp';">
					<a>Notice</a>
				</div>
				<div id="detail"
					style="height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>
			<div id="content">
				<div id="mid1">
					<span id="mid1_button"> <a
						href="http://122.34.87.29:8181/practice1/css/EventList.jsp"><input
							type="button" value="확인"
							style="margin-top: 10px; margin-right: 10px;" /></a> <a
						href="http://122.34.87.29:8181/practice1/css/EventList.jsp"><input
							type="button" value="취소"
							style="margin-top: 30px; margin-right: 10px;" /></a>
					</span>
				</div>
				<div id="mid2">
					<div style="display: inline-block;">
						<span style="font-size: 30px; line-height: 60px">제목</span>
					</div>
					<div
						style="height: 60px; line-height: 60px; margin-left: 20px; display: inline-block; top: 0;">
						<span style="vertical-align: middle;"><input type="text"
							name="subject"
							style="width: 500px; height: 30px; font-size: 24px;" /></span>
					</div>
				</div>
				<div id="mid3">
					<div>
						nickname <input type="text" value="naninani" disabled="disabled"
							style="width: 100px; text-align: center;" />
					</div>
				</div>
				<div id="mid4">
					<div id="mid_image">
						<img alt="" src="">
					</div>
				</div>
				<div id="mid5">
					<span> <input type="file" name="file" />
					</span>
				</div>
				<div id="mid6">
					<div>
						<textarea rows="10" cols="120" style="font-size: 17px;"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>