<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록</title>
<script type="text/javascript" src="${root}/ajax/xhr/xhr.js"></script>
<script type="text/javascript">
	function toServer(root) {
		var selectText = document.getElementById("departmentName").value;
		var url = root+"/sawon/listOk.do";
		if (selectText != "부서를 선택하세요.") {
			var params = "departmentName="+ selectText
			sendRequest("POST", url, params, fromServer);
		}
	}
	function fromServer() {
		if (xhr.readyState==4&&xhr.status==200) {
			processJSON();
		}
	}
	function processJSON() {
		var obj=JSON.parse(xhr.responseText);
		//alert(obj.sawon.length);
		var resultDisp = document.getElementById("resultDisp");
		resultDisp.innerHTML="";
		
		var titleDisp = document.getElementById("titleDisp");
		titleDisp.style.display="block";
			
		for (var i = 0; i < obj.sawon.length; i++) {
			var tr=document.createElement("tr");
			var str="<td width='100' align='center'>"+obj.sawon[i].emp_id + "</td>";
			str += "<td width='100' align='center'>"+obj.sawon[i].name + "</td>";
			str += "<td width='100' align='center'>"+obj.sawon[i].HIRE_DATE + "</td>";
			str += "<td width='100' align='center'>"+obj.sawon[i].JOB_ID + "</td>";
			str += "<td width='100' align='center'>"+obj.sawon[i].SALARY + "</td>";
			
			str += "<td width='100' align='center'>"+obj.sawon[i].dept_id + "</td>";
			str += "<td width='100' align='center'>"+obj.sawon[i].dept_name + "</td>";
			tr.innerHTML=str;
			resultDisp.appendChild(tr);
			
		}
	}
</script>
</head>
<body>
	<select onchange="toServer('${root}')" id="departmentName">
		<option>부서를 선택하세요.</option>
		<c:forEach var="dept" items="${deptList}">
			<option value="${dept.DEPARTMENT_NAME}">${dept.DEPARTMENT_NAME}</option>
		</c:forEach>
	</select>
	<div id="titleDisp" style="display: none;">
		<table border="1">
			<tr>
				<td width='100' align='center' bgcolor="#DEDEDE">사번</td>
				<td width='100' align='center' bgcolor="#DEDEDE">이름</td>
				<td width='100' align='center' bgcolor="#DEDEDE">입사일</td>
				<td width='100' align='center' bgcolor="#DEDEDE">직종</td>
				<td width='100' align='center' bgcolor="#DEDEDE">급여</td>
				<td width='100' align='center' bgcolor="#DEDEDE">부서번호</td>
				<td width='100' align='center' bgcolor="#DEDEDE">부서명</td>
			</tr>
		</table>
	</div>
	<table id="resultDisp" border="1"></table>
</body>
</html>