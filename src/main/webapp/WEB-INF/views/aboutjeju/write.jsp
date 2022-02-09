<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IntroductionAdd</title>
<style type="text/css">
	div{
		margin: 30px 30px 30px 30px;
	}
</style>

<script type="text/javascript" src="${root}/resources/javascript/about.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/KakaoAddress.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>
</head>
<body>
	<form class="LMForm" action="${root}/aboutjeju/writeOk.do?root=${root}" method="post" enctype="multipart/form-data">
	  <div>
        <div id="title"><a>About JEJU</a></div>
        <div id="menuF">
            <div id="content">
            	<select name="LMcategory">
                         <option>종류</option>
                         <option value="introduction">introduction</option>
                         <option value="location">location</option>
                         <option value="speciality">speciality</option>
                         <option value="activites">activites</option>
                  </select>
                </div>
                <div> <!-- fileboard에서  -->
					<label>제목<input type="text" name="LMtitle" size="10"></label>
				</div>
				<div>
					<label>내용<input type="text" name="LMcontent" size="20"></label>
				</div>
                <div>
                	 <input id = "aboutimg " type="file" name="file" size="40" value="입력">
                	 
                </div>
                <div class="line">
                            <label class="title">Address</label>
                            <span class="content">
                                <input type="text" id="sample4_postcode" placeholder="우편번호" name="LMaddress" size="7"/>
                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                            </span>
                          </div>
            
                        <div class="line">
                            <label class="title"></label>
                            <span class="content">
                                <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="LMpostalcode" size="30" />
                                <input type="hidden" id="y" name="LMlatitude"value=""/>
                                <input type="hidden" id="x" name="LMlongitude"value=""/>
                            </span>
                        </div>
				<input type="submit" value="입력" />
             </div>
         </div>
   </form>
</body>
</html>