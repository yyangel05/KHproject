<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../MVC/color.jspf" %>

<html>
<head>
<title>회원탈퇴</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="${bodyback_c}">

<!-- 비밀번호가 동일할때의 로직 -->
<c:if test="${check==1}">
<c:remove var="memId" scope="session"/>

<form method="post" action="/kh10/aprLogon/main.do" name="userinput">
<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
	<tr bgcolor="${title_c}">
		<td height="39" align="center">
			<font size="+1"><b>회원정보가 삭제되었습니다.</b></font>
		</td>
	</tr>
	<tr bgcolor="${value_c}">
		<td align="center">
			<p>흑흑...잘가요 회원님......</p>
			<meta http-equiv="Refresh" content="5;url=/kh10/aprLogon/main.do">
		</td>
	</tr>		
	<tr bgcolor="${value_c}">
		<td align="center">
			<input type="submit" value="확인">
		</td>
	</tr>

</table>
</form> 
</c:if>

<!-- 비밀번호가 동일하지 않을때의 로직 -->
<c:if test="${check==0}">
<script>
	alert("비밀번호가 맞지 않습니다");
	history.go(-1);
</script>
</c:if>
</body>
</html>