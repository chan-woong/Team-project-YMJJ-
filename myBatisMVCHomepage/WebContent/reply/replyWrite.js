/**
 * 
 */
var root=null;
function writeToserver(requestRoot) {
	root=requestRoot;
	var writReply=document.getElementById("writReply").value;
	//alert(root + writReply);
	var url=root+"/reply/replyWrite.do";
	var params="writReply="+writReply;
	sendRequest("POST", url, params, writeFromServer);

}
function writeFromServer() {
	if (xhr.readyState==4 && xhr.status==200) {
		//alert(xhr.responseText);
		var obj=JSON.parse(xhr.responseText);
		var bunho=obj.bunho;
		var reply=obj.reply;
		//alert(obj+" , "+bunho+" , "+reply);
		
		document.getElementById("writReply").value="";
		var listAllDiv = document.getElementById("listAllDiv");
		
		var div=document.createElement("div");
		div.className="replyDiv";
		div.id=bunho;
		
		var spanBunho=document.createElement("span");
		spanBunho.className="cssBunho";
		spanBunho.innerHTML=bunho;

		var spanReply=document.createElement("span");
		spanReply.className="cssReply";
		spanReply.innerHTML=reply;
		

		var spanUpDel=document.createElement("span");
		spanUpDel.className="cssUpDel";

		var aDelete=document.createElement("a");
		aDelete.href="javascript:deleteToServer(" + bunho + ", \'" + root + "\')";
		aDelete.innerHTML="삭제 &nbsp";

		var aUpdate=document.createElement("a");
		aUpdate.href="javascript:upSelectToServer(" + bunho + ", \'" + root + "\')";
		aUpdate.innerHTML="수정";

		spanUpDel.appendChild(aDelete);
		spanUpDel.appendChild(aUpdate);

		div.appendChild(spanBunho);
		div.appendChild(spanReply);
		div.appendChild(spanUpDel);
		
		listAllDiv.insertBefore(div, listAllDiv.childNodes[0]);
		}
}
