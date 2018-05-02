<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head><title>글 수정</title></head>

<body>
글을 수정했습니다.
<br/>

<a href="list.jsp?p=${param.p }">목록보기</a>
<a href="read.jsp?articleId=${updateArticle.id}&p=${param.p}">게시글 읽기</a>
</body>
</html>