<%@page import="pack.member.ZipcodeDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="memberManager" class="pack.member.MemberManager" />

<%
request.setCharacterEncoding("utf-8");

String check = request.getParameter("check"); // y or n
String dongName = request.getParameter("dongName");

ArrayList<ZipcodeDto> zlist = memberManager.zipcodeRead(dongName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/board.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
window.onload = () => {
	document.querySelector("#btnZipFind").onclick = dongCheck;
	
	document.querySelector("#btnZipClose").onclick = function(){
		window.close();
	}
	
}

function dongCheck() {
	if(zipForm.dongName.value === ""){
		alert("검색할 동 이름을 입력하셈");
		zipForm.dongName.focus();
		return;
	}
	zipForm.submit();
	
}

function sendDataFunc(code, a1, a2, a3, a4){
	// alert(code + a1 + a2 + a3 + a4);
	opener.document.regForm.zipcode.value = code;
	const addr = a1 + " " + a2 + " " + a3 + " " + a4 + " ";
	opener.document.regForm.address.value = addr;
	
	
	window.close(); // 주소 검색창 닫기
}
</script>
</head>
<body>
<strong>* 우편번호 찾기 *</strong>
<form action="zipcheck.jsp" name="zipForm" method="post">
<table>
   <tr>
   	 <td>
   	 동 이름 입력 : <input type="text" name="dongName" size="10">
   	 <input type="button" value="검색" id="btnZipFind">
   	 <input type="button" value="닫기" id="btnZipClose">
   	 <input type="hidden" name="check" value="n">
   	 </td>
   </tr>
</table>
</form>

<%
if(check.equals("n")){
	if(zlist.isEmpty()){
%>
	<b>검색 결과가 없습니다~</b>
<% 		
	}else{
%>
	<table>
	  <tr>
		  <td style="text-align: center;">검색 자료를 클릭하면 주소가 입력됩니다</td>	  
	  </tr>
	  <tr>
		<td>
		<%
		for(int i=0; i < zlist.size(); i++){
			ZipcodeDto zipcodeDto = (ZipcodeDto)zlist.get(i);
			String zipcode = zipcodeDto.getZipcode();
			String area1 = zipcodeDto.getArea1();
			String area2 = zipcodeDto.getArea2();
			String area3 = zipcodeDto.getArea3();
			String area4 = zipcodeDto.getArea4();
			if(area4 == null) area4 = "";
			//out.println(zipcode + " " + area1 + " " + area2 + " " + area3 + " " + area4 + "<br>");
		%>	
			<a href="javascript:sendDataFunc('<%=zipcode%>','<%=area1%>','<%=area2%>','<%=area3%>','<%=area4%>')"><%=zipcode%> <%=area1%> <%=area2%> <%=area3%> <%=area4%></a>
			<br>
		<%	
		}
		%>
		</td>
	  </tr>
	</table>
<% 		
	}
}
%>

</body>
</html>