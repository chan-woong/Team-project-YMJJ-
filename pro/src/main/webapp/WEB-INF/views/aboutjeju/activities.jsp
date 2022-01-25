<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdoutJEJU</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/aboutjeju/activities.css">
</head>
<body>
    <div>
        <div id="title"><a>AboutJEJU</a></div>
        <div id="menuF">
            <div id="category">
                <div id="detail" style="border-left: 0px;"></div>
                <div id="detail"><a>Introduction</a></div>
                <div id="detail"><a>Location</a></div>
                <div id="detail"><a>Speciality</a></div>
                <div id="detail" style="border-right: 0px;"><a>Activities</a></div>
                <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>              
            </div>
            <div id="content">
                <div style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px;">
                
	                <!-- 왼쪽 사진들 -->
					<div id="hiking">
						<div>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<p>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를</p>
						</div>
						<div>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<p>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를</p>						
						</div>
						<div>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<p>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를</p>
						</div>
					</div>
						
	
						
						<!-- 가운데 큰 글씨 -->
					<div id="activity">
						<div id="act1">
							<div id="color1">
								<input type="text" value="Hiking" disabled="disabled"/>
							</div>
							<div>
								<input type="text" value="Leisure" disabled="disabled"/>
							</div>
						</div>
						
						<div id="act2">
							<label>Activities</label>
						</div>
						
						<div id="act3">
							<div id="color2">
								<img width="200px" height="150px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							</div>
							<div>
								<img width="200px" height="150px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							</div>
						</div>
					</div>
						
						
						
						
							
					<div id="leisure">
						<div>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<p>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를</p>
						</div>
						<div>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<p>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를</p>
						</div>
						<div>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<img width="110px" height="110px" alt="" src="https://blog.jinbo.net/attach/615/200937431.jpg"/>
							<p>대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를 측정하는 글 대충 길이를</p>
						</div>
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