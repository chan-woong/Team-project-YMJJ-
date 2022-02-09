<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdoutJEJU</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${root}/resources/css/aboutjeju/introduction.css">
<script type="text/javascript" src="${root}/resources/javascript/KakaoAddress.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>

</head>
<body>
 <div>
   		<div id="title"><a>About JEJU</a></div>
        <form class="form-style" action="" method="get" enctype="multipart/form-data">
        <div id="menuF">
            <div id="category">
                <div id="detail" style="border-left: 0px;"></div>
                <div id="detail" style="border-right: 0px;"><a href="${root}/aboutjeju/introduction.do">Introduction</a></div>
                <div id="detail"><a href="${root}/aboutjeju/location.do">Location</a></div>
                <div id="detail"><a href="${root}/aboutjeju/speciality.do">Speciality</a></div>
                <div id="detail"><a href="${root}/aboutjeju/activities.do">Activities</a></div>
                <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>              
            </div>
            <div id="content">
                <div style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px; overflow: hidden;">
					<!-- 왼쪽 큰 사진 -->
					<div class="LMimg" style="border : 1px black solid; width: 590px; height: 590px; margin-top: 20px;margin-left: 20px; float: left;">
						<img id="img" alt="#" src="${root}/img/${Ilist[0].iname}" onclick="btnClick()"/> 
					</div>
					<!-- 오른쪽 3개 사진 -->
					<div id="imgsize" style="margin-right: 30px;"> 
						<img id="img" alt="#" src="${root}/img/${Ilist[1].iname}" onclick="btnClick()"/>
						<a id="sectext" style="width:149px;height:30px;">${Ilist[1].LMtitle}</a>
				</div>
					<div id="imgsize" >
						<img id="img" alt="#" src="${root}/img/${Ilist[2].iname}" onclick="btnClick()"/> 
						<a id="thimgtext" style="width:149px;height:30px;">${Ilist[2].LMtitle}</a> 
					</div>
					<div id="imgsize" > 
						<img id="img" alt="#" src="${root}/img/${Ilist[3].iname}" onclick="btnClick()"/>
						<a id="fortext" style="width:149px;height:30px;"> ${Ilist[3].LMtitle} </a>
					</div>
					<!-- 긴 텍스트 -->
					<div id="texts">
						<a id="longtext" style="width:200px;height:200px;">${Ilist[0].LMcontent}</a> 
					</div>
                </div>
                <div style="margin: 15px 10px 10px 30px;">
	               	<%-- <c:if test="${Mid == 'admin'}"> --%> <!-- 관리자 로그인시  -->
	               	<c:if test="${Mid == null}">   <!-- 테스트 용 -->
	            		<input type="button"  value="추가" onclick="location.href=' ${root}/aboutjeju/write.do' " />
	            	</c:if>
            	</div>
            </div>
        </div>
         <div id = "hiden"style="azimuth:inherit; display:none; border: 2px black solid; width: 500px; height: 500px; display:lnline-block;" >
         <button value="닫기"></button>
	   		<div id="zido" style="width: 500px; height: 250px; border: 0px black solid; display:lnline-block;">
				<script type="text/javascript">
					var mapContainer = document.getElementById('zido'), // 지도를 표시할 div 
	            	mapOption = { 
	            	    center: new kakao.maps.LatLng(${aboutDto.LMlatitude}, ${aboutDto.LMlongitude}), // 지도의 중심좌표
	            	    level: 2 // 지도의 확대 레벨
	            	};
	            	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	            	var map = new kakao.maps.Map(mapContainer, mapOption); 
	            	map.setDraggable(false);
	            	map.setZoomable(false);
	            	
	            	var lat = parseFloat(${aboutDto.LMlatitude});
            		var lon = parseFloat( ${aboutDto.LMlongitude});
            		//alert("위도" + lat + "경도" + lon);
            		var ${aboutDto.LMnumber} = new kakao.maps.Marker({
            		   	map: map, 
            		    position: new kakao.maps.LatLng(lat, lon)
            			});
				</script>
			</div>
	   		<div id="conttext" >
   				<c:forEach var="aboutjejuDto" items="${Ilist}" >
   				<c:if test="${aboutjejuDto.LMtitle}"></c:if>
					<div  style="border: 1px black solid; margin: 10px 10px 10px 10px;"><label>제목 : </label><a>${aboutjejuDto.LMtitle}</a></div> 
					<div style="border: 1px black solid; margin: 10px 10px 10px 10px;"><label>주소 : </label><a>${aboutjejuDto.LMpostalcode}</a></div>
					<div style="border: 1px black solid; margin: 10px 10px 10px 10px; height: 150px;"><label>상세 정보 : </label><a>${aboutjejuDto.LMcontent}</a></div>
				</c:forEach>
	   		</div>
	   		<script type="text/javascript">
					<!-- 자바스크립트 만들기 --> 
					var hiden =document.getElementById('hiden');
					function btnClick(){
							//alert("dkdk");
							hiden.style.display="block";
						}
					
				</script>
	   	</div>
	   </form>
    </div>
</body>
</html>