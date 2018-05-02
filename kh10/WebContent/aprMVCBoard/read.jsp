<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "soldesk.MVCModelBoard.ReadArticleService" %>
<%@ page import = "soldesk.MVCModelBoard.ArticleNotFoundException" %>
<%@ page import = "soldesk.MVCModelBoard.Article" %>

<%
	int articleId = Integer.parseInt(request.getParameter("articleId"));
	String viewPage = null;
	try {
		Article article = ReadArticleService.getInstance().readArticle(articleId);
		request.setAttribute("article", article);
		viewPage = "read_view.jsp"; /* 잘 되면 read_view로 포워딩 */
	} catch(ArticleNotFoundException ex) {
		viewPage = "article_not_found.jsp"; /*예외가 발생하면 저쪽으로  포워딩*/
	}
%>

<jsp:forward page = "<%= viewPage %>"/>