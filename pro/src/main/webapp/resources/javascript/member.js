/**
 * 
 */

//유효성 검사
function joinForm(obj){
	if(obj.Mpassword.value != obj.MpasswordCheck.value){
		alert("비밀번호를 확인해 주세요.")
		obj.Mpassword.focus();
		return false;
	}
	if(!document.memberForm.Mpostalcode.value){
	alert("password를 입력하세요");
	return false;
}
	if(memberForm.Mname.value==""){
		alert("이름을 입력해 주세요.")
		memberForm.Mname.focus();
		return;
	}
	if(memberForm.Mresidentnumber1.value=="" || memberForm.Mresidentnumber2.value==""){
		alert("주민번호를 입력해 주세요.")
		memberForm.Mresidentnumber1.focus();
		return;
	}
	if(memberForm.Mpostalcode.value=="" || memberForm.Maddress.value==""){
		alert("주소를 입력해 주세요.")
		memberForm.Mpostalcode.focus();
		return;
	}
	if(memberForm.Memail.value==""){
		alert("이메일을 입력해 주세요.")
		memberForm.Memail.focus();
		return;
	}
	if(memberForm.Mcallnumber1.value=="" || memberForm.Mcallnumber2.value=="" || memberForm.Mcallnumber3.value==""){
		alert("전화번호를 입력해주세요.")
		memberForm.Mcallnumber1.focus();
		return;
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

function zipcodeRead(root){
	var url=root + "/member/zipcode.do";
	//alert(url);
	
	window.open(url, "", "width=500, height=500");
}

function sendAddress(zipcode, sido, gugun, dong, ri, bunji){
	var address=sido+gugun+dong+ri+bunji;
	// alert(zipcode + "\n" + address);
	
	opener.memberForm.Mpostalcode.value=zipcode;
	opener.memberForm.Maddress.value=address;
	self.close();
}