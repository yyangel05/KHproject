<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import ="java.net.URLEncoder" %>
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length >0) { /*  클라이언트가 가져온 쿠키가 있다면 */
		for(int i=0;i<cookies.length; i++) {
			if(cookies[i].getName().equals("name")) {
				Cookie cookie = new Cookie("name",
					URLEncoder.encode("JSP프로그래밍","euc-kr"));
				response.addCookie(cookie);
			}
		}
	}
%>
<html>
<head><title>값 변경</title></head>
<body>
name 쿠키의 값을 변경합니다.
</body>
</html>