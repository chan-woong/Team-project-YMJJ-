<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>map</title>
<link rel="stylesheet" href="${root}/resources/css/other/map.css"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1b3be5083c3fb842c5d0ac3934a42c3"></script>
<script type="text/javascript" src="${root}/resources/javascript/getmap.js"></script>
<script type="text/javascript" src="${root}/resources/javascript/other.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
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
    <div>
    	<div id="main_title">TODAY</div>
        <div id="M_menuF">
            <div id="subtitle">FOOD</div>
            <div id="M_content">
                <div id="map">
                	<script type="text/javascript">
	                	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	                	mapOption = { 
	                	    center: new kakao.maps.LatLng(33.365637, 126.526605), // 지도의 중심좌표
	                	    level: 9 // 지도의 확대 레벨
	                	};
	                	//지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	                	var map = new kakao.maps.Map(mapContainer, mapOption); 
                	</script>
                	<c:if test="${Count != 0}">
                	<c:forEach var="restaurnat" items="${RestaurnatList}">
                		<script>
                			//alert(${Count});
                			var lat = parseFloat(${restaurnat.RTlatitude});
                			var lon = parseFloat(${restaurnat.RTlongitude});
                			//alert("위도" + lat + "경도" + lon);
                			var ${restaurnat.RTnumber} = new kakao.maps.Marker({
                		    map: map, 
                		    position: new kakao.maps.LatLng(lat, lon)
                			});
                			
                			// 커스텀 오버레이에 표시할 컨텐츠 입니다
                			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                			// 별도의 이벤트 메소드를 제공하지 않습니다 
                			var content = '<div class="wrap">' + 
                			            '    <div class="info">' + 
                			            '        <div class="title">' + 
                			            '           ${restaurnat.RTname}' + 
                			            '            <div class="close" onclick="closeOverlay(overlay${restaurnat.RTnumber})" title="닫기"></div>' + 
                			            '        </div>' + 
                			            '        <div class="body">' + 
                			            '            <div class="img">' +
                			            '                <img src="${root}/resources/img/${restaurnat.RTIname}" width="73" height="70">' +
                			            '           </div>' + 
                			            '            <div class="desc">' + 
                			            '                <div class="ellipsis">${restaurnat.RTintroduce}</div>' + 
                			            '                <div class="jibun ellipsis">${restaurnat.RTcallnumber1} - ${restaurnat.RTcallnumber2} - ${restaurnat.RTcallnumber3}</div>' + 
                			            '                <div><a href="${root}/restaurant/introduction.do?RTnumber=${restaurnat.RTnumber}&pageNumber=1&Mid=${Mid}" target="_blank" class="link">가게페이지</a></div>' + 
                			            '            </div>' + 
                			            '        </div>' + 
                			            '    </div>' +    
                			            '</div>';
                			// 마커 위에 커스텀오버레이를 표시합니다
                			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                			var overlay${restaurnat.RTnumber} = new kakao.maps.CustomOverlay({
                			    content: content,
                			    map: map,
                			    position: ${restaurnat.RTnumber}.getPosition()       
                			});
                			
                			// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
                			kakao.maps.event.addListener(${restaurnat.RTnumber}, 'click', function() {
                				overlay${restaurnat.RTnumber}.setMap(map);
                			});
                			closeOverlay(overlay${restaurnat.RTnumber});
	                	</script>
                	</c:forEach>
                	</c:if>
                </div>
                
                <div id="check">
                    <div id="checkBox">
                        <div>
                            <input type="radio" value="횟집" name="category"/><label>횟집</label>
                            <input type="radio" value="한식" name="category"/><label>한식</label>
                            <input type="radio" value="중국식" name="category"/><label>중국식</label>
                            <input type="radio" value="일식" name="category"/><label>일식</label>
                        </div>
                        <div>
                            <input type="radio" value="까페" name="category"/><label>까페</label>
                            <input type="radio" value="식육(숯불구이)" name="category"/><label>식육(숯불구이)</label>
                            <input type="radio" value="외국음식전문점(인도.태국등)" name="category"/><label>외국음식전문점(인도.태국등)</label>
                        </div>
                        <script type="text/javascript">
                       		$("input:radio[name='category']:radio[value='${RTtype}']").prop('checked', true); // 선택하기
							$("input[name='category']:radio").change(function () {
							    //라디오 버튼 값을 가져온다.
							    var RTtype = this.value;
							    var url= "${root}/other/getRestaurnat.do?RTtype="+RTtype;
							    //alert(url);
							    location.href=url;
							});
							
						</script>
                    </div>
                    <div id="select">
                        <input type="text" placeholder="음식점 이름을 입력하세요" onkeyup="if(window.event.keyCode==13){search('${root}')}" id="RTname"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
