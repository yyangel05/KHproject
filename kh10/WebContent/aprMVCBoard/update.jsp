<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="soldesk.MVCModelBoard.UpdateArticleService" %>
<%@ page import = "soldesk.MVCModelBoard.Article" %>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="updateRequest" class="soldesk.MVCModelBoard.UpdateRequest" />
<jsp:setProperty name="updateRequest" property="*" />
<%
	String viewPage = null;
	try {
		Article article = UpdateArticleService.getInstance().update(updateRequest);
		request.setAttribute("updatedArticle", article);
		viewPage = "update_success.jsp";		
	} catch (Exception e) {
		request.setAttribute("updateException", e);
		viewPage = "update_error.jsp";
	}

%>
<jsp:forward page="<%= viewPage %>"></jsp:forward>