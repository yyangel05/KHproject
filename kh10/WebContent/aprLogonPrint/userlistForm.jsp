<%@page import="soldesk.logon.LogonDBBean"%>
<%@page import="soldesk.logon.LogonDataBean"%>
<%@page import = "java.util.List" %>

<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ include file="color.jsp" %>
 
<%!
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
	
	List memberList = null;
	LogonDBBean dbPro = LogonDBBean.getInstance();
	
	if(search.equals("") || search == null) 
		count = dbPro.getMemberCount();
	
	if(count>0) memberList = dbPro.getMembers(startRow, endRow);
	
		
	number = count-(currentPage-1)*pageSize; // 11 -(2-1) *3 = 8
%>


<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>회원 목록(전체 회원 수:<%=count %>)</b>
<table width="700">
<tr>
	<td align="right" bgcolor="<%=value_c %>">
	<a href="writeForm.jsp">글쓰기</a>
	</td>
</tr>
</table>
 <table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="<%=value_c %>">
		<!-- <td align="center" width="40">번호</td> -->
		<td align="center" width="60">아이디</td>
		<td align="center" width="80">비밀번호</td>
		<td align="center" width="80">이름</td>
		<td align="center" width="170">주민번호</td>
		<td align="center" width="120">이메일</td>
		<td align="center" width="80">우편번호</td>
		<td align="center" width="220">주소</td>
		<td align="center" width="100">가입일</td>
		<td align="center" width="80">수정/삭제</td>	
	</tr>
	
<%
	 System.out.println("dfs"+memberList.size()); 
	for(int i=0;i<memberList.size(); i++) {
		LogonDataBean member = (LogonDataBean)memberList.get(i);
%>	
	<tr height="30">
		<%-- <td align="center" width="40"><%=number-- %></td> --%>
		
		<td align="center" width="60"><%=member.getId() %></td>
		<td align="center" width="80"><%=member.getPasswd() %></td>
		<td align="center" width="80"><%=member.getName() %></td>
		<td align="center" width="170"><%=member.getJumin1()%>-<%=member.getJumin2() %></td> 
		<td align="center" width="120"><%=member.getEmail() %></td>
		<td align="center" width="80"><%=member.getZipcode() %></td>
		<td align="center" width="220"><%=member.getAddress() %></td>
		<td align="center" width="100"><%=member.getReg_date() %></td>
		<td align="center" width="80"><a href="writeForm.jsp">수정</a>/<a href="writeForm.jsp">삭제</a></td>
	
	</tr>	 
<%
	}
%>	 

	
	
</table>

</body>
</html>
 
 <%-- <%
	for(int i=0;i<member.size(); i++) {
		LogonDataBean member = (LogonDataBean)member.get(i);
%>	
	<tr height="30">
		<td align="center" width="40"><%=number-- %></td>
		
		<td align="center" width="80"><%=article.getId() %></td>
		<td align="center" width="80"><%=article.getPasswd() %></td>
		<td align="center" width="80"><%=article.getName() %></td>
		<td align="center" width="150"><%=article.getJumin1()%>-<%=article.getJumin2() %></td>
		<td align="center" width="100"><%=article.getEmail() %></td>
		<td align="center" width="100"><%=article.getZipcode() %></td>
		<td align="center" width="100"><%=article.getAddress() %></td>
		<td align="center" width="100"><%=article.getReg_date() %></td>
		<td align="center" width="100">수정/삭제<%= %></td>
<%
	}
%>	 --%>


<!-- 
참고하기
http://all-record.tistory.com/123 -->