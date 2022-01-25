<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Restaurant - Main</title>
<link rel="stylesheet" href="${root}/resources/css/restaurant/Restaurant_Main_Admin.css"/>
</head>
<body>

<div id="title"><a>Restaurant</a></div>

<div id="Main">

	<div style="font-size: 17px;"id="tag">
	
		<a>한식</a>
		
		<a>일식</a>
		
		<a>중식</a>
		
		<a>양식</a>
		
	</div>

	<div id="btn_type">
		<input type="button" value="추가"/>
		<input type="button" value="수정"/>
		<input type="button" value="삭제"/>
	</div>

	<div style="font-size: 17px;" id="list">
	
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름1</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름6</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름2</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름7</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름3</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름8</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름4</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름9</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름5</span>
		</li>
		
		<li>
			<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2F20150215_151%2Fevrcdae11_1423938174584lTSFl_JPEG%2F%25B0%25DC%25BF%25EF%25B9%25E8%25B0%25E6%25C8%25AD%25B8%25E9%25C0%25CC%25B9%25CC%25C1%25F6%25B5%25CE%25B9%25F8%25C0%25E7_%252813%2529.jpg&type=sc960_832"/>
			<span>대충 가게이름10</span>
		</li>
		
	</div>

</div>
</body>
</html>