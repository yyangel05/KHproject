<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<c:forEach var="menu" items="${userMenus}">
${menu.name}<br/>
</c:forEach>

<tiles:importAttribute name="adminMenus"/>
<c:forEach var="menu" items="${adminMenus}">
${menu.name}<br/>
</c:forEach>


