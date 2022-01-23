/**
 * 
 */

function deleteToServer(bunho,root) {
	//alert(bunho + " , " + root);
	var url=root+"/reply/replyDelete.do"
	var params="bunho="+bunho;
	
	sendRequest("GET",url, params,deleteFromServer);
	
}
function deleteFromServer() {
	if (xhr.readyState==4&&xhr.status==200) {
		//alert(xhr.responseText);
		var bunho=parseInt(xhr.responseText);
		
		if (bunho > 0) {
			var div = document.getElementById(bunho);
			var listAllDiv = document.getElementById("listAllDiv");
			listAllDiv.removeChild(div);
		}
	}
}