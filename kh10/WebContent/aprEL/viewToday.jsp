<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page session ="false" %>
<%@ taglib prefix="elfunc" uri="/WEB-INF/el-functions.tld" %>
<%
	java.util.Date today = new java.util.Date();
	request.setAttribute("today", today);
%>
 
<html>
<head>
<title>EL 함수 호출</title>
</head>
<body>
오늘은 <B>${elfunc:dateFormat(today)}</B>입니다
</body>
</html>