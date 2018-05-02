<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="member" scope="request" class="kh.member.MemberInfo"></jsp:useBean>

<html>
<head><title>인사말</title></head>
<body>

<%= member.getName() %> (<%= member.getId() %>) 회원님
데쳐질 시간~
</body>
</html>