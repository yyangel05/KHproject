<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%
	session.invalidate();
%>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies!= null) {
		for(int i=0;i<cookies.length;i++) {
			if(cookies[i].getName().equals("MEMBERID")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
			if(cookies[i].getName().equals("password")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}
	
	
	%>

<html>
<head><title>로그아웃</title></head>
<body>

로그아웃 하였습니다.

</body>
</html>