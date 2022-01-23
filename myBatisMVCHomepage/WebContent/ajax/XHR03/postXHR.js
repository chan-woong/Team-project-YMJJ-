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
	xhr.open("POST","server.jsp",true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("id="+id+"&password="+password);
	xhr.onreadystatechange=resultProcess;
}

function resultProcess() {

	if(xhr.readyState==4&&xhr.status==200){
		document.getElementById("resultDisp").innerHTML=xhr.responseText;
	}
	//alert(arr.join("\n"));
}
