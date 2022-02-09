<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>레스토랑 수정 페이지</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/KakaoAddress.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>
<link rel="stylesheet" href="${root}/resources/css/restaurant/Restaurant_Update.css"/>
</head>
<body>
	
    <div id="title">  <!--  div1 -->
        <h4>Restaurant</h4>
    </div>

	<div id="content">
		<div id="sub_content">
            <form name="memberForm"  id="form_style"
                     action="${root}/restaurant/updateOk.do?RTnumber=${restaurantDto.RTnumber}&pageNumber=${pageNumber}" 
                     method="post"
                     enctype="multipart/form-data">
            <div id="subject1">
                <div id="subject2">  <!--  div1 -->
                    <h4>Update Restaurant</h4>
                </div>
                <div id="tedori_btn">
                    <div id="line_btn">
                        <input type="submit" value="수정"/>
                        <input type="reset" onclick="location.href='${root}/restaurant/main.do'" value="취소"/>
                    </div>
                </div>
            </div>
    
                <div id="nav0">
                    
                    <div id="nav1">


                        <div class="line">
    						
                            <label class="title">Name</label>
                            <span class="content">
                                <input type="text" name="RTname" size="7" maxlength="7" value="${restaurnatDto.RTname}"/>
                            </span>
            
                        </div>
                        <div class="line">
            
                            <label class="title">Number</label>
                            <span class="content">
                                <select name="RTcallnumber1">
                                    <option>번호</option>
                                    <option value="010">010</option>
                                    <option value="016">016</option>
                                    <option value="064">064</option>
                                </select>
								<script type="text/javascript">
									memberForm.RTcallnumber1.value="${restaurnatDto.RTcallnumber1}";
								</script>
                                <input type="text" name="RTcallnumber2" size="7" maxlength="4" value="${restaurnatDto.RTcallnumber2}"/>
                                <input type="text" name="RTcallnumber3" size="7" maxlength="4" value="${restaurnatDto.RTcallnumber3}"/>
                            </span>
                            
                        </div>
            
                        <div class="line">
                            <label class="title">Address</label>
                            <span class="content">
                                <input type="text" id="sample4_postcode" placeholder="우편번호" name="RTaddress" size="7" value="${restaurnatDto.RTaddress}"/>
                                <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                            </span>
                          </div>
            
                        <div class="line">
                            <label class="title"></label>
                            <span class="content">
                                <input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="RTpostalcode" size="30" value="${restaurnatDto.RTpostalcode}"/>
                            </span>
                        </div>
            
                        <div class="line">
                            <label class="title">Food Type</label>
                            <span class="content">
                                <select name="RTtype">
                                    <option>종류</option>
                                    <option value="회집">회집</option>
                                    <option value="한식">한식</option>
                                    <option value="중국식">중국식</option>
                                    <option value="일식">일식</option>
                                    <option value="까페">까페</option>
                                    <option value="식육(숯불구이)">식육(숯불구이)</option>
                                    <option value="외국음식전문점(인도.태국등)">외국음식전문점(인도.태국등)</option>
                                </select>
                            </span>
                        </div>
						<script type="text/javascript">
							memberForm.RTtype.value="${restaurnatDto.RTtype}";
						</script>
                    </div>
                </div>
                <div id="nav2">
                    <label class="title">Introduction</label>
                    <div id="img">
                         <textarea rows="10" cols="60" name="RTintroduce">${restaurnatDto.RTintroduce}</textarea>
                    </div>
                    <div id="nav_btn">
                    	<label>이미지 변경 시</label>
                        <input type="file" name="file" size="40" accept="image/*" />
                    </div>
                </div>
                <input type="hidden" id="x" name="RTlongitude" value="${restaurnatDto.RTlongitude}"/>
                <input type="hidden" id="y" name="RTlatitude" value="${restaurnatDto.RTlatitude}"/>
                <input type="hidden" name="RTnumber" value="${restaurnatDto.RTnumber}"/>
            </form>
        </div>
	</div>
</body>
</html>