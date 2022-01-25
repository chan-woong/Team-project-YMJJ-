<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdoutJEJU</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/aboutjeju/introduction.css">
</head>
<body>
	  <div>
        <div id="title"><a>About JEJU</a></div>
        <div id="menuF">
            <div id="category">
                <div id="detail" style="border-left: 0px;"></div>
                <div id="detail" style="border-right: 0px;"><a>Introduction</a></div>
                <div id="detail"><a>Location</a></div>
                <div id="detail"><a>Speciality</a></div>
                <div id="detail"><a>Activities</a></div>
                <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>              
            </div>
            <div id="content">
                <div style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px; overflow: hidden;">
					<!-- 왼쪽 큰 사진 -->
					<div style="border : 1px black solid; width: 590px; height: 590px; margin-top: 20px;margin-left: 20px; float: left;">
						<img id="mainimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
					</div>
					<!-- 오른쪽 3개 사진 -->
					<div id="imgsize" style="margin-right: 30px;">
						<img id="secimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
						<textarea rows="1" cols="20"></textarea>
					</div>
					<div id="imgsize" >
						<img id="thimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
						<textarea rows="1" cols="20"></textarea>
					</div>
					<div id="imgsize" >
						<img id="forimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
						<textarea rows="1" cols="20"></textarea>
					</div>
					<!-- 긴 텍스트 -->
					<div id="texts">
						<input>
					</div>
                </div>
                <div id="but">
                    <input type="button"/>
                    <input type="button"/>
                    <input type="button"/>
                </div>
            </div>
        </div>
    </div>
</body>
</html>