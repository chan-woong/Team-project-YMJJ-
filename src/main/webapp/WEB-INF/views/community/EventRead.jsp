<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function delFun(root, enumber, pageNumber, epath){
		var url=root + "/community/EventDeleteOk.do?enumber=" + enumber + "&pageNumber=" + pageNumber+"&epath="+epath;
		// alert(url);
		
		location.href=url;
	}
	
	function upFun(root, enumber, pageNumber){
		var url=root + "/community/EventUpdate.do?enumber=" + enumber + "&pageNumber=" + pageNumber;
		// alert(url);
		
		location.href=url;
	}

</script>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/resources/css/community/ReviewStyle.css"/>
<!-- 작성자 본인 이벤트 읽기 -->
</head>
<body>
	
		<div id="title">
			<a>Community</a>
		</div>
		<div id="menuF">
			<div id="category">
				<div id="detail" style="border-left: 0px;"></div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/ReviewList.do'">
					<a>Review</a>
				</div>
				<div id="detail" style="border-right: 0px; cursor: pointer;"
					onclick="location.href='${root}/community/EventList.do'">
					<a>Event</a>
				</div>
				<div id="detail" style="cursor: pointer;"
					onclick="location.href='${root}/community/Notice3.do'">
					<a>Notice</a>
				</div>
				<div id="detail"
					style="height: 630px; border-left: 0px; border-bottom: 0px;"></div>
			</div>
			
			<!-- 본문 -->
			
				<div id="content">
				
					<span id="viewcount"></span> <span id="mid1_button">
						<c:if test="${Mid == 'admin' }">
							<input type="submit" value="수정" onclick="upFun('${root}', '${eventDto.enumber}', '${pageNumber}')" style="margin-right: 30px; margin-top: 10px; float: right;"/>
							<input type="submit" value="삭제" onclick="delFun('${root}', '${eventDto.enumber}', '${pageNumber}','${eventDto.epath}')" style="margin-right: 30px; margin-top: 10px; float: right;"/>	
						</c:if>
					</span>
			
						<!-- 제목 -->
						<div id="mid2">
							<div style="display: inline-block;">
								<span style="font-size: 30px; line-height: 60px">제목</span>
							</div>
							<div
							style="height: 60px; line-height: 60px; margin-left: 20px; display: inline-block; top: 0;">
							<span style="vertical-align: middle;"><input type="text" name="etitle" value="${eventDto.etitle}" disabled="disabled"
								style="width: 500px; height: 30px; font-size: 24px;" /></span>
							</div>
						</div>
						
						<div id="mid3">
							<div>
								작성자 <input type="text" value="관리자" disabled="disabled"
									style="width: 100px; text-align: center;" />
									<fmt:formatDate value="${boardDto.edate}" pattern="yyyy-MM-DD HH:mm:ss"/>
							</div>
						</div>
						
						<!-- 이미지 -->
						<div id="mid4">
							<div id="mid_image">
								<img alt="${eventDto.efilename}"
									src="${root}/resources/img/${eventDto.efilename}">	
									
							</div>
						</div>
						
						<div id="mid5">
							<span> </span>
						</div>
						<div id="mid6">
							<div>
								<textarea rows="10" cols="120" style="font-size: 17px;" name="econtent" disabled="disabled">${eventDto.econtent}</textarea>
							</div>
							
							<div>
									<input
									type="button" value="목록" onclick="location.href='${root}/community/EventList.do'"
									style="float: right; margin-right: 30px;" />
							</div>
						</div>	
				
				</div>
		
		</div>
</body>
</html>