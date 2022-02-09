<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="root" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${root}/resources/css/community/ReviewStyle.css" />
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function(){
    //이미지 객체 타입으로 이미지 확장자 밸리데이션
    var validateType = function(img){
        return (['image/jpeg','image/jpg','image/png'].indexOf(img.type) > -1);
    }

    var validateName = function(fname){
        let extensions = ['jpeg','jpg','png'];
        let fparts = fname.split('.');
        let fext = '';
    
        if(fparts.length > 1){
            fext = fparts[fparts.length-1];
        }
    
        let validated = false;
        
        if(fext != ''){
            extensions.forEach(function(ext){
                if(ext == fext){
                    validated = true;
                }
            });
        }
    
        return validated;
    }

    // 파일 선택 필드에 이벤트 리스너 등록
    document.getElementById('imageSelector').addEventListener('change', function(e){
        let elem = e.target;
        if(validateType(elem.files[0])){
            let preview = document.querySelector('.thumb');
            preview.src = URL.createObjectURL(elem.files[0]); //파일 객체에서 이미지 데이터 가져옴.
            document.querySelector('.dellink').style.display = 'block'; // 이미지 삭제 링크 표시
            preview.onload = function() {
                URL.revokeObjectURL(preview.src); //URL 객체 해제
            }
        }else{
        console.log('이미지 파일이 아닙니다.');
        }
    });

    document.querySelector('.dellink').addEventListener('click', function(e){
        let dellink = e.target;
        let preview = dellink.previousElementSibling;
        preview.src = ''; // 썸네일 이미지 src 데이터 해제
        document.querySelector('.dellink').style.display = 'none';
    });
});

</script>
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
			<form action="${root}/community/EventUpdateOk.do" method="post">
				<div id="content">
				
					<span id="viewcount">Viewcount</span> <span id="mid1_button">	
							<input type="submit" value="완료"
								style="margin-right: 30px; margin-top: 10px;" />
							<input type="reset" value="취소"/>	
					</span>
			
						<!-- 제목 -->
						<div id="mid2">
							<div style="display: inline-block;">
								<span style="font-size: 30px; line-height: 60px">제목</span>
								<input type="text" value="${eventDto.enumber}" name="enumber"/>
							</div>
							<div
							style="height: 60px; line-height: 60px; margin-left: 20px; display: inline-block; top: 0;">
							<span style="vertical-align: middle;"><input type="text" name="etitle" value="${eventDto.etitle}" 
								style="width: 500px; height: 30px; font-size: 24px;" /></span>
							</div>
						</div>
						
						<div id="mid3">
							<div>
								작성자 <input type="text" value="관리자" disabled="disabled"
									style="width: 100px; text-align: center;" />
									<fmt:formatDate value="${eventDto.edate}" pattern="yyyy-MM-DD HH:mm:ss"/>
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
								<textarea rows="10" cols="120" style="font-size: 17px;" name="econtent">${eventDto.econtent}</textarea>
							</div>
							
							<div>
									<input
									type="button" value="목록" onclick="location.href='${root}/community/EventList.do'"
									style="float: right; margin-right: 30px;" />
							</div>
						</div>	
				
				</div>
			</form>
		
		</div>
</body>
</html>