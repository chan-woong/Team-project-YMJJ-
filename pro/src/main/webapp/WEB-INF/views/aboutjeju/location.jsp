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
                <div id="detail"><a>Introduction</a></div>
                <div id="detail" style="border-right: 0px;"><a>Location</a></div>
                <div id="detail"><a>Speciality</a></div>
                <div id="detail"><a>Activities</a></div>
                <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>              
            </div>
            <div id="content">
                <div style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px; overflow: hidden; position: relative;">
					<!-- 3개묶음 아래 사진들 -->
					<div style="float: left;">
						<div id="imgsize">
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
					</div>
					<!-- 3개묶음 아래 사진들 -->
					<div style="position: absolute; margin-top: 250px">
						<div id="imgsize">
							<img id="secimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<textarea rows="1" cols="20"></textarea>
						</div>
						<div id="imgsize" >
							<img id="thimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<textarea rows="1" cols="20" style="width: 148px"></textarea>
						</div>
						<div id="imgsize" >
							<img id="forimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<textarea rows="1" cols="20"></textarea>
						</div>
					</div>
					<!-- 오른쪽 큰 사진 -->
					<div style="border : 1px black solid; width: 590px; height: 590px; margin-top: 20px;margin-right: 20px; float: right;">
						<img id="mainimg" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
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