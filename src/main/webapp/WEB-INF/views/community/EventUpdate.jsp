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
<!-- 어드민 계정 읽기 -->
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
					<span id="viewcount">Viewcount</span> <span id="mid1_button">
						<input type="button" value="수정"
						style="margin-right: 10px; margin-top: 10px;" /> <a
						href="http://122.34.87.29:8181/practice1/css/EventList.jsp"><input
							type="button" value="삭제"
							style="margin-right: 30px; margin-top: 10px;" /> </a>
					</span>
				</div>
				<div id="mid2">
					<div style="display: inline-block;">
						<span style="font-size: 30px; line-height: 60px">새우튀김 없는
							새우튀김우동 이벤트</span>
					</div>
					<div id="mid3">
						<div>
							작성자 <input type="text" value="naninani" disabled="disabled"
								style="width: 100px; text-align: center;" />
						</div>
					</div>
					<div id="mid4">
						<div id="mid_image">
							<img alt="picon"
								src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832">
						</div>
					</div>
					<div id="mid5">
						<span> </span>
					</div>
					<div id="mid6">
						<div>
							<textarea rows="10" cols="120" style="font-size: 17px;"></textarea>
						</div>
						<div>
							<a href="http://122.34.87.29:8181/practice1/css/EventList.jsp"><input
								type="button" value="목록"
								style="float: right; margin-right: 30px;" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>