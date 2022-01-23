/**
 * 
 */
var arr=new Array();
var xhr=null;

function sendRequest() {
	xhr=new XMLHttpRequest();
	arr.push(xhr);
	//alert(arr.join("\n"));
	xhr.open("GET","responseXML.xml",true);
	xhr.send();
	xhr.onreadystatechange=resultProcess;
}

function resultProcess() {
	
	if(xhr.readyState==4&&xhr.status==200){
		arr.push(xhr.responseXML);
		processXML();
	}
}

function processXML() {
	var xmlDoc=xhr.responseXML;
	var studentList=xmlDoc.getElementsByTagName("student");
	arr.push(studentList.length);
	for (var i = 0; i < studentList.length; i++) {
		var studnt=studentList[i];
		var subElement=studentList[i].childNodes;
		var divNode=document.createElement("div");
		
		for (var j = 0; j < subElement.length; j++) {
			var spanNode=document.createElement("span");
			var brNode=document.createElement("br");
			if(subElement[j].nodeType==1){
				arr.push(subElement[j].nodeName+" : "+subElement[j].childNodes[0].nodeValue);
				divNode.appendChild(spanNode);
				spanNode.innerHTML=subElement[j].nodeName+" : "+subElement[j].childNodes[0].nodeValue;
				divNode.appendChild(brNode);
			}
		}
		var disp=document.getElementById("dispResult");
		disp.appendChild(divNode);
	}
	
	
	//alert(arr.join("\n"));
}