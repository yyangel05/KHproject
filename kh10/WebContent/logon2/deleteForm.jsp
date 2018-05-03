<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../MVC/color.jspf" %>

<html>
<head>
<title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">

<script language="javascript">
<!--
function begin() {
	document.myform.passwd.focus();
}
function checkIt() {
	if(!document.myform.passwd.value) {
		alert("비밀번호를 입력하지 않으셨습니다.");
		document.myform.passwd.focus();
		return false;
	}
}

-->	
</script>
</head>

<body onload="begin()" bgcolor="${bodyback_c}">
<form name="myform" action="/kh10/aprLogon/deletePro.do" method="post" onsubmit="return checkIt()">
<table cellspacing="1" cellpadding="1" width="260" border="1" align="center">
	<tr height="30">
		<td colspan="2" align="middle" bgcolor="${title_c}">
			<font size="+1"><b>회원 탈퇴</b></font>
		</td>
	</tr>
	
	<tr height="30">
		<TD width="110" bgcolor="${value_c}" align="center">비밀번호</TD>
		<td width="150" align="center">
			<input type="password" name="passwd" size="15" maxlength="12">
			<input type="hidden" name="id" value="${sessionScope.memId}">
		</td>
	</tr>	
	
	<tr height="30">
		<td colspan="2" align="middle" bgcolor="${value_c}">
			<input type="submit" value="회원탈퇴">
			<input type="button" value="취    소" onclick="document.location.href='/kh10/aprLogon/main.do'">
		</td>
	</tr>	
</table>
</form>
</body>
</html>