<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DOM</title>
<script type="text/javascript">	
	function sub() {
		var formNode=document.createElement("form");
		formNode.action="#";
		formNode.method="post";
		formNode.name="checkForm";
		formNode.id="checkForm";
		formNode.onsubmit=function(){
			abc();
			return true;
		}
		
		var labelNode=document.createElement("label");
		labelNode.innerHTML="이름";
		
		var nameInput=document.createElement("input");
		nameInput.type="text";
		nameInput.name="name";
		nameInput.id="name";
		nameInput.size="12";
		
		var brNode=document.createElement("br");
		
		var submitInput=document.createElement("input");
		submitInput.type="submit";
		submitInput.value="전송";
		
		formNode.appendChild(labelNode);
		formNode.appendChild(nameInput);
		formNode.appendChild(brNode);
		formNode.appendChild(submitInput);
		
		document.body.appendChild(formNode);
	}
	function abc() {
		var name=document.getElementById("name");
		if (name.value=="") {
			alert("이름을 입력하세요");
			name.focus();
			return false;
		}else{
			alert("이름은 : "+ name.value)
		}
	}
</script>
</head>
<body onload="sub()">

</body>
</html>