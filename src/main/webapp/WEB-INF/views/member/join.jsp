<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/member.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/KakaoAddress.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>
<link rel="stylesheet" href="${root}/resources/css/member/member.css"/>
</head>
<body>
	<div id="register">
		<div id="subject">YMJJ</div>
		<div class="register_box">
		
			 <form name="memberForm"  id="form_style"  action="${root}/member/joinOk.do"  method="post" onsubmit="return joinForm(this)"> 
				 
			 <div class="J_line_box">
				<div class="line">
					<label class="J_title">Name</label>
					<span class="content">
						<input type="text" name="Mname"/>
					</span>
				</div>
					
				<div class="line">
					<label class="J_title">Regi.Num</label>
					<span class="content">
						<input type="text" name="Mresidentnumber1" size="11" maxlength="6" />							
						- <input type="password" name="Mresidentnumber2" size="12" maxlength="7" />
					</span>	
				</div>
				
				<div class="line">  
					<label class="J_title">ID</label>  
						
					<span class="content"> 
						<input type="text" name="Mid"/>
						<input type="button" value="IDCheck" onclick="idCheck(memberForm, '${root}')"/>
					</span>
				</div>
					
				<div class="line">
					<label class="J_title">Password</label>
					<span class="content">
						<input type="password" name="Mpassword" />
					</span>
				</div>
					
				<div class="line">
					<label class="J_title"></label>
					<span class="content">
						<input type="password" name="MpasswordCheck"/>
					</span>
				</div>
					
				<div class="line">
					<label class="J_title">Address</label>
					<span class="content">
	                    <input type="text" id="sample4_postcode" placeholder="우편번호" name="Mpostalcode" size="7"/>
	                    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
					</span>
				</div>
					
				<div class="line">
					<label class="J_title"></label>
					<span class="content">
						<input type="text" id="sample4_roadAddress" placeholder="도로명주소" name="Maddress" size="30" />
					</span>
				</div>
					
				<div class="line">
					<label class="J_title">E-Mail</label>
					<span class="content">
						<input type="email" name="Memail" size="22" />
					</span>
				</div>
					
				<div class="line">
					<label class="J_title">Tel)</label>
					<span class="content">
						<input type="text" name="Mcallnumber1" size="4" maxlength="3" />
						<input type="text" name="Mcallnumber2" size="9" maxlength="4" />
						<input type="text" name="Mcallnumber3" size="9" maxlength="4" />
					</span>	
				</div>
			</div>
				<div class="J_line_btn">
					<input type="submit" value="Okay"/>
					<input type="reset" value="Cancle"/>
				</div>
			</form>
		</div>
	</div>
</body>
</html>