<%@page import="java.util.TimeZone"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>시간대 목록</title></head>
<body>
<c:forEach var="id" items="<%=java.util.TimeZone.getAvailableIDs() %>"> <!-- 결과를 배열로 리턴받는다 -->
	${id}<br>
</c:forEach>
</body>
</html>