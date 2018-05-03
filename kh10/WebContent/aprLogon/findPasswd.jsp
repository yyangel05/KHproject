<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head><title>비밀번호찾기</title>
</head>

<body>
<form method="post" action="findPasswdPro.jsp">
<table>
	
	<tr>
		<td width="200">아이디입력</td>
		<td width="400">
			<input type="text" name="id" size="10" maxlength="12">
		</td>
	</tr>
	<tr>
		<td width="200">이름입력</td>
		<td width="400">
			<input type="text" name="name" size="10" maxlength="12">
		</td>

	</tr>
	<tr>
		<td>
			<input type="submit" value="비밀번호찾기">
		</td>
	</tr>
</table>
</form>
</body>
</html>