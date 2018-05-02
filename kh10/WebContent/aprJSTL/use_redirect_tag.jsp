<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
 URL뒤에 ?dest=4를 입력하세요!
 
<c:if test="${param.dest == '1'}">
	<c:redirect url="/use_c_set.jsp"/> <!--   /use 에서 맨 앞의 /는 WebContent 바로 밑에서 파일을 찾기 때문에, 파일이 없으면 오류가 난다 -->
</c:if> 

<c:if test="${param.dest == '2'}">
	<c:redirect url="use_c_set.jsp"/>
</c:if>

<c:if test="${param.dest == '3'}">
	<c:redirect url="/aprEL/viewToday.jsp" context="/kh10"/>
</c:if>

<c:if test="${param.dest == '4'}">
	<c:redirect url="http://www.youtube.com/results">
		<c:param name="search_query" value="ryu" />
	</c:redirect>		
</c:if>
