<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/other.js"></script>
<script>
$(document).ready(function(){
    $('.slider').bxSlider();
});
  </script>
<style>
*{
margin: 0px auto;
padding: 0px auto;
box-sizing: border-box;
}
.slider{
width: 100%;
height: 500px;
}
#mainView{
width: 1900px;
height: 830px;
margin: 10px;
padding: 10px;
margin-top: 25px;
}
.slider > img{
width: 1900px;
height: 750px;
}
#select{
	position : fixed;
	text-align: center;
	top: 650px;
	left: 730px;
}
#today{
margin-top: 30px;
background-color: #978f8f91;
width: 300px;
text-align: center;
overflow: hidden;
padding-left: 10px;
border-radius: 15px;
}
#today > div{
float: left;
}
#todayCovid{
width: 200px;
height: 34px;
line-height: 34px;
font-weight: 800;
font-size: 14px;
color: white;
}
</style>
</head>
<body>
	<div id="mainView">
		<div class="slider">
	        <img src="${root}/resources/img/제주도1.jpg">
	        <img src="${root}/resources/img/제주도2.jpg">
	       <img src="${root}/resources/img/제주도3.jpg">
	    </div>
	</div>
	<div id="select">
		<input type="text" placeholder="음식점 이름을 입력하세요" name="select" onkeyup="if(window.event.keyCode==13){search('${root}')}" id="RTname" style="width: 450px;"/>
		
		<div id="today" onclick="location.href='${root}/other/today.do'">
			<div>
				<!-- weather widget start --><div id="m-booked-small-t2-37428"> <div class="booked-weather-120x36 w120x36-29" style="color:#ffffff; border-radius:4px; -moz-border-radius:4px; border:none"> <div style="color:#ffffff;" class="booked-bl-simple-city">제주</div> <div class="booked-weather-120x36-degree"><span class="plus">+</span>2...<span class="plus">+</span>6&deg; C</div> </div> </div><script type="text/javascript"> var css_file=document.createElement("link"); var widgetUrl = location.href; css_file.setAttribute("rel","stylesheet"); css_file.setAttribute("type","text/css"); css_file.setAttribute("href",'https://s.bookcdn.com/css/w/bw-120-36.css?v=0.0.1'); document.getElementsByTagName("head")[0].appendChild(css_file); function setWidgetData_37428(data) { if(typeof(data) != 'undefined' && data.results.length > 0) { for(var i = 0; i < data.results.length; ++i) { var objMainBlock = document.getElementById('m-booked-small-t2-37428'); if(objMainBlock !== null) { var copyBlock = document.getElementById('m-bookew-weather-copy-'+data.results[i].widget_type); objMainBlock.innerHTML = data.results[i].html_code; if(copyBlock !== null) objMainBlock.appendChild(copyBlock); } } } else { alert('data=undefined||data.results is empty'); } } var widgetSrc = "https://widgets.booked.net/weather/info?action=get_weather_info;ver=7;cityID=32868;type=12;scode=2;ltid=3458;domid=593;anc_id=86326;countday=undefined;cmetric=1;wlangID=24;color=2071c9;wwidth=118;header_color=2071c9;text_color=ffffff;link_color=ffffff;border_form=3;footer_color=2071c9;footer_text_color=ffffff;transparent=1;v=0.0.1";widgetSrc += ';ref=' + widgetUrl;widgetSrc += ';rand_id=37428';var weatherBookedScript = document.createElement("script"); weatherBookedScript.setAttribute("type", "text/javascript"); weatherBookedScript.src = widgetSrc; document.body.appendChild(weatherBookedScript) </script><!-- weather widget end -->
			</div>
			<div id="todayCovid"></div>
			<script>toServer()</script>
		</div>
	</div>
</body>
</html>