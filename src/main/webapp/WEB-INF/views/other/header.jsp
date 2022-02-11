<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>menu</title>
<style>
*{
    margin: 0px auto;
    padding: 0px auto;
    box-sizing: border-box; 
}
#header{
    border: 0px black solid;
    width: 1920px;
    height: 70px;
    background-color: #CFCFCF;
    color: #3A3A3A;
}
#logo{
    border: 0px black solid;
    width: 200px;
    height: 70px;
    margin-left: 40px;
    float: left;
    overflow:hidden;
}
#menuBar{
    position: absolute;
    height: 70px;
    overflow: hidden;
    margin-left: 300px;
}
#menu{
    border: 0px black solid;
    height: 70px;
    width: 170px;
    float: left;
    font-size: 30px;
    line-height: 70px;
    text-align: center;
    margin-left: 80px;
    font-weight: bolder;
    opacity: 0.6;
}
#but{
    float: right;
    margin-top: 25px;
}
#but > input{
    font-size: 17px;
    margin-right: 40px;
}
.logo1{
	width: 150px;
    height: 70px;
    object-fit:cover;
    margin-left: 25px;
}
</style>
</head>
<body>
    <div id="header">
        <div id="logo" onclick="location.href='${root}'">
        	<img class="logo1" src="${root}/resources/img/logo.jfif">
        </div>
        <div id="menuBar">
            <div id="menu" onclick="location.href='${root}/aboutjeju/introduction.do'">About JEJU</div>
            <div id="menu" onclick="location.href='${root}/restaurant/main.do?RTtype=all'">Restaurant</div>
                        <div id="menu" onclick="location.href='${root}/community/ReviewList.do'">Community</div>
            <div id="menu" onclick="location.href='${root}/other/map.do'">Map</div>
            <div id="menu" onclick="location.href='${root}/other/today.do'">Today</div>
        </div>
        <div id="but">
        	<c:if test="${Mid==null}">
	        	<input type="button" value="Login" onclick="location.href='${root}/member/login.do'" style="width: 65px; height: 25px; margin-top: 15px"/>
	            <input type="button" value="Join" onclick="location.href='${root}/member/join.do'" style="width: 65px; height: 25px; margin-top: 15px"/>
        	</c:if>
        	
        	<c:if test="${Mid!=null}">
	       		<c:if test="${Mid!='admin'}">
		       		<a style="font-size: 30px;">Name.</a>&nbsp;
		       		<a style="font-size: 30px; margin-right: 20px; color: red;" onclick="location.href='${root}/member/Mypage-Com.do?Mid=${Mid}'">${Mname}</a>
		            <input type="button" value="Logout"onclick="location.href='${root}/member/logout.do'" style="width: 65px; height: 25px;" />
	       		</c:if>
	       		<c:if test="${Mid=='admin'}">
		       		<a style="font-size: 30px;">Name.</a>&nbsp;
		       		<a style="font-size: 30px; margin-right: 20px; color: red;" onclick="location.href='${root}/member/Mypage-M.do'">${Mname}</a>
		            <input type="button" value="Logout"onclick="location.href='${root}/member/logout.do'" style="width: 65px; height: 25px;" />
	       		</c:if>
       		</c:if>
        </div>
    </div>
</body>
</html>