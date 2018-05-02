<%@ page contentType="text/html; charset=euc-kr" %>
<%
	String code = request.getParameter("code");
	String viewPageURI = null;
	
	if(code.equals("A")) {
		viewPageURI = "/mar0330/Module/a.jsp";
	}
	else if(code.equals("B")) {
		viewPageURI = "/mar0330/Module/b.jsp";
	}
	else if(code.equals("C")) {
		viewPageURI = "/mar0330/Module/c.jsp";
	}
%>
<jsp:forward page="<%= viewPageURI %>"></jsp:forward>