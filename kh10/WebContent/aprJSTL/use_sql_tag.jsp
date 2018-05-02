<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<html>
<head><title>JSTL sql ¿¹Á¦ - query</title></head>
<body>

<sql:query var="rs" dataSource="jdbc:apache:commons:dbcp:/pool">
	select * from member
</sql:query>

<table border="1">
	<tr>
		<c:forEach var="columnName" items="${rs.columnNames}">
			<th><c:out value="${columnName}"/></th>
		</c:forEach>
	</tr>
	<c:forEach var="row" items="${rs.rowsByIndex}">
	<tr>
	<c:forEach var="column" items="${row}" varStatus="i">
	
	<td>
		<c:if test="${column!=null}">
			<c:out value="${column}" />
		</c:if>
		<c:if test="${column==null}">
			&nbsp;
		</c:if>
	</td>
	</c:forEach>
	</tr>
	</c:forEach>
</table>	
</body>
</html>