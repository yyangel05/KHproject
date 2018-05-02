<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>if 태그</title></head>
<body>
<c:if test="true">
무조건 수행<br>
</c:if>

<c:if test="${param.name=='bk'}">
name 파라미터의 값이 ${param.name}입니다.<br>
</c:if>

<c:if test="${16 < param.age }">
당신의 나이는 16세 이상입니다.
</c:if>

</body>
</html>

<!-- URL에 ?age=22 ?name=bk ?age=22&name=bk 를 입력해야 동작한다 -->