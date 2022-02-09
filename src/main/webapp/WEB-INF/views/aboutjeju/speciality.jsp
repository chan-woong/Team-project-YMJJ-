<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdoutJEJU</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/aboutjeju/special.css">
</head>
<body>

    <div>
        <div id="title"><a>About JEJU</a></div>
        <div id="menuF">
            <div id="category">
                <div id="detail" style="border-left: 0px;"></div>
                <div id="detail"><a href="${root}/aboutjeju/introduction.do">Introduction</a></div>
                <div id="detail"><a href="${root}/aboutjeju/location.do">Location</a></div>
                <div id="detail" style="border-right: 0px;"><a  href="${root}/aboutjeju/speciality.do">Speciality</a></div>
                <div id="detail"><a href="${root}/aboutjeju/activities.do">Activities</a></div>
                <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>              
            </div>
            <div id="content">
            <form class="form-style" action="${root}/aboutjeju/wirteOK" method="get" enctype="multipart/form-data">
                <div id="con" style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px;">         
                	<div id="con1">
                	
                		<!-- 왼쪽 사진 -->
                		<div style="padding-top: 50px; margin-top: 20px;">
                			<img width="150px" height="150px" alt="" src="${root}/img/${Ilist[0].iname}" onclick="btnClick(${Ilist}, 0)"/>
                			<a id="sectext" style="width:149px;height:30px;">${Ilist[0].LMtitle}</a>
                		</div>
                		
                		<!-- 가운데 큰 사진 -->
                		<div style="border : 0px black solid; width: 651px; height: 450px; padding: 10px; margin-top: 30px;">
                			<a href=""><img width="600px" height="400px" alt="" src="${root}/img/${Ilist[1].iname}" onclick="btnClick(${Ilist}, 1)"/></a>
                		</div>
                		
                		<!-- 오른쪽 사진 -->
                		<div>
                			<img width="150px" height="150px" alt="" src="${root}/img/${Ilist[2].iname}" onclick="btnClick(${Ilist}, 2)"/>
                			<a id="thtext" style="width:149px;height:30px;">${Ilist[2].LMtitle}</a>
                		</div>
                	</div>
                	
                	<!-- 맨 아래 사진 -->
                	<div id="con2">	
                		<img width="145px" height="145px" alt="" src="${root}/img/${Ilist[3].iname}" onclick="btnClick(${Ilist}, 3)"/>
                		<a id="fortext" style="width:149px;height:30px; margin-right: 10px;">${Ilist[3].LMtitle}</a>
                	</div>
                </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>