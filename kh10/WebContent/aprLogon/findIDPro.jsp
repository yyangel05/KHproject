<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "soldesk.logon.LogonDBBean" %>
<%@ include file="color.jsp" %>

<% request.setCharacterEncoding("euc-kr"); %>

<%
	String name= request.getParameter("name");

	LogonDBBean manager= LogonDBBean.getInstance();
	
	String findid = manager.findIdMember(name);

	System.out.println(findid);%>

<table>
	<tr>
		<td bgcolor="<%=value_c %>" align="center">
		<input type="text" name="id" size="10" value="<%=findid %>">
			<form>
				<input type="button" value="메인으로" onclick="window.location='main.jsp'">			
			</form>
			5초후에 메인으로 이동합니다.<meta http-equiv="Refresh" content="5;url=main.jsp">
		</td>
	</tr>
</table>
