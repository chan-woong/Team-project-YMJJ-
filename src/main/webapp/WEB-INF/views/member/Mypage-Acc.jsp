<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage - Account</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/member.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/KakaoAddress.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>
<link rel="stylesheet" href="${root}/resources/css/member/member.css"/>
</head>
<body>
    <div>
        <div id="title"><a>Mypage</a></div>
        <div id="menuF">
            <div id="category">
                <div id="detail" style="border-left: 0px;"></div>
                <div id="detail" onclick="location.href='${root}/member/Mypage-Com.do?Mid=${Mid}'"><a>Comment</a></div>
                <div id="detail" style="border-right: 0px;"><a>Account</a></div>
                <div id="detail" style="height: 660px; border-left: 0px; border-bottom: 0px;"></div>
            </div>
            
            <div id="content">
            	<form name="memberForm"  id="form_style" action="${root}/member/updata.do?Mid=${memberDto.mid}" method="post" onsubmit="return joinForm(this)">
	                <div style="border : 2px black solid;  width: 1205px; height: 665px; margin-top: 40px; margin-left: 50px;">
	                    <div id="Account">
							<label class="name" style="margin-left: 50px;">Account</label>
							<br></br>
							<br></br>
						</div>
							<div class="line_box">
								<div class="line">
									<label class="title">Name</label>
									<span class="content">
										<input type="text" name="Mname" value="${memberDto.mname}" disabled="disabled"/>
									</span>
								</div>
								
								<div class="line">
									<label class="title">Regi.Num</label>
									<span class="content">
										<input type="text" name="Mresidentnumber1" size="11" maxlength="6" value="${memberDto.mresidentnumber1}" disabled="disabled"/>
										- <input type="password" name="Mresidentnumber2" size="12" maxlength="7" value="${memberDto.mresidentnumber2}" disabled="disabled"/>
									</span>	
								</div>
								
								<div class="line">  
									<label class="title">ID</label>  
									
									<span class="content"> 
										<input type="text" name="Mid" value="${memberDto.mid}" disabled="disabled"/>
									</span>
								</div>
								
								<div class="line">
									<label class="title">Password</label>
									<span class="content">
										<input type="password" name="Mpassword" value="${memberDto.mpassword}"/>
									</span>
								</div>
								
								<div class="line">
									<label class="title"></label>
									<span class="content">
										<input type="password" name="MpasswordCheck"/>
									</span>
								</div>
								
								<div class="line">
									<label class="title">Address</label>
									<span class="content">
					                    <input type="text" id="sample4_postcode" placeholder="우편번호" name="Mpostalcode" size="7" value="${memberDto.mpostalcode}"/>
					                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
									</span>
							  	</div>
								
								<div class="line">
									<label class="title"></label>
									<span class="content">
										<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="Maddress" size="30" value="${memberDto.maddress}"/>
									</span>
								</div>
								
								<div class="line">
									<label class="title">E-Mail</label>
									
									<span class="content">
										<input type="text" name="Memail" size="25" value="${memberDto.memail}"/>
									</span>
								</div>
								
								<div class="line">
									<label class="title">Tel)</label>
									
									<span class="content">
										<input type="text" name="Mcallnumber1" size="5" maxlength="3" value="${memberDto.mcallnumber1}"/>
										<input type="text" name="Mcallnumber2" size="10" maxlength="4" value="${memberDto.mcallnumber2}"/>
										<input type="text" name="Mcallnumber3" size="10" maxlength="4" value="${memberDto.mcallnumber3}"/>
									</span>	
								</div>
							</div>
						<div class="line_btn">
							<input type="submit" value="Okay"/>
							<input type="reset" value="Cancle"/>
						</div>
					</div>
				</form>	
			</div>
		</div>
	</div>
</body>
</html>