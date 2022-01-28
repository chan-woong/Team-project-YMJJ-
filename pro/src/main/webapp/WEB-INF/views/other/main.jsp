<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
border : 1px black solid;
width: 1900px;
height: 830px;
margin: 10px;
padding: 10px;
}
img{
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
background-color: white;
width: 200px;
text-align: center;
}
</style>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath}"/>
	<div id="mainView">
		<div class="slider">
	        <img alt="" src="${root}/resources/img/고양이3.jfif">
	        <img alt="" src="${root}/resources/img/고양이2.jfif">
	       <img alt="" src="${root}/resources/img/고양이.jfif">
	    </div>
	</div>
	<div id="select">
		<input type="text" name="select" placeholder="음식점 이름을 입력하세요" onkeyup="if(window.event.keyCode==13){search()}" id="RName" style="width: 450px;"/>
		
		<div id="today">날씨 확진자</div>
	</div>
</body>
</html>