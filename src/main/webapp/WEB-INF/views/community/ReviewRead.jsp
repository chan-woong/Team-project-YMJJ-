<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/community/ReviewStyle.css" />
<script type="text/javascript">
	function delFun(root, RVnumber, pageNumber){
		var url=root + "/community/ReviewDelete.do?RVnumber=" + RVnumber + "&pageNumber=" + pageNumber;
		
		location.href=url;
	}
	
	function upFun(root, RVnumber, pageNumber){
		var url=root + "/community/ReviewUpdate.do?RVnumber=" + RVnumber + "&pageNumber=" + pageNumber;
		// alert(url);
		
		location.href=url;
	}
</script>
</head>
<body>
	<div>
		<div id="title">
			<a>Community</a>
		</div>
		<div id="menuF">
			<div id="category">
				<div id="detail" style="border-left: 0px;"></div>
				<div id="detail" style="border-right: 0px;"
					onclick="location.href='${root}/community/ReviewList.do';">
					<a>Review</a>
				</div>
				<div id="detail"
					onclick="location.href='${root}/community/EventList.do';">
					<a>Event</a>
				</div>
				<div id="detail"
					onclick="location.href='${root}/community/Notice3.do';">
					<a>Notice</a>
				</div>
				<div id="detail"
					style="height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>
			<div id="content">
				<div id="mid1">
					<span id="viewDate"><fmt:formatDate value="${reviewDto.RVdate}" pattern="yyyy-MM-dd"/></span>
					<span id="viewcount"> 조회수 : ${reviewDto.RVcount}</span>  
					<span id="mid1_button">
						<c:if test="${Mid == reviewDto.writer || Mid == 'admin'}">
							<input type="button" value="수정" onclick="upFun('${root}', '${reviewDto.RVnumber}', '${pageNumber}')"/>
							<input type="button" value="삭제" onclick="delFun('${root}', '${reviewDto.RVnumber}', '${pageNumber}')"/>
						</c:if>
					</span>
				</div>
				<div id="mid2">
					<div style="display: inline-block;">
						<span style="font-size: 30px; line-height: 60px">${reviewDto.RVtitle}</span>
					</div>
					<div id="mid3">
						<div>
							작성자 <input type="text" value="${reviewDto.writer}" disabled="disabled"	style="width: 100px; text-align: center;" />
						</div>
					</div>
					<div id="mid4">
						<div id="mid_image">
							<img alt="${reviewDto.RVimgname}"
								src="${root}/resources/img/${reviewDto.RVimgname}">
						</div>
					</div>
					<div id="mid5">
						<span> </span>
					</div>
					<div id="mid6">
						<div style="word-break:break-all; overflow: auto; width: 80%; height: 206px;">
							${fn:replace(reviewDto.RVcontent, replaceChar, "<br/>")}
						</div>
						<div>
							<a href="${root}/community/ReviewList.do"><input
								type="button" value="목록"
								style="float: right; margin-right: 30px;" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>