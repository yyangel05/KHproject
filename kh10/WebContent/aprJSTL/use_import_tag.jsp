<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("euc-kr"); %>

<c:choose>
	<c:when test="${param.type=='flickr' }">
<!-- 	http://www.flickr.com/search?f=hq&q=보라매공원 -->
		<c:import url="https://www.flickr.com/search">
			<c:param name="f" value="hp"></c:param>
			<c:param name="q" value="보라매공원"></c:param>
		</c:import>
	</c:when>
	<c:when test="${param.type=='youtube'}">
		<c:import url="https://www.youtube.com/results">
			<c:param name="search_query" value="ryu" />
		</c:import>	
	</c:when>
	<c:otherwise>
		<c:import url="use_import_tag_help.jsp">
			<c:param name="message" value="선택해주세요" />
		</c:import>	
	</c:otherwise>
</c:choose>

<!-- URL에 ?type=flickr 을 넣어야 동작한다. -->