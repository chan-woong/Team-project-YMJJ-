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
    border: 1px black solid;
    width: 1920px;
    height: 70px;
    float: left;
}
#logo{
    border: 1px black solid;
    width: 200px;
    height: 70px;
    margin-left: 40px;
    float: left;
}
#menuBar{
    position: absolute;
    height: 70px;
    overflow: hidden;
    margin-left: 300px;
}
#menu{
    border: 1px black solid;
    height: 70px;
    width: 170px;
    float: left;
    font-size: 30px;
    line-height: 70px;
    text-align: center;
    margin-left: 80px;
}
#but{
    float: right;
    margin-top: 40px;
}
#but > input{
    font-size: 17px;
    margin-right: 40px;
}
</style>
</head>
<body>
    <div id="header">
        <div id="logo">logo</div>
        <div id="menuBar">
            <div id="menu"> About JEJU</div>
            <div id="menu">Restaurant</div>
            <div id="menu">Community</div>
            <div id="menu">Map</div>
            <div id="menu">Today</div>
        </div>
        <div id="but">
        	<c:if test="${Mid==null}">
	        	<input type="button" value="Login" onclick="location.href='${root}/member/login.do'"/>
	            <input type="button" value="Join" onclick="location.href='${root}/member/join.do'"/>
        	</c:if>
        	<c:if test="${Mid!=null}">
        		<a style="font-size: 30px;">Name.</a>&nbsp;
        		<a style="font-size: 30px; margin-right: 20px; color: red;" onclick="location.href='${root}/member/Mypage-Com.do'">${Mname}</a>
	            <input type="button" value="Logout" style="margin-bottom: 10px;" onclick="location.href='${root}/member/logout.do'"/>
        	</c:if>
           
        </div>
    </div>
</body>
</html>