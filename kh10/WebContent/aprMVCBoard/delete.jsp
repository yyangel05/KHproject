<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>
<%@ page import = "soldesk.MVCModelBoard.DeleteArticleService" %>

<jsp:useBean id="deleteRequest" class="soldesk.MVCModelBoard.DeleteRequest"/>
<jsp:setProperty name="deleteRequest" property="*" />

<%
	String viewPage = null;
	try {
		DeleteArticleService.getInstance().deleteArticle(deleteRequest);
		viewPage = "delete_success.jsp";
	} catch(Exception e) {
		request.setAttribute("deleteException", e);
		viewPage = "delete_error.jsp";
	}
%>
 <jsp:forward page="<%=viewPage %>"/>