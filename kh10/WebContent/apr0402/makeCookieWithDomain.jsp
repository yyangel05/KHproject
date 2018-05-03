<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.net.URLEncoder" %>
<%
	/* cookie1은 도메인을 설정하고 객체생성하여 클라에게 보냄 */
	Cookie cookie1 = new Cookie("id","madvirus");
	cookie1.setDomain(".madvirus.net");
	response.addCookie(cookie1);
	
	/* cookie는 도메인을 설정하지 않고 객체생성하여 클라에게 보냄 */
	Cookie cookie2 = new Cookie("only", "onlycookie");
	response.addCookie(cookie2);
	
	/* cookie3은 도메인을 설정하고 객체생성하여 클라에게 보냄 */
	Cookie cookie3 = new Cookie("invalid","invalidcookie");
	cookie3.setDomain("javacan.tistory.com");
	response.addCookie(cookie3);	
%>
<html>
<head><title>쿠키생성</title></head>
<body>
다음과 같이 쿠키를 생성했습니다.<br>
<%= cookie1.getName()  %> = <%=cookie1.getValue() %>
[<%= cookie1.getDomain() %>]
<br>
<%= cookie2.getName()  %> = <%=cookie2.getValue() %>
[<%= cookie2.getDomain() %>]
<br>
<%= cookie3.getName()  %> = <%=cookie3.getValue() %>
[<%= cookie3.getDomain() %>]
<br>

</body>
</html>

<!-- 
실행화면에서는 onlycookie만 나타난다.
 다른 쿠키는 도메인이 다르기때문에 서버가 보내도 클라이언트가 받지 않는다 -->