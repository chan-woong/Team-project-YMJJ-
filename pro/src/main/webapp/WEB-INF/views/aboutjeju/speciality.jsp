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
                <div id="detail"><a>Introduction</a></div>
                <div id="detail"><a>Location</a></div>
                <div id="detail" style="border-right: 0px;"><a>Speciality</a></div>
                <div id="detail"><a>Activities</a></div>
                <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>              
            </div>
            <div id="content">
                <div id="con" style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px;">         
                	<div id="con1">
                	
                		<!-- 왼쪽 사진 -->
                		<div style="padding-top: 50px; margin-top: 20px;">
                			<a>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를</a>
                			<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
                			<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
                		</div>
                		
                		<!-- 가운데 큰 사진 -->
                		<div style="border : 0px black solid; width: 651px; height: 450px; padding: 10px; margin-top: 30px;">
                			<img width="600px" height="400px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
                		</div>
                		
                		<!-- 오른쪽 사진 -->
                		<div>
                			<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
                			<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
                			<a>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는</a>
                		</div>
                	</div>
                	
                	
                	
                	<!-- 맨 아래 사진 -->
                	<div id="con2">	
                		<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
                		<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
                		<a>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글</a>
						
                	</div>
                </div>
                
                
                <div id="but">
                    <input type="button" value="추가"/>
                    <input type="button" value="수정"/>
                    <input type="button" value="삭제"/>
                </div>
            </div>
        </div>
    </div>
</body>
</html>