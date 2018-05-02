<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "soldesk.MVCModelBoard.Comment" %>

<% request.setCharacterEncoding("euc-kr"); %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>



<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "soldesk.MVCModelBoard.WriteArticleService" %>
<%@ page import = "soldesk.MVCModelBoard.Article" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id = "writingRequest"
	class="soldesk.MVCModelBoard.WritingRequest" />
<jsp:setProperty name ="writingRequest" property="*" />
<%
	Article postedArticle = WriteArticleService.getInstance().write(writingRequest);
	request.setAttribute("postedArticle", postedArticle);
%>


<%
	String viewPage = null;
	try {
		Comment comment = UpdateArticleService.getInstance().insert(updateRequest);
		request.setAttribute("updatedArticle", comment);
		viewPage = "update_success.jsp";		
	} catch (Exception e) {
		request.setAttribute("updateException", e);
		viewPage = "update_error.jsp";
	}

%>


<html>
<head><title>게시글 작성</title></head>
<body>
게시글을 등록했습니다.
<br/>
<a href="<c:url value='list.jsp'/>">목록 보기</a>
<a href="<c:url value='read.jsp?articleId=${postedArticle.id}'/>">게시글 읽기</a>
</body>
</html>