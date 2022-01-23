/**
 * 
 */
var root=null;
function upSelectToServer(bunho,requestroot) {
	root=requestroot;
	//alert(bunho + " , " + root);
	var url=root+"/reply/replySelect.do"
	var params="bunho="+bunho;
	
	sendRequest("GET",url, params,upSelectFromServer);
	
}
function upSelectFromServer() {
	if (xhr.readyState==4&&xhr.status==200) {
		//alert(xhr.responseText);
		var Obj=JSON.parse(xhr.responseText);
		var bunho=Obj.bunho;
		var reply=Obj.reply;
		
		var div = document.createElement("div");
		div.id="upBunho"+bunho;
		var inputText=document.createElement("input");
		inputText.type="text";
		inputText.value=reply;
		
		var inputBtn=document.createElement("input");
		inputBtn.type="button";
		inputBtn.value="수정";
		inputBtn.onclick=function(){
			updateToServer(bunho, inputText.value);
		}

		div.appendChild(inputText);
		div.appendChild(inputBtn);
		
		if (bunho > 0) {
			var divBunho = document.getElementById(bunho);
			divBunho.appendChild(div);
		}
	}
}

function updateToServer(bunho, value){
	var url=root+"/reply/replyUpdate.do"
	var params="bunho="+bunho+"&lineReply="+value;
	//alert(url + " , " + params);
	sendRequest("GET",url, params,updateFromServer);
}

function updateFromServer(){
	if (xhr.readyState==4&&xhr.status==200) {
		var Obj=JSON.parse(xhr.responseText);
		var bunho=Obj.bunho;
		var reply=Obj.reply;
		//alert(bunho +" , " +reply);
		var bunhoDiv = document.getElementById(bunho);
		var span=bunhoDiv.getElementsByTagName("span");
		span[1].innerHTML=reply;
		
		var upBunho = document.getElementById("upBunho"+bunho);
		bunhoDiv.removeChild(upBunho);
	}
}







