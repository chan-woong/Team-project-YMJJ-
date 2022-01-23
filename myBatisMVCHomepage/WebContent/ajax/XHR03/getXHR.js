/**
 * 
 */
var arr=new Array();
var xhr=null;

function startRequest() {
	var createForm=document.getElementById("createForm");
	var id=createForm.id.value;
	var password=createForm.password.value;
	arr.push(id+"\n"+password);
	
	xhr=new XMLHttpRequest();
	xhr.open("GET","server.jsp?id="+id+"&password="+password,true);
	xhr.send();
	xhr.onreadystatechange=resultProcess;
}

function resultProcess() {

	if(xhr.readyState==4&&xhr.status==200){
		arr.push(xhr.responseText);
		document.getElementById("resultDisp").innerHTML=xhr.responseText;
	}
	//alert(arr.join("\n"));
}
