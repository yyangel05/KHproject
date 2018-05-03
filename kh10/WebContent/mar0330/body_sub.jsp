<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>INFO</title></head>
<body>

body_sub에서 name 파라미터 값: <%= request.getParameter("name") %>
<br/>
name 파라미터 값 목록 : 
<ul>
<%
	String[] names = request.getParameterValues("name");
	for(String name : names) {
%>
	<li> <%= name %> </li>
<%
	}
%>
</ul>
</body>
</html>

<%--url창에 ?name=AIG 를 입력하면 name이 하나 더 추가된다. --%>