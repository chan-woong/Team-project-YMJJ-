<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage - Comment</title>
<link rel="stylesheet" href="${root}/resources/css/member/member.css"/>
</head>
<body>
    <div>
        <div id="title"><a>Mypage</a></div>
        <div id="menuF">
            <div id="category">
                <div id="detail" style="border-left: 0px;"></div>
                <div id="detail" style="border-right: 0px;"><a>Comment</a></div>
                <div id="detail" onclick="location.href='${root}/member/Mypage-Acc.do'"><a>Account</a></div>
                <div id="detail" style="height: 660px; border-left: 0px; border-bottom: 0px;"></div>
            </div>
            <div id="content">
                <div style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px;">
                    <div id="mycomment">
                        <div id="subtitle">My Review</div>
                        <div id="commentView">
                        	<table border="1">
								<c:forEach var="reviewDto" items="${reviewList}">
									<tr onclick="location.href='${root}/community/ReviewRead.do?RVnumber=${reviewDto.RVnumber}&pageNumber=1'">
									<td width="150px" height="30px" align="center">${reviewDto.RTname}</td>
									<td width="200px" height="30px" align="left">${reviewDto.RVtitle}</td>
									<td width="300px" height="30px" align="center">${reviewDto.RVcontent}</td>
									</tr>
								</c:forEach>
							</table>
                        </div>
                        <div id="subtitle">My Comment</div>
                        <div id="commentView">
                        	<table border="1">
								<c:forEach var="CommentList" items="${CommentList}">
									<tr>
									<td width="150px" height="30px" align="center">${CommentList.RTname}</td>
									<td width="200px" height="30px" align="left">
										<c:forEach begin="0" end="${CommentList.CMliked-1}">
	                                		<a>★</a>
	                                	</c:forEach>
									</td>
									<td width="265px" height="30px" align="center">${CommentList.CMcontent}</td>
									<td style="border: 0; outline: 0; background-color: white; color: gray; float: right; margin-right: 2px;" onclick="location.href='${root}/comments/Delete.do?CMnumber=${CommentList.CMnumber}&Mid=${CommentList.mid}'">삭제</td>
									</tr>
								</c:forEach>
							</table>
                        </div>
                    </div>
                    <div id="bookmark">
                        <div id="subtitle">BookMark</div>
                        <div id="BookmarkView">
                  		<c:forEach var="bookDto" items="${BookmarkList}">
                  			<div onclick="location.href='${root}/restaurant/introduction.do?RTnumber=${bookDto.RTnumber}&pageNumber=1&Mid=${bookDto.mid}'">
                  				<img src="${root}/resources/img/${bookDto.RTIname}" style="width: 85px; height: 75px;"/>
                  				<div id="I${bookDto.RTname}" style="font-weight: bolder; text-align: center;"></div>
	                  			<script type="text/javascript">
	                  			var name = "${bookDto.RTname}";
	                  			document.getElementById('I${bookDto.RTname}').innerHTML = name.substr(0, 5);
	                  			</script>
							</div>
						</c:forEach>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>