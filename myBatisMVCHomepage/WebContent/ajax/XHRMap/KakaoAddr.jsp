<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MAP</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1b3be5083c3fb842c5d0ac3934a42c3"></script>
<script type="text/javascript" src="../xhr/getmap.js"></script>
<script type="text/javascript">
	function toServer() {
		var addr=document.getElementById("addr").value;
		//alert(addr);
		var url="https://dapi.kakao.com/v2/local/search/address.json";
		var params="query="+addr;
		sendRequest("GET", url, params, fromServer);
	}
	function fromServer() {
		if(xhr.readyState==4&&xhr.status==200){
			//alert(xhr.responseText);
			processJson();
		}
	}
	function processJson() {
		var obj=JSON.parse(xhr.responseText);
		var y = obj.documents[0].y;
		var x = obj.documents[0].x;
		alert(y + "\n" + x);
		
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(y,x),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	}
</script>
</head>
<body>
	<h3>주소</h3>
	<input type="text" id="addr"/>
	<input type="button" value="클릭" onclick="toServer()"/>
	<div id="map" style="width:500px;height:500px;"></div>
</body>
</html>