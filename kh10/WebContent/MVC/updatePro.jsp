<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 수정폼에 입력한 비밀번호가 동일한 경우에 수행 -->
<c:if test="${check==1}">
	<meta http-equiv="Refresh" content="0;url=/kh10/MVC/list.do?pageNum=${pageNum}">
</c:if>

<!-- 수정폼에 입력한 비밀번호가 서로 다를 경우에 수행 -->
<c:if test="${check==0}">
	비밀번호가 다릅니다.
	<br>
	<a href="javascript:history.go(-1)">[글수정 폼으로 돌아가기]</a>
</c:if>