<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head> <!-- 작은 폰트 17 큰폰트 50폰트 중간 30pt -->
<meta charset="UTF-8">
<title>AdoutJEJU</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/aboutjeju/location.css"> 
</head>
<body>
<div>
    <div id="title"><a>About JEJU</a></div>
       <div id="menuF">
           <div id="category">
               <div id="detail" style="border-left: 0px;"></div>
               <div id="detail"><a href="${root}/aboutjeju/introduction.do">Introduction</a></div>
               <div id="detail" style="border-right: 0px;"><a href="${root}/aboutjeju/location.do">Location</a></div>
               <div id="detail"><a  href="${root}/aboutjeju/speciality.do">Speciality</a></div>
               <div id="detail"><a href="${root}/aboutjeju/activities.do">Activities</a></div>
               <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>              
           </div>
           <div id="content">
           <form class="form-style" action="" method="get" enctype="multipart/form-data">
               <div style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px; overflow: hidden; position: relative;">
				<div style="float: left;">
					<div id="imgsize">
						<img id="secimg" alt="" src="${root}/img/${Ilist[0].iname}"/>
						<a id="sectext" style="width:149px;height:30px;">${Ilist[0].LMtitle}</a>
					</div>
					<div id="imgsize" >
						<img id="thimg" alt="" src="${root}/img/${Ilist[1].iname}"/>
						<a id="thtext" style="width:149px;height:30px;">${Ilist[1].LMtitle}</a>
					</div>
					<div id="imgsize" >
						<img id="forimg" alt="" src="${root}/img/${Ilist[2].iname}"/>
						<a id="fortext" style="width:149px;height:30px;">${Ilist[2].LMtitle}</a>
					</div>
				</div>
				<!-- 3개묶음 아래 사진들 -->
				<div style="position: absolute; margin-top: 250px">
					<div id="imgsize">
						<img id="secimg" alt="" src="${root}/img/${Ilist[3].iname}"/>
						<a id="fatext" style="width:149px;height:30px;">${Ilist[3].LMtitle}</a>
					</div>
					<div id="imgsize" >
						<img id="thimg" alt="" src="${root}/img/${Ilist[4].iname}"/>
						<a id="sixtext" style="width:149px;height:30px;">${Ilist[4].LMtitle}</a>
					</div>
					<div id="imgsize" >
						<img id="forimg" alt="" src="${root}/img/${Ilist[5].iname}"/>
						<a id="sentext" style="width:149px;height:30px;">${Ilist[5].LMtitle}</a>
					</div>
				</div>
				<!-- 오른쪽 큰 사진 -->
				<div style="border : 1px black solid; width: 590px; height: 590px; margin-top: 20px;margin-right: 20px; float: right;">
					<img id="mainimg" alt="" src="${root}/img/${Ilist[6].iname}"/>
				</div>
				</div>
				</form>
           </div>
        </div>
    </div>
</body>
</html>