<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ include file="color.jsp" %>

<%
	Cookie[] cookie = request.getCookies();
	String id = "";
	String passwd="";
	if(cookie != null) {
		for(int i=0;i<cookie.length;i++) {
			if(cookie[i].getName().trim().equals("id")) {
				System.out.println(cookie[i].getValue());
				id= cookie[i].getValue();
			}
			if(cookie[i].getName().trim().equals("passwd")) {
				System.out.println(cookie[i].getValue());
				passwd= cookie[i].getValue();
			}
		}
	}
%>

<html>
<head><title>메인입니다.</title>
<link href = "style.css" rel ="stylesheet" type="text/css">

<%
	try {
		if(session.getAttribute("memId")==null) { 
%>
<script language="javascript" >
<!--
function focusIt() {
	document.inform.id.focus();	
}
function checkIt() {
	inputForm = eval("document.inform");
	if(!inputForm.id.value) {
		alert("아이디를 입력하세요.") ;
		inputForm.id.focus();
		return false;
	}
	if(!inputForm.passwd.value) {
		alert("비밀번호를 입력하세요.");
		inputForm.passwd.focus();
		return false;
	}
}0
//-->


//아이디 찾기를 수행하는 함수
function openFindId(iserinput) {
	//아이디를 입렸했는지 검사
	if(userinput.id.value == "") {
		alert("아이디를 입력하세요");
		return;
	}
	//url과 사용자입력 id를 조합합니다.
	url = "confirmId.jsp?id=" + userinput.id.value;
	
	//새로운 윈도우를 엽니다
	open(url,"confirm","toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
}
</script>
</head>
<body onLoad="focusIt();" bgcolor="<%=bodyback_c%>">
<table width=500 cellpadding="0" cellspacing="0" align="center" border="1">
	<tr>
		<td width="300" bgcolor="<%=bodyback_c%>" height="20">
		&nbsp;
		</td>
		
		<form name="inform" method="post" action="loginPro.jsp" onSubmit="return checkIt();">
		<td bgcolor="<%=title_c %>" width="100" align="right">아이디</td>
		<td width="100" bgcolor="<%=value_c%>">
			<input type="text" name="id" size="15" maxlength="10" value="<%=id%>" ></td>
		</tr>
		
		
		<tr>
			<td rowspan="2" bgcolor="<%=bodyback_c %>" width="300">메인입니다.</td>
			<td bgcolor="<%=title_c %>" width="100" align="right">패스워드</td>
			<td width="100" bgcolor="<%=value_c %>">
				<input type="password" name="passwd" size="15" maxlength="10" value="<%=passwd%>"></td>
				
		</tr>
		
		
		<tr>
			<td colspan="3" bgcolor="<%=title_c %>" align="center">
				<input type="submit" name="Submit" value="로그인">
				<input type="button" value="회원가입" onclick="javascript:window.location='inputForm.jsp'">
				<input type="checkbox" name="id_rem">아이디저장
			</td>
		</tr>
		
		
	<!-- 	여기는 관리자 모드일 때 회원신상정보를 리스트로 보여주는 예제 -->
		<tr>
			<td colspan="5" align="center">
				<input type="button"  value="회원명단찾기" onclick="javascript:window.location='userlistForm.jsp'">
			</td>
		</tr>
		
		
		
		
	</form>	
</table>
<% } else { %>
<table width="500" cellpadding="0" cellspacing="0" align="center" border="1">
	<tr>
		<td width="300" bgcolor="<%=bodyback_c%>" height="20">하하하</td>
		
		<td rowspan="3" bgcolor="<%=value_c%>" align="center">
		<%=session.getAttribute("memId") %>님이<br>방문하였습니다
		<form method="post" action="logout.jsp">
		<input type="submit" value="로그아웃">
		<input type="button" value="회원정보변경" onclick="javascript:window.location='modify.jsp'">
		
		</form>
		</td>
	</tr>
	<tr>
		<td rowspan="2" bgcolor="<%=bodyback_c %>" width="300">메인입니다</td>
	</tr>
</table>
<br>
<%}
} catch(NullPointerException e) {}
%>

</body>
</html>











