/**
 * 
 */

//유효성 검사
function joinForm(obj){
	if(memberForm.Mname.value==""){
		alert("이름을 입력해 주세요.")
		memberForm.Mname.focus();
		return false;
	}
	if(memberForm.Mresidentnumber1.value=="" || memberForm.Mresidentnumber2.value==""){
		alert("주민번호를 입력해 주세요.")
		memberForm.Mresidentnumber1.focus();
		return false;
	}
	if(memberForm.Mid.value==""){
		alert("아이디를 반드시 입력해 주세요.")
		memberForm.Mid.focus();
		return false;
	}
	if(!document.memberForm.Mpassword.value){
	alert("password를 입력하세요");
	return false;
	}
	if(obj.Mpassword.value != obj.MpasswordCheck.value){
		alert("비밀번호를 확인해 주세요.")
		obj.Mpassword.focus();
		return false;
	}
	if(memberForm.Mpostalcode.value=="" || memberForm.Maddress.value==""){
		alert("주소를 입력해 주세요.")
		memberForm.Mpostalcode.focus();
		return false;
	}
	if(memberForm.Memail.value==""){
		alert("이메일을 입력해 주세요.")
		memberForm.Memail.focus();
		return false;
	}
	if(memberForm.Mcallnumber1.value=="" || memberForm.Mcallnumber2.value=="" || memberForm.Mcallnumber3.value==""){
		alert("전화번호를 입력해주세요.")
		memberForm.Mcallnumber1.focus();
		return false;
	}
}

//아이디 체크
function idCheck(memberForm, root){
	if(memberForm.Mid.value==""){
		alert("아이디를 반드시 입력해 주세요.")
		memberForm.Mid.focus();
		return;
	}
	url=root + "/member/ID_Check.do?Mid="+memberForm.Mid.value;
	
	window.open(url, "", "width=250, height=200");
}
