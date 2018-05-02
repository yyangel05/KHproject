<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "soldesk.MVCModelBoard.ReplyArticleService" %>
<%@ page import = "soldesk.MVCModelBoard.Article" %>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="replyingRequest" class="soldesk.MVCModelBoard.ReplyingRequest"/>
<jsp:setProperty name="replyingRequest" property="*"/>

<%
	String viewPage = null;
	try {
	
		Article postedArticle = ReplyArticleService.getInstance().reply(replyingRequest);
		request.setAttribute("postedArticle", postedArticle);
		viewPage = "reply_success.jsp";
	} catch(Exception e) {
		viewPage = "reply_error.jsp";
		request.setAttribute("replyException", e);
	}

%>
<jsp:forward page="<%=viewPage %>"/>


<!-- 
오류를 찾아낼 때는 이 코드로 값을 찍어서 확인할 수 있다.
System.out.println(request.getParameter("parentArticleId"));
System.out.println(replyingRequest.getParentArticleId()); 
-->
<!-- 
수동으로 부모아이디를 설정하기
replyingRequest.setParentArticleId(Integer.parseInt(request.getParameter("parentArticleId")));

 -->