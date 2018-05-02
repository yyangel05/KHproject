<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String id= request.getParameter("memberId");
	if(id.equals("khyy")) {
		response.sendRedirect("/kh10/mar0326/now.jsp");
	}
	else {
%>
<html>
<head><title>로그인에 실패</title></head>
<body>
아이디가 khyy가 아닙니다.
</body>
</html>
<%
	}
%>
	