<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="color.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>
<jsp:useBean id="regBean" class="ssol.member.RegisterBean"></jsp:useBean>
<jsp:setProperty name="regBean" property="*"></jsp:setProperty>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입 확인</title>
<link href="style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="script.js"></script>
</head>
<body bgcolor="<%= bodyback_c%>">
<form action="gotoNaver.jsp" name="regForm" method="post" onsubmit="return inputCheck()" >
<table border="1" cellpadding="5" cellspacing="0" width="800" >
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
	<tr>
		<td colspan="3"><strong>회원가입 확인</strong></td>
	</tr>
	<tr>
		<th bgcolor="<%=title_c%>">아이디</th>
		<td bhcolor="<%=value_c %>"><jsp:getProperty property="id" name="regBean"></jsp:getProperty></td>
	</tr>
	<tr>
		<th bgcolor="<%=title_c%>">비밀번호</th>
		<td bhcolor="<%=value_c %>"><jsp:getProperty property="passwd" name="regBean"></jsp:getProperty></td>
	</tr>
	<tr>
		<th bgcolor="<%=title_c%>">비밀번호</th>
		<td bhcolor="<%=value_c %>"><jsp:getProperty property="repasswd" name="regBean"></jsp:getProperty></td>
	</tr>
	<tr>
		<th bgcolor="<%=title_c%>">이름</th>
		<td bhcolor="<%=value_c %>"><jsp:getProperty property="name" name="regBean"></jsp:getProperty></td>
	</tr>
	<tr>
		<th bgcolor="<%=title_c%>">이메일</th>
		<td bhcolor="<%=value_c %>"><jsp:getProperty property="email" name="regBean"></jsp:getProperty></td>
	</tr>
	<tr>
		<th bgcolor="<%=title_c%>">전화번호</th>
		<td bhcolor="<%=value_c %>"><jsp:getProperty property="tel" name="regBean"></jsp:getProperty></td>
	</tr>
	<tr>
	<td colspan="2" align="center"> <input type="submit" value="회원가입확인">
	
	</td>
	</tr>
</table>
</form>
</body>
</html>