<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>TODAY</title>
<link rel="stylesheet" href="${root}/resources/css/other/today.css"/>
<script type="text/javascript" src="${root}/resources/javascript/Covid_19.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</head>
<body>
	<div id="today">
		<div id="main_title">TODAY</div>
		<div class="today_box">
		
			<div class="weather_box"> <!-- 날씨 박스 -->
			<script>
        (function(d, s, id) {
            if (d.getElementById(id)) {
                if (window.__TOMORROW__) {
                    window.__TOMORROW__.renderWidget();
                }
                return;
            }
            const fjs = d.getElementsByTagName(s)[0];
            const js = d.createElement(s);
            js.id = id;
            js.src = "https://www.tomorrow.io/v1/widget/sdk/sdk.bundle.min.js";

            fjs.parentNode.insertBefore(js, fjs);
        })(document, 'script', 'tomorrow-sdk');
        </script>

        <div class="tomorrow"
           data-location-id="065406"
           data-language="KO"
           data-unit-system="METRIC"
           data-skin="light"
           data-widget-type="upcoming"
           style="padding-bottom:22px;position:relative;"
        >
          <a
            href="https://www.tomorrow.io/weather/"
            rel="nofollow noopener noreferrer"
            target="_blank"
            style="position: absolute; bottom: 0; transform: translateX(-50%); left: 50%;"
          >
            <img
              alt="Powered by Tomorrow.io"
              src="https://weather-website-client.tomorrow.io/img/powered-by-tomorrow.svg"
              width="140"
              height="15"
            />
          </a>
        </div>
			</div>
			
			<div class="covid_box"> <!-- covid 박스 -->
			<canvas id="mixed-chart" height="370px"></canvas>
			<script type="text/javascript">toServer()</script>
			</div>
				
			<div class="ranking_box"> <!-- 랭킹 박스 -->
				<c:forEach var="ranking" items="${rankingList}">
					<div id="rankingView">
						<img id="Rimg" src="${root}/resources/img/${ranking.RTIname}">
						<div id="Property">
							<div style="font-weight: bolder;">${ranking.RTname}</div>
							<div>${ranking.RTintroduce}</div>
							<div>${ranking.avg}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<div class="box_title">
				<label class="t_weather">Weather</label>
				<label class="t_covid">Covid_19</label>
				<label class="t_ranking">Ranking</label>
			</div>
		</div> <!-- 투데이 박스 -->
	</div>
</body>
</html>