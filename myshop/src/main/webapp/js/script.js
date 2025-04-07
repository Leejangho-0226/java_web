function zipCheck(){
	let url = "zipcheck.jsp?check=y";
	
	window.open(url, "post", 
		"toolbar=no,width=500,height=400,top=200,left=100,status=yes,scrollbars=yes,menubar=no");
}
function idCheck(){
	if(regForm.id.value === ""){
		alert("id를 입력하시오");
		regForm.id.focus();
	}else{
		const url = "idcheck.jsp?id=" + regForm.id.value;
		window.open(url, "id", "toolbar=no,width=400,height=150,top=200,left=100");
	}
}
function inputCheck(){
	// 입력 자료 검사 후 서버로 전송
	if(regForm.id.value === ""){
		alert("id를 입력하세요우");
		regForm.id.focus();
		return;
	}
	
	// 이하 생략...
	
	regForm.submit();
}

// 회원 로그인 관련
function funcLogin(){
	if(loginForm.id.value === ""){
		alert("회원 id 입력");
		longinForm.id.focus();
	}else if(loginForm.passwd.value === ""){
		alert("회원 비밀번호 입력");
		longinForm.passwd.focus();
	}else{
		loginForm.action = "loginproc.jsp";
		loginForm.method = "post";
		loginForm.submit();
	}
}

function funcbtnNewMember(){
	locatrion.href = "register.jsp";
}

// 쇼핑몰 고객이 로그인 후 자산의 정보 수정
function memberUpdate(){
	// 입력자료 오류검사...
	
	document.updateForm.submit();
	
}  

function memberUpdateCancel(){
	location.href="../guest/guest_index.jsp";
}

function memberDelete(){
	alert("회원 탈퇴는 죽음으로 간주함");
}

// 관리자 관련
function funcAdminLogin(){
	if(adminloginForm.admin_id.value === ''){
		alert("관리자 id를 입력하세요");
		adminloginForm.admin_id.focus();
		return;
	}
	
	if(adminloginForm.admin_passwd.value === ''){
			alert("관리자 id를 입력하세요");
			adminloginForm.admin_passwd.focus();
			return;
		}
		
		adminloginForm.submit();
}

function funcAdminHome(){
	location.href="../guest/guest_index.jsp";
}

// 관리자 : 전체 회원 수정용
function memberUpdate(id){ 
	//alert(id);
	document.updateFrm.id.value = id;
	document.updateFrm.submit();
}

function memberUpdateAdmin(){
	document.updateFormAdmin.submit();
}

function memberUpdateCancelAdmin(){
	location.href = "membermanager.jsp";
}

function productDetail(no){ // 관리자 : 상품 처리
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function productUpdate(no){
	document.updateFrm.no.value = no;
	document.updateFrm.submit();
}

function productDelete(no){
	if(confirm("정말 삭제할까요?")){
		document.delFrm.no.value = no;
		document.delFrm.submit();
	}
}

// 고객 : 상품
function productDetailGuest(no){
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

// 관리자가 주문 처리 
function orderDetail(no){
	document.detailFrm.no.value = no;
	document.detailFrm.submit();
}

function orderUpdate(form){
	document.detailFrm.flag.value = "update";
	form.submit();
}

function orderDelete(form){
	document.detailFrm.flag.value = "delete";
	form.submit();
}

