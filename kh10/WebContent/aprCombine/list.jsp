<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import = "soldesk.board.BoardDataBean" %>
<%@ page import = "soldesk.board.BoardDBBean" %>
<%@ page import = "soldesk.board.CommentDBBean" %>
<%@ page import = "soldesk.board.CommentDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "soldesk.logon.LogonDataBean" %>
<%@ page import = "soldesk.logon.LogonDBBean" %>

<%@ include file="color.jsp" %>

<%
	int pageSize=3;
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
	String pageNum = request.getParameter("pageNum");
	String search = request.getParameter("search");
	
	int searchn = 0;

	if(pageNum == null) {
		pageNum="1";
	}
	
	if(search == null) search="";
	else searchn = Integer.parseInt(request.getParameter("searchn"));
	
	int currentPage = Integer.parseInt(pageNum);
	System.out.println(currentPage);
	int startRow = (currentPage *3)-2;
	int endRow = currentPage * pageSize;
	int count=0;
	int number=0;
	
	List articleList = null;
	BoardDBBean dbPro = BoardDBBean.getInstance();
	
	if(search.equals("") || search == null) 
		count = dbPro.getArticleCount();
	else 
		count = dbPro.getArticleCount(searchn, search);
	
	CommentDBBean cdb = CommentDBBean.getInstance();
	
	if(count >0) {
		if(search.equals("") || search == null) 
			articleList = dbPro.getArticles(startRow, endRow);
		else
			articleList = dbPro.getArticles(startRow, endRow, searchn, search);
	}
		
	number = count-(currentPage-1)*pageSize; // 11 -(2-1) *3 = 8
%>
<%
	LogonDBBean member = LogonDBBean.getInstance();
/* 
	String id="";
	id = (string)session.getAttribute("id"); */
	String id = (String)session.getAttribute("memId");
	boolean login = (id==null)? false :true;
	System.out.println(login);
	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(id);

%>

	
<%--   <%
//로그인유무를 확인하는 코드
	String id = (string)session.getAttribute("memID");
	boolean login = (id==null)? false :true;
	System.out.println(login);

%>  --%>



<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count %>)</b>
<table width="700">
<tr>
<%	if(session.getAttribute("memId")==null) { %>
	<td align="right" bgcolor="<%=value_c %>">
	<a href="loginForm.jsp">로그인</a>
	</td>
<%	} else { %>
	<td align="right" bgcolor="<%=value_c %>">
	<%=c.getName() %> 접속
	<a href="writeForm.jsp">글쓰기</a>
	<a href="logout.jsp">로그아웃</a>
	</td>
<%	} %>
</table>
<%
	if(count ==0) {
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
	게시판에 저장된 글이 없습니다.
	</td>
</tr>	
</table>

<%} else { %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="<%=value_c %>">
		<td align="center" width="50">번  호</td>
		<td align="center" width="250">제    목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조  회</td>
		<td align="center" width="100">IP</td>
	</tr>
<%
	for(int i=0;i<articleList.size(); i++) {
		BoardDataBean article = (BoardDataBean)articleList.get(i);
		int com_count = cdb.getCommentCount(article.getNum());
%>	
	<tr height="30">
		<td align="center" width="50"><%=number-- %></td>
		<td align="left">
<%
	int wid=0;
	if(article.getRe_level()>0) {
		//답변글이라면
		wid=5*(article.getRe_level());
%>
	<img src="images/level.gif" width="<%=wid %>" height="16">
	<img src="images/re.gif">
<%}else{ %>	
	<img src="images/level.gif" width="<%=wid %>" height="16">
<%} %>	
<% if(com_count >0) { %>
	<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>">
			<%=article.getSubject() %> [<%=com_count %>]</a>
<%} else { %>
	<a href="content.jsp?num=<%=article.getNum() %>&pageNum=<%=currentPage %>">
			<%=article.getSubject() %></a>
<% } %>

	<% if(article.getReadcount() >=20) {%>
	<img src="images/hot.gif" border="0" height="16">
	<%} %></td>
		
		<td align="center" width="100"><a href="mailto:<%=article.getEmail() %>"><%=article.getWriter() %></a></td>
		<td align="center" width="150"><%= sdf.format(article.getReg_date()) %></td>
		<td align="center" width="50"><%=article.getReadcount() %></td>
		<td align="center" width="100"><%=article.getIp() %></td>

	<% } %>	
	</table>
<%} %>
<p>
<%
	if(count>0) {
		int pageCount = count/pageSize +(count % pageSize == 0? 0:1);
		
		int startPage = (int)(currentPage/5)*5+1;
		int pageBlock=5;
		int endPage= startPage + pageBlock-1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		if(startPage >5) {
			if(search.equals("") || search==null) {%>

		<a href="list.jsp?pageNum=<%=startPage -5 %>">[이전]</a>
<% } else {%>
		<a href	="list.jsp?pageNum=<%=startPage -5 %>&search=<%=search %>%searchn=<%=searchn %>">[이전]</a>	
<%	}%>
<%} 
		for(int i=startPage ; i<=endPage ; i++) { 
			if(search.equals("") || search==null) {
%>
			<a href="list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
	<% } else { %>			
			<a href="list.jsp?pageNum=<%=i %>&search=<%=search %>&searchn=<%=searchn %>">[<%=i %>]</a>
	<%} %>		
<%
}
		if(endPage <pageCount) {
			if(search.equals("") || search==null) {
			%>
		<a href = "list.jsp?pageNum=<%= startPage +5 %>">[다음]</a>
	<%} else { %>
		<a href ="list.jsp?pageNum=<%=startPage +5 %>&search=<%=search %>&searchn=<%=searchn %>">[다음]</a>
			<%
	}%>
	<%
		}
	}
%>
<p>

<%if(session.getAttribute("memId")==null) { %>
로그인하세요^.^
<% } else { %>
<form>
<select name="searchn">
<option value="0">작성자</option>
<option value="1">제목</option>
<option value="2">내용</option> 
</select>

<input type="text" name="search" size="15" maxlength="50"/> 
<input type="submit" value="검색"/>
</form>
<%} %>


<br></br>
</body>
</html>