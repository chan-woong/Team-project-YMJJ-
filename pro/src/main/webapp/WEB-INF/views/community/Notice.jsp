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
<!-- 어드민 계정 노티스 목록 -->
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
			<div id="content">
				<div id="mid1" style="height: 118px;">
					<span id="viewcount"
						style="font-size: 50px; margin-top: 30px; margin-left: 30px;">Notice</span>
					<span id="mid1_button"> <a
						href="http://122.34.87.29:8181/practice1/css/NoticeWrite.jsp"><input
							type="button" value="작성"
							style="margin-right: 50px; margin-top: 50px; height: 30px; width: 50px;" /></span></a>
				</div>
				<div id="notice1">
					<div id="notice">
						<details>
							<summary>Notice1</summary>
							<p>다 봤으면 닫아주세요
								<input id="button2" type="button" value="삭제"/>
								<input id="button2" type="button" value="수정"/>
							</p>
						</details>
					</div>
					<div id="notice">
						<details>
							<summary>Notice2</summary>
							<p>다 봤으면 닫아주세요</p>
						</details>
					</div>
					<div id="notice">
						<details>
							<summary>Notice3</summary>
							<p>다 봤으면 닫아주세요</p>
						</details>
					</div>
					<div id="notice">
						<details>
							<summary>Notice4</summary>
							<p>다 봤으면 닫아주세요</p>
						</details>
					</div>
					<div id="notice">
						<details>
							<summary>Notice5</summary>
							<p>다 봤으면 닫아주세요</p>
						</details>
					</div>
					<div id="notice">
						<details>
							<summary>Notice6</summary>
							<p>다 봤으면 닫아주세요</p>
						</details>
					</div>
					<div id="notice">
						<details>
							<summary>Notice7</summary>
							<p>다 봤으면 닫아주세요</p>
						</details>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>