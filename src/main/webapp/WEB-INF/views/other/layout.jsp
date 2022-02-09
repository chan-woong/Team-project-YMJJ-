<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YMJJ</title>
</head>
<body>
   <!-- header.jsp -->
   <tiles:insertAttribute name="header"/>
   
    <tiles:insertAttribute name="content"/>
</body>
</html>