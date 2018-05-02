<%@ page contentType="text/html; charset=euc-kr" %>
<%
	Cookie cookie = new Cookie("onet", "30sec");
	cookie.setMaxAge(30*1);
	response.addCookie(cookie);
%>
<html>
<head><title>쿠키유효 시간설정</title></head>
<body>

유효시간이 30초인 onet쿠키 생성
</body>
</html>