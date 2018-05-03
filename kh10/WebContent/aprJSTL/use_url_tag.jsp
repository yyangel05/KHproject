<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<body>
<c:url value="http://search.daum.net/search" var="searchUrl">
	<c:param name="w" value="blog" />
	<c:param name="p" value="박지성" />
</c:url>

<ul>
	<li>${searchUrl}</li>
	<li><c:url value="/use_if_tag.jsp" /></li>
	<li><c:url value="./use_if_tag.jsp" /></li>
</ul>

</body>
</html>

<!--    결과값
http://search.daum.net/search?w=blog&p=%b9%da%c1%f6%bc%ba
/kh10/use_if_tag.jsp
./use_if_tag.jsp

 -->