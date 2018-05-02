<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)) {
		session.setAttribute("MEMBERID",id);
%>

<html>
<head><title>로그인성공</title></head>
<body>
로그인에 성공했습니다.
</body>
</html>
<%
	} else {
%>
<script>
alert("로그인에 실패했습니다.");
history.go(-1);
</script>
<%
	}
%>