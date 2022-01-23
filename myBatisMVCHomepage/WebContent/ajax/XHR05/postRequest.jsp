
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX</title>
<script type="text/javascript" src="../xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer() {
		var form=document.getElementById("createForm");
		var intputText=form.msg.value;
		var params="msg="+intputText;
		//alert(params);
		sendRequest("POST", "server.jsp", params, fromserver);
	}
	
	function fromserver() {
		if(xhr.readyState==4 && xhr.status==200){
			alert(xhr.responseText);
		}
	}
</script>
</head>
<body>
	<h3>POST XHR</h3>
	<form action="#" id="createForm">
		<input type="text" name="msg"/>
		<input type="button" value="입력" onclick="toServer()"/>
	</form>
</body>
</html>