<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.util.Calendar" %>
<%
	Calendar cal = Calendar.getInstance();
	request.setAttribute("time",cal);
	response.sendRedirect("../to/viewTime.jsp");  
	/* 리다이렉트로 페이지 이동을 하면 nullpointexception이 발생한다 
	viewTime.jsp에서 객체를 가져다 쓸 때, 전달이 되지 않아 null이 들어있고, 없는 객체로 처리를 할 수 없기때문에 예외가 발생한다.
	
	*/
%>
<%-- <jsp:forward page = "/mar0330/to/viewTime.jsp" /> --%>

