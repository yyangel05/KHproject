<%@ page contentType="text/html; charset=ISO-8859-1" %> <%-- ISO-8859-1로 인해 한글깨짐이 발생한다 --%>
<%@ page import="java.util.Date" %>
<% 
	Date now = new Date();
%>
<html>
<head><title>현재 시간</title></head>
<body>
현재 시각 :  <%= now %>
</body>
</html>