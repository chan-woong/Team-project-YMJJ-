<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>레스토랑 수정 페이지</title>
<link rel="stylesheet" href="${root}/resources/css/restaurant/Restaurant_Update.css"/>
</head>
<body>
	
    <div id="title">  <!--  div1 -->
        <h4>Restaurant</h4>
    </div>

	<div id="content">
		<div id="sub_content">

            <div id="subject1">
                <div id="subject2">  <!--  div1 -->
                    <h4>Update Restaurant</h4>
                </div>
                <div id="tedori_btn">
                    <div id="line_btn">
                        <input type="submit" value="수정"/>
                        <input type="reset" value="취소"/>
                    </div>
                </div>
            </div>

            
    
            <form name="memberForm"  id="form_style"
                     action="${root}/member/registerOk.do" 
                     method="post"
                     onsubmit="return registerForm(this)">
    
                <div id="nav0">
                    
                    <div id="nav1">


                        <div class="line">
    
                            <label class="title">Name</label>
                            <span class="content">
                                <input type="text" name="RTname" size="7" maxlength="7"/>
                            </span>
            
                        </div>
            
            
                        <div class="line">
            
                            <label class="title">Number</label>
                            <span class="content">
                                <select name="RTcallnumber">
                                    <option>번호</option>
                                    <option value="010">010</option>
                                    <option value="016">016</option>
                                    <option value="064">064</option>
                                </select>
                                <input type="text" name="number1" size="7" maxlength="4"/>
                                <input type="text" name="number2" size="7" maxlength="4"/>
                            </span>
                            
                        </div>
            
                        <div class="line">
                            <label class="title">Address</label>
                            <span class="content">
                                <input type="text" name="RTaddress" size="7"/>
                                <input type="button" value="우편번호검색" 
                                            onclick="zipcodeRead('${root}')"/>
                            </span>
                          </div>
            
                        <div class="line">
                            <label class="title"></label>
                            <span class="content">
                                <input type="text" name="RTpostalcode" size="30" />
                            </span>
                        </div>
            
                        <div class="line">
                            <label class="title">Food Type</label>
                            <span class="content">
                                <select name="RTtype">
                                    <option>종류</option>
                                    <option value="한식">한식</option>
                                    <option value="양식">양식</option>
                                    <option value="중식">중식</option>
                                    <option value="일식">일식</option>
                                </select>
                            </span>
                        </div>



                    </div>
  
                </div>
                <div id="nav2">

                    <label class="title">Introduction</label>
                    <div id="img">
                        <textarea rows="10" cols="60" name="massage"></textarea>
            
                    </div>
                    
                    <div id="nav_btn">

                        <input type="text" name=""/>
                        <input type="button" value="img"/>

                    </div>

                </div>
                
                     
            </form>

        </div>
	</div>
</body>
</html>