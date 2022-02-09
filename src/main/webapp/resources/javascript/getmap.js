/**
 * 
 */

var xhr=null;
var arr=new Array();
//toServer(주소)호출시 경고창에 x y 출력
function toServer(address) {
	var addr = address;
	//alert(addr);
	var url="https://dapi.kakao.com/v2/local/search/address.json";
	var params="query="+addr;
	sendRequest("GET", url, params, fromServer);
}
function sendRequest(method, url, params, callback) {
	var httpMethod=method.toUpperCase();
	var httpUrl=url;
	var httpParams=(params==null||params=="") ? null : params;
	if(httpMethod=="GET" && httpParams != null){
		httpUrl += "?"+httpParams;
	}
	arr.push(httpMethod + " , " + httpUrl + " , "+ httpParams +" , "+callback);
	//alert(arr.join("\n"));
	
	xhr=new XMLHttpRequest();
	xhr.open(httpMethod,httpUrl,true);
	
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.setRequestHeader("Authorization","KakaoAK 107f86367749cb499142949423825b5c")
	xhr.send(httpMethod=="POST" ? httpParams : null);
	
	xhr.onreadystatechange=callback;
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
		//alert(y + "\n" + x);
		document.getElementById('y').value = y;
		document.getElementById('x').value = x;

}

function setDraggable(draggable) {
    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
    map.setDraggable(draggable);    
}
function panTo(x, y) {
    // 이동할 위도 경도 위치를 생성합니다 
    var moveLatLon = new kakao.maps.LatLng(x, y);
    
    // 지도 중심을 부드럽게 이동시킵니다
    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);            
}
// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay(overlay) {
    overlay.setMap(null);     
}










