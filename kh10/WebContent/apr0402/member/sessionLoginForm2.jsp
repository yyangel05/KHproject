<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head><title>세션 로그인 유지하는 폼</title></head>
<body>
<form action="<%= request.getContextPath() %>/apr0402/member/sessionLogin.jsp" method="post">
아이디 <input type="text" name="id" size="10">
암호 <input type="password" name="password" size="10" >
<input type="submit" value="로그인"> <br>
아이디 저장<input type="checkbox" >

</body>
</html>