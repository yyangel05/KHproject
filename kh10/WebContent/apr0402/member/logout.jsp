<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "util.CookieBox" %>
<%
	response.addCookie(CookieBox.createCookie("LOGIN","","/",0));
	response.addCookie(CookieBox.createCookie("ID","","/",0));
%>
<html>
<head><title>cookie 로그아웃</title></head>
<body>
로그아웃 하였습니다.
</body>
</html>