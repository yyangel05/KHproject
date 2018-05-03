<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page isErrorPage="true" %>
<html>
<head><title>예외 발생</title>
<script>
function showDetail() {
	d= document.getElementById('detail');
	d.style.display='block';
}
</script>
</head>
<body>
<h3 id="header"><%= exception.getClass().getName() %></h3>
<div id="main" >
	<%= exception.getMessage() %>
	<input type="button" onClick="showDetail()" value="상세보기">
	<div id="detail" style="display:none"><% exception.printStackTrace(new java.io.PrintWriter(out)); %>
	</div>
</div>

<%-- 요청 처리 과정에서 예외가 발생하였습니다.<br>
빠른 시간 내에 문제를 해결하도록 하겠습니다.
<p>
에러 타입: <%= exception.getClass().getName() %> <br>
에러 메세지: <b><%= exception.getMessage() %></b> --%>
</body>
</html>