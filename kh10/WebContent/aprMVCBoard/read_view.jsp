<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% 
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Cache-Control", "no-store");
	response.setDateHeader("Expires", 1L);
%>

<html>
<head><title>글 읽기</title></head>
<body>
<table>
	<tr>
		<td>제목</td>
		<td>${article.title}</td>
	</tr>
	<tr>
		<td>작성자</td>
		<td>${article.writerName}</td>
	</tr>
	<tr>
		<td>작성일</td>
		<td><fmt:formatDate value="${article.postingDate}"
			pattern="yyyy-MM-dd"/></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<pre><c:out value="${article.content}"/></pre>		
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<a href="list.jsp?p=${param.p}">목록보기</a>
		<a href="reply_form.jsp?parentId=${article.id}&p=${param.p}">답변쓰기</a>
		<a href="update_form.jsp?articleId=${article.id}&p=${param.p}">수정하기</a>
		<a href="delete_form.jsp?articleId=${article.id}">삭제하기</a>
		</td>
	</tr>		

<!-- 댓글관련 작업하기 -->
<!-- 댓글폼 만들기 -->
<table>
<form action="<c:url value='comment.jsp'/>" method="post">

	<tr>
		<td>
			<textarea name="commentt" rows="5" cols="20"></textarea>
		</td>
		
		<td>
			 <input type="text" name="commenter" size="10" placeholder="작성자"/><br/>
			 <input type="password" name="password" size="10" placeholder="글암호" /><br/>
			<input type="submit" value="전송"/><br/>
		</td>
	</tr>
	
</form>
</table>
<%-- 	
<!-- 댓글내용 출력하기 -->
	<c:choose>
		<c:when test="${listModel.hasArticle == false}">
		<tr>
			<td colspan="5">
				게시글이 없습니다.
			</td>
		</tr>		
		</c:when>
		<c:otherwise>
		<c:forEach var="article" items="${listModel.articleList}">
		<tr>
			<td>${article.id}</td>
				<td>
				<c:if test="${article.level >0}">
				<c:forEach begin="1" end="${article.level}">-</c:forEach>&gt;
				</c:if>
				<c:set var="query" value="articleId=${article.id}&p=${listModel.requestPage}"/>
				<a href="<c:url value="read.jsp?${query}"/>">
				${article.title}
				</a>
				</td>
			<td>${article.writerName}</td>
			<td>${article.postingDate}</td>
			<td>${article.readCount}</td>
		</tr>	
		</c:forEach>
		<tr>
			<td colspan="5">
			
			<c:if test="${beginPage >10}">
				<a href="<c:url value="list.jsp?p=${beginPage-1}"/>">이전</a>
			</c:if>
			<c:forEach var="pno" begin="${beginPage}" end="${endPage}">
			<a href="<c:url value="list.jsp?p=${pno}" />">[${pno}]</a>
			</c:forEach>
			<c:if test="${endPage < listModel.totalPageCount}">
				<a href="<c:url value="list.jsp?p=${endPage +1 }"/>">다음</a>
			</c:if>
			</td>
		</tr>
		</c:otherwise>
	</c:choose>	
	
	
	 --%>
	

</table>
</body>
</html>