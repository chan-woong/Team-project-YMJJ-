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
</head>
<body>
	<div id="today">
		<div id="main_title">TODAY</div>
		<div class="today_box">
		
			<div class="weather_box">
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
			</div> <!-- 날씨 박스 -->
			
			<div class="covid_box">
			<script type="text/javascript">
			
			</script>
			</div> <!-- covid 박스 -->
				<script type="text/javascript">
				var xhr = new XMLHttpRequest();
				var url = 'http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson'; /*URL*/
				var queryParams = '?' + encodeURIComponent('serviceKey') + '='+'5o6r9lHoCPvUu88P%2ByZyCVjTgLIsaCzq3GJQuNBXpc%2BZNyNSS%2BYMvVaunt3yT4Fp2LPAc%2BxAITBx9ARhtoMHVw%3D%3D'; /*Service Key*/
				queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
				queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('10'); /**/
				queryParams += '&' + encodeURIComponent('startCreateDt') + '=' + encodeURIComponent('20200310'); /**/
				queryParams += '&' + encodeURIComponent('endCreateDt') + '=' + encodeURIComponent('20200315'); /**/
				xhr.open('GET', url + queryParams);

				xhr.onreadystatechange = function () {
				    if (this.readyState == 4) {
				    	var arr=JSON.parse(xhr.responseText);
						//alert(obj);
						/*
						for (var i = 0; i < arr.data.length; i++) {
							var divBunho=document.createElement("div");
							divBunho.innerHTML=arr.data[i].name;
							var divIrum=document.createElement("div");
							divIrum.innerHTML=arr.data[i].phone;
							var divAverage=document.createElement("div");
							divAverage.innerHTML=arr.data[i].addreass;
							
							var divResult=document.getElementById("result");
							divResult.appendChild(divBunho);
							divResult.appendChild(divIrum);
							divResult.appendChild(divAverage);			
						}
						*/
						var str="<div>";
						for (var i = 0; i < arr.data.length; i++) {
							str+="<div>"+arr.data[i].name+"</div>";
							str+="<div>"+arr.data[i].phone+"</div>";
							str+="<div>"+arr.data[i].addreass+"</div><br/>";
						}
						str += "</div>";
						var divResult = document.getElementById("result");
					    divResult.innerHTML = str;

						
				    }
				};

				xhr.send('');
				</script>
			<div class="ranking_box">
			</div> <!-- 랭킹 박스 -->
			
			<div class="box_title">
				<label class="t_weather">Weather</label>
				<label class="t_covid">Covid_19</label>
				<label class="t_ranking">Ranking</label>
			</div>
		</div> <!-- 투데이 박스 -->
	</div>
</body>
</html>