<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>timeZone 태그 사용</title></head>
<body>

한국의 현재시간<br>
<c:set var="now" value="<%=new java.util.Date() %>"/>
<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" />
<br>
<p>
아르헨티나의 헌재시간<br>
<fmt:timeZone value="America/Argentina/Buenos_Aires">
	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full" />
</fmt:timeZone>

</body>
</html>