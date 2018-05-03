<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="color.jspf" %>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="${bodyback_c}">
<center><b>글목록(전체 글: ${count})</b>
<table width="700">
	<tr>
		<td align="right" bgcolor="${value_c}" >	
			<a href="/kh10/MVC/writeForm.do">글쓰기</a>
		</td>
	</tr>
</table>

<!-- 게시글이 하나도 없을때의 처리로직 -->
<c:if test="${count == 0}">
<table width="700" border="1" cellpadding="0" cellspacing="0">
	<tr>
		<td align="center">
		게시판에 저장된 글이 없습니다.
		</td>
	</tr>
</table>
</c:if>

<!-- 게시글이 있을때의 처리로직 -->
<c:if test="${count > 0}">
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="${value_c}">
		<td align="center" width="50">번 호</td>
		<td align="center" width="250">제   목 </td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조 회</td>
		<td align="center" width="100">IP</td>
	</tr>
	<c:forEach var="article" items="${articleList}">
	<tr height="30">
		<!-- 번호 출력 -->
		<td align="center" width="50">
			<c:out value="${number}"/>
			<c:set var="number" value="${number -1}"/>
		</td>
		<!-- 제목 출력 -->
		<td width="250">
			<!-- 만약 답글이라면 -->
			<c:if test="${article.re_level > 0}">
			<img src = "images/level.gif" width="${5* article.re_level}" height="16">
			<img src = "images/re.gif">
			</c:if>
			<!-- 답글이 아니라면 -->
			<c:if test="${article.re_level == 0}">
			<img src = "images/level.gif" width="${5* article.re_level}" height="16">
			</c:if>
			
			<a href="/kh10/MVC/content.do?num=${article.num}&pageNum=${currentPage}">
			${article.subject}
			</a>
			
			<!-- 조회수가 20 이상이라면 hot한 아이콘을 출력한다 -->
			<c:if test="${article.readcount >=20}">
			<img src="images/hot.gif" border="0" height="16">
			</c:if>	
		</td>
		<!-- 작성자 출력 -->
		<td align="center" width="100">
			<a href="mailto:${article.email}">${article.writer}</a>
		</td>
		<!-- 작성일 출력 -->
		<td align="center" width="150"> ${article.reg_date}</td>
		<!-- 조회수 출력 -->
		<td align="center" width="50"> ${article.readcount}</td>
		<!-- ip 출력 -->
		<td align="center" width="100"> ${article.ip}</td>
	</tr>				
	</c:forEach>
</table>
</c:if>

<!-- 게시글이 있으면 페이징작업하기 -->
<c:if test="${count > 0}">
	<c:set var="pageCount" value="${count/pageSize + (count % pageSize == 0? 0:1)}"/>
	<c:set var="pageBlock" value="${10}"/>
	<fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true"/>
	<c:set var="startPage" value="${result * 10+1}" />
	<c:set var="endPage" value="${startPage + pageBlock-1}"/>
	<c:if test="${endPage > pageCount}">
		<c:set var="endPage" value="${pageCount}"/>
	</c:if>
	
	<!-- 이전섹션으로 넘어가기 링크 -->
	<c:if test="${startPage > 10}">
		<c:if test='${search.equals("") || search=null}'>
			<a href="/kh10/MVC/list.do?pageNum=${startPage - 10}">[이전]</a>
		</c:if>
		<c:if test="${search != null}">
			<a href="/kh10/MVC/list.do?pageNum=${startPage - 10}&search=${search}&searchn=${searchn}">[이전]</a>
		</c:if>
	</c:if>
	
	<!-- 이전과 다음 사이의 페이징 된 섹션의 번호 링크 -->
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<c:if test='${search.equals("") || search=null}' >
			<a href="/kh10/MVC/list.do?pageNum=${i}">[${i}]</a>
		</c:if>
		<c:if test="${search != null}">
			<a href="/kh10/MVC/list.do?pageNum=${i}&search=${search}&searchn=${searchn}">[${i}]</a>
		</c:if>
		
	</c:forEach>
	
	<!-- 다음섹션으로 넘어가기 링크 -->
	<c:if test="${endPage < pageCount}">
		<c:if test='${search.equals("") || search=null}' >
			<a href="/kh10/MVC/list.do?pageNum=${startPage + 10}">[다음]</a>
		</c:if>
		<c:if test="${search != null}">
			<a href="/kh10/MVC/list.do?pageNum=${startPage + 10}&search=${search}&searchn=${searchn}">[다음]</a>
		</c:if>	
	</c:if>

</c:if>

<!-- 검색 폼 만들기 -->
<p>
<form>
<select name="searchn">
	<option value="0">작성자</option>
	<option value="1">제목</option>
	<option value="2">내용</option> 
</select>

<input type="text" name="search" size="15" maxlength="50"/> 
<input type="submit" value="검색"/>
</form>

</center>
</body>
</html>