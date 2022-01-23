/**
 * 
 */
var xhr=null;
var arr=new Array();
function startRequest() {
	xhr=new XMLHttpRequest();
	arr.push(xhr);
	
	xhr.open("GET","server.txt",true); // 요청방식, 서버 파일(Command), 비동기(true)
	xhr.send();
	xhr.onreadystatechange=resultProcess; //모든 응답이 이루어지면
}

function resultProcess() {
	arr.push(xhr.responseText);
	arr.push(xhr.status)
	
	if(xhr.readyState==4 && xhr.status==200){ // 요청이 정상으로 이루어짐
		//alert(xhr.responseText);
		
		var div=document.getElementById("resultDisp");
		div.style.color="red";
		div.innerHTML=xhr.responseText;
	}
	alert(arr.join("\n"));
}