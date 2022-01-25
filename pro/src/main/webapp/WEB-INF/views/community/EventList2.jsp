<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Event</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/community/EventStyle.css" />
<!-- 회원 비회원 이벤트 목록 -->
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
					onclick="location.href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%8B%A4+%EB%B4%A4%EC%9C%BC%EB%A9%B4+%EB%82%98%EA%B0%80';">
					<a>Review</a>
				</div>
				<div id="detail" style="border-right: 0px; cursor: pointer;"
					onclick="location.href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%8B%A4+%EB%B4%A4%EC%9C%BC%EB%A9%B4+%EB%82%98%EA%B0%80';">
					<a>Event</a>
				</div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%8B%A4+%EB%B4%A4%EC%9C%BC%EB%A9%B4+%EB%82%98%EA%B0%80';">
					<a>Notice</a>
				</div>
				<div id="detail"
					style="height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>
			<div id="content">
				<div
					style="border: 2px black solid; width: 1175px; height: 600px; margin-top: 40px; margin-left: 40px;">
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>
					</div>
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>
					</div>
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>
					</div>
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>
					</div>
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>
					</div>
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>
					</div>
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>
					</div>
					<div id="card">
						<a href="https://www.naver.com/"> <img alt=""
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150803_11%2Fopera2528_1438599289948ID68K_JPEG%2Fnaver_com_20150714_193055.jpg&type=sc960_832"
							width=245 height=245>
							<p>30byte까지 작성 가능합니다.</p></a>

					</div>

				</div>

				<div id="button">
					<button id="button1"><</button>
					<button id="button1">1</button>
					<button id="button1">2</button>
					<button id="button1">3</button>
					<button id="button1">></button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>