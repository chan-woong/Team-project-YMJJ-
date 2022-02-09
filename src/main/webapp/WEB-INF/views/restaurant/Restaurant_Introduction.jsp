<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>레스토랑</title>
<link rel="stylesheet" href="${root}/resources/css/restaurant/Restaurant_Introduction.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1b3be5083c3fb842c5d0ac3934a42c3"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
</head>
<body>

    <div id="title"> 
        <h4>Restaurant</h4>
    </div>

    <div id="content">
		<c:if test="${Mid == null}">
			<div id="btn_type">
	        </div>
		</c:if>
		<c:if test="${Mid != null}">
			<c:if test="${Mid == 'admin'}">
				<div id="btn_type" style="margin-left: 1058px;">
		            <input type="button" onclick="location.href='${root}/restaurant/write.do'" value="추가"/>
					<input type="button" onclick="location.href='${root}/restaurant/update.do?RTnumber=${restaurantDto.RTnumber}&pageNumber=${pageNumber}'" value="수정"/>
	            	<input type="button" onclick="location.href='${root}/restaurant/Restaurantdelete.do?RTnumber=${restaurantDto.RTnumber}&pageNumber=${pageNumber}'"value="삭제"/>

      		  	</div>
			</c:if>
			<c:if test="${Mid != 'admin'}">
	            
	            <form action="${root}/bookmark/writeOk.do?root=${root}"  
					  method="post"
					  enctype="multipart/form-data">
					  
					
					<c:if test="${check == 0}">	
						<div id="btn_type"></div>
					</c:if>  
					<c:if test="${check == 1}">
						<div id="btn_type">
							<button style="margin-right: 5px; height: 23px; border: 0; outline: 0; background-color: white;"type="button" value="북마크 추가" onclick="location.href='${root}/bookmark/writeOk.do?RTnumber=${restaurantDto.RTnumber}&Mid=${Mid}&pageNumber=${pageNumber}&Mid=${Mid}'"><img id="img_btnsize" src="${root}/resources/img/star1.png"></button>
      		  			</div>
					</c:if>
					<c:if test="${check == 2}">
						<div id="btn_type">
							<button style="height: 23px; border: 0; outline: 0; background-color: white;"type="button" value="북마크 제거" onclick="location.href='${root}/bookmark/bookmarkdeleteOk.do?RTnumber=${restaurantDto.RTnumber}&Mid=${Mid}&pageNumber=${pageNumber}&Mid=${Mid}'"><img id="img_btnsize" src="${root}/resources/img/star2.png"></button>
      		  			</div>
					</c:if>
	            	<input type="hidden" name="Bnumber" value="${Bnumber}"/>
	            	<input type="hidden" name="Mid" value="${Mid}"/>
	            	<input type="hidden" name="RTnumber" value="${restaurantDto.RTnumber}"/>
	            	<input type="hidden" name="RTname" value="${restaurantDto.RTname}"/>
	            
	            
	            </form>

			</c:if>
		</c:if>
        

        <div id="subject">

            <div id="Restaurant_photo"><img alt="pictures" src="${root}/resources/img/${restaurantDto.RTIname}" style="width: 380px; height: 423px; object-fit: fill;"></div>

            <div id="nav">

                <div id="rstitle">

                    <div id="restaurant_name">${restaurantDto.RTname}</div>
                    <div id="restaurant_introduction">${restaurantDto.RTintroduce}</div>

                </div>

                <div id="review">

                    <div id="review_title">Review</div>

                    <div id="comment_list_box" style="overflow: auto;">
                   
                   		<c:forEach var="commentsDto" items="${commentsList}">
                   			
                   			<div id="comment_list">

                            <div style="overflow: hidden;">
                                <strong style="float: left; margin-top: 2px; margin-left: 10px; margin-bottom: 2px; font-size: 13px;">${commentsDto.mid}</strong>
                                <div style="font-size: 13px; float: left; margin-top: 2px; margin-left: 20px;">
                                	<c:forEach begin="0" end="${commentsDto.CMliked-1}" var="x">
                                		<a>★</a>
                                	</c:forEach>
                                </div>
                            </div>
                            
                            <div style="float: left; overflow: hidden; font-size: 13px; margin-left: 10px;">${commentsDto.CMcontent}</div>

                        	</div>
                   			
                        </c:forEach>
                    </div>
                    <c:if test="${Mid != nill}">
	                    <form id="comment"
	                    	  action="${root}/comments/writeOk.do?root=${root}"  
							  method="post"
							  enctype="multipart/form-data">
	                        <div id="regi_comment">
	                            <strong name="id">${Mid}</strong>
	                            <input type="hidden" name="Mid" value="${Mid}"/>
	                            <input type="hidden" name="RTnumber" value="${restaurantDto.RTnumber}"/>
	                            <input type="hidden" name="pageNumber" value="${pageNumber}"/>
	
	                            <select name="CMliked" style="float: left; margin-top: 2px; margin-left: 20px; border: 0px;">
	                                <option>별점</option>
	                                <option value="1">★☆☆☆☆</option>
	                                <option value="2">★★☆☆☆</option>
	                                <option value="3">★★★☆☆</option>
	                                <option value="4">★★★★☆</option>
	                                <option value="5">★★★★★</option>
	                            </select>
	                            <textarea cols="43" name="CMcontent" rows="1" placeholder="댓글을 남겨보세요"></textarea>
	                        </div>
	
	                        <div id="btn_comment">
	                            <input type="submit" value="등록" style="border: 0; outline: 0; background-color: white; color: gray; float: right; margin-right: 2px;"/>
	                        </div> 
	                    </form>
					</c:if>
					<c:if test="${Mid == nill}">
						<div style="width: 340px; height: 70px; line-height: 70px; background-color: #dbdada; border-radius: 16px; margin-top: 9px;">로그인 후 작성이 가능합니다.</div>
					</c:if>
                </div>

            </div>

            <div id="kakaomap">

				<script type="text/javascript">
	                	var mapContainer = document.getElementById('kakaomap'), // 지도를 표시할 div 
	                	mapOption = { 
	                	    center: new kakao.maps.LatLng(${restaurantDto.RTlatitude}, ${restaurantDto.RTlongitude}), // 지도의 중심좌표
	                	    level: 2 // 지도의 확대 레벨
	                	};
	                	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	                	var map = new kakao.maps.Map(mapContainer, mapOption); 
	                	map.setDraggable(false);
	                	map.setZoomable(false);
                </script>
                <c:if test="${Count != 0}">
  
                	<script>
                		//alert(${Count});
                		var lat = parseFloat(${restaurantDto.RTlatitude});
                		var lon = parseFloat(${restaurantDto.RTlongitude});
                		//alert("위도" + lat + "경도" + lon);
                		var ${restaurantDto.RTnumber} = new kakao.maps.Marker({
                		   	map: map, 
                		    position: new kakao.maps.LatLng(lat, lon)
                			});
                			
                			// 커스텀 오버레이에 표시할 컨텐츠 입니다
                			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                			// 별도의 이벤트 메소드를 제공하지 않습니다 
                		var content = '<div class="wrap">' + 
                			          '    <div class="info">' + 
                			          '        <div class="title">' + 
                			          '           ${restaurantDto.RTname}' + 
                			          '            <div class="close" onclick="closeOverlay(overlay${restaurantDto.RTnumber})" title="닫기"></div>' + 
                			          '        </div>' + 
                			          '        <div class="body">' + 
                			          '            <div class="img">' +
                			          '                <img src="${root}/resources/img/${restaurantDto.RTIname}" width="73" height="70">' +
                			          '           </div>' + 
                			          '            <div class="desc">' + 
                			          '                <div class="ellipsis">${restaurantDto.RTintroduce}</div>' + 
                			          '                <div class="jibun ellipsis">${restaurantDto.RTaddress}</div>' + 
                			          '                <div><a href="#" target="_blank" class="link">가게페이지</a></div>' + 
                			          '            </div>' + 
                			          '        </div>' + 
                			          '    </div>' +    
                			          '</div>';
                		// 마커 위에 커스텀오버레이를 표시합니다
                		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                		var overlay${restaurantDto.RTnumber} = new kakao.maps.CustomOverlay({
                			content: content,
                			map: map,
                			position: ${restaurantDto.RTnumber}.getPosition()       
                			});
                			
                			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                		kakao.maps.event.addListener(${restaurantDto.RTnumber}, 'click', function() {
                			overlay${restaurantDto.RTnumber}.setMap(map);
                		});
                		closeOverlay(overlay${restaurantDto.RTnumber});
	                </script>
                </c:if>

			</div>
            
            <!--<c:if test="${restaurantDto.RTIname !=null}">
				<tr>
					<td align="center" height="30" width="200">파일명</td>
					<td colspan="3">
						<a href="${root}/fileboard/downLoad.do?boardNumber=${boardDto.boardNumber}">
							${boardDto.fileName} 
						</a>
					</td>		
				</tr>
			
			</c:if>-->



        </div>


    </div>
	
</body>
</html>