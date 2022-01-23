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
		var idLabel=document.createElement("label");
		idLabel.innerHTML="ID";
		
		var idInput=document.createElement("input");
		idInput.type="text";
		idInput.name="id";
		idInput.id="id";
		idInput.size="12";
		
		var pwdLabel=document.createElement("label");
		pwdLabel.innerHTML="PWD";

		var pwdInput=document.createElement("input");
		pwdInput.type="password";
		pwdInput.name="password";
		pwdInput.id="password";
		pwdInput.size="12";
		
		var nameLabel=document.createElement("label");
		nameLabel.innerHTML="name";
		
		var nameInput=document.createElement("input");
		nameInput.type="text";
		nameInput.name="name";
		nameInput.id="name";
		nameInput.size="12";
		
		var jobLabel=document.createElement("label");
		jobLabel.innerHTML="job";
		
		var jobSelect=document.createElement("select");
		jobSelect.name="job";
		jobSelect.id="job";

		var sel1 = document.createElement("option");
		sel1.value="회사원";
		var sel1Label=document.createElement("label");
		sel1Label.innerHTML="회사원";
		var sel2 = document.createElement("option");
		sel2.value="학생";
		var sel2Label=document.createElement("label");
		sel2Label.innerHTML="학생";
		var sel3 = document.createElement("option");
		sel3.value="전문직";
		var sel3Label=document.createElement("label");
		sel3Label.innerHTML="전문직";

		var meilLabel=document.createElement("label");
		meilLabel.innerHTML="Meil";

		var mailSelect1=document.createElement("input");
		mailSelect1.type="radio";
		mailSelect1.name="mail";
		mailSelect1.id="mail";
		mailSelect1.value="YES";
		
		var mailcheck1=document.createElement("label");
		mailcheck1.innerHTML="YES";
		
		var mailSelect2=document.createElement("input");
		mailSelect2.type="radio";
		mailSelect2.name="mail";
		mailSelect2.id="mail";
		mailSelect2.value="NO";
		
		var mailcheck2=document.createElement("label");
		mailcheck2.innerHTML="NO";
		
		var intLabel=document.createElement("label");
		intLabel.innerHTML="관심분야";

		var intInput1=document.createElement("input");
		intInput1.type="checkbox";
		intInput1.name="interestValue";
		intInput1.id="interestValue";
		intInput1.value="경제";
		var intcheck1=document.createElement("label");
		intcheck1.innerHTML="경제";
		
		var intInput2=document.createElement("input");
		intInput2.type="checkbox";
		intInput2.name="interestValue";
		intInput2.id="interestValue";
		intInput2.value="IT";
		var intcheck2=document.createElement("label");
		intcheck2.innerHTML="IT";
		
		var intInput3=document.createElement("input");
		intInput3.type="checkbox";
		intInput3.name="interestValue";
		intInput3.id="interestValue";
		intInput3.value="음악";
		var intcheck3=document.createElement("label");
		intcheck3.innerHTML="음악";

		var submitInput=document.createElement("input");
		submitInput.type="submit";
		submitInput.value="전송";

		document.body.appendChild(formNode);
		formNode.appendChild(idLabel);
		formNode.appendChild(idInput);
		formNode.appendChild(document.createElement("br"));
		
		formNode.appendChild(pwdLabel);
		formNode.appendChild(pwdInput)
		formNode.appendChild(document.createElement("br"));
		
		formNode.appendChild(nameLabel);
		formNode.appendChild(nameInput);
		formNode.appendChild(document.createElement("br"));
		
		formNode.appendChild(jobLabel);
		formNode.appendChild(jobSelect);
		jobSelect.appendChild(sel1);
		sel1.appendChild(sel1Label);
		jobSelect.appendChild(sel2);
		sel2.appendChild(sel2Label);
		jobSelect.appendChild(sel3);
		sel3.appendChild(sel3Label);
		formNode.appendChild(document.createElement("br"));
		
		formNode.appendChild(meilLabel);
		formNode.appendChild(mailSelect1);
		formNode.appendChild(mailcheck1);
		formNode.appendChild(mailSelect2);
		formNode.appendChild(mailcheck2);
		formNode.appendChild(document.createElement("br"));
		
		formNode.appendChild(intLabel);
		formNode.appendChild(intInput1);
		formNode.appendChild(intcheck1);
		formNode.appendChild(intInput2);
		formNode.appendChild(intcheck2);
		formNode.appendChild(intInput3);
		formNode.appendChild(intcheck3);
		formNode.appendChild(document.createElement("br"));

		formNode.appendChild(submitInput);
	}
	function abc() {
		var name=document.getElementById("name");
		var str="";
		str+=document.getElementById("id").value+" , ";
		str+=document.getElementById("password").value+" , ";
		str+=document.getElementById("name").value+" , ";
		str+=document.getElementById("job").value+" , ";
		str+=document.getElementById("mail").value+" , ";
		str+=document.getElementById("interestValue").value+" , ";
		alert(str);
	}
</script>
</head>
<body onload="sub()">

</body>
</html>