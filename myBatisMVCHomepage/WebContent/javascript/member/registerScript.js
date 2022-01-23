/**
 * 
 */

function registerForm(obj) {
	if(obj.password.value != obj.passwordCheck.value){
		alert("비밀번호가 일치하지 않습니다.");
		obj.password.focus();
		return false;
	}
	
	var check = false;
	var str = "";
	for(var i = 0 ; i < obj.interestValue.length ; i++){
		if(obj.interestValue[i].checked==true){
			check=true;
			str += obj.interestValue[i].value + ",";
		}
	}
	
	if(check==false){
		alert("하나 라도 체크하세요.");
		return false;
	}
	obj.interest.value=str;
}


//아이디 체크
function idCheck(memberForm, root) {
	
	if(memberForm.id.value==""){
		alert("아이디를 반드시 입력해 주세요.")
		memberForm.id.focus();
		return;
	}
	
	var url = root+"/member/idCheck.do?id="+memberForm.id.value;
	//alert(url);
	
	//location.href=url;
	
	window.open(url,"아이디 중복 확인","width=300,height=150");
}
//우편번호
function zipcodeRead(root) {
	var url = root+"/member/zipcode.do";
	//alert(url);
	
	window.open(url,"우편번호 검색","width=400,height=400");
}
//우편번호 확인
function sendAddress (zipcode,sido,gugun,dong,ri,bunji) {
	var address = sido+gugun+dong+bunji;
	//alert(zipcode + "\n"+address);

	opener.memberForm.zipcode.value=zipcode;
	opener.memberForm.address.value=address;
	self.close();
}