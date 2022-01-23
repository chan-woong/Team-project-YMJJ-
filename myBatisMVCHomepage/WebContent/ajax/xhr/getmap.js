/**
 * 
 */

var xhr=null;
var arr=new Array();

function toServer() {
	var addr=document.getElementById("addr").value;
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
	alert(y + "\n" + x);
	
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(y,x),
		level: 3
	};

	var map = new kakao.maps.Map(container, options);
}