<%@ page contentType="text/html; charset=euc-kr" %>
<html>
<head><title>옵션 선택 화면</title></head>
<body>

<form action="<%= request.getContextPath()%>/mar0330/view.jsp">

보고 싶은 페이지 선택 : 
	<select name="code">
		<option value="A"> A page</option>
		<option value="B"> B page</option>
		<option value="C"> C page</option>
	</select>
	
	<input type="submit" value="이동">
</form>
</body>
</html>