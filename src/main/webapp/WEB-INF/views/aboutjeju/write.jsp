<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdoutJEJU</title>
<c:set var="root" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${root}/resources/css/aboutjeju/write.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/KakaoAddress.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>
</head>
<body>
 <div>
   		<div id="title"><a>About JEJU</a></div>
        <form class="form-style" action="${root}/aboutjeju/writeOk.do?root=${root}" method="post" enctype="multipart/form-data">
        <div>
        <div id="menuF">
            <div id="category">
                <div id="detail" onclick="location.href='${root}/aboutjeju/introduction.do'"style="border-right: 0px;"><a>Introduction</a></div>
                <div id="detail" onclick="location.href='${root}/aboutjeju/location.do'"><a>Location</a></div>
                <div id="detail" onclick="location.href='${root}/aboutjeju/speciality.do'"><a>Speciality</a></div>
                <div id="detail" onclick="location.href='${root}/aboutjeju/activities.do'"><a>Activities</a></div>
                <div id="detail" style="height: 600px; border-left: 0px; border-bottom: 0px;"></div>               
            </div>
            
            <div id="content">
                <div style="border : 2px black solid; width: 1175px; height: 640px; margin-top: 40px;margin-left: 40px; overflow: hidden; padding: 50px 50px 50px 50px;">
					<select name="LMcategory" style="margin: 10px 10px 10px 10px;">
                         <option>종류</option>
                         <option value="introduction">introduction</option>
                         <option value="location">location</option>
                         <option value="speciality">speciality</option>
                         <option value="activites">activites</option>
                  </select>
               
                <div  style="margin: 10px 10px 10px 10px;"> <!-- fileboard에서  -->
					<label>제목<input type="text" name="LMtitle" size="10"></label>
				</div>
				<div  style="margin: 10px 10px 10px 10px;">
					<label>내용<input type="text" name="LMcontent" size="20"></label>
				</div>
                <div>
                	 <input id = "aboutimg " type="file" name="file" size="40" value="입력">
                	 
                </div >
                <div class="line"  style="margin: 10px 10px 10px 10px;">
                            <label class="title">Address</label>
                            <span class="content">
                                <input type="text" id="sample4_postcode" placeholder="우편번호" name="LMaddress" size="7"/>
                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                            </span>
                          </div>
            
                        <div class="line"  style="margin: 10px 10px 10px 10px;">
                            <label class="title"></label>
                            <span class="content">
                                <input style="margin: 10px 10px 10px 10px;" type="text" id="sample4_roadAddress" placeholder="도로명주소" name="LMpostalcode" size="30" />
                                <input  style="margin: 10px 10px 10px 10px;" type="hidden" id="y" name="LMlatitude"value=""/>
                                <input  style="margin: 10px 10px 10px 10px;" type="hidden" id="x" name="LMlongitude"value=""/>
                            </span>
                        </div>
				<input type="submit" value="입력" />
                </div>
             </div>
       	</div>
       	</div>
	   </form>
    </div>
</body>
</html>