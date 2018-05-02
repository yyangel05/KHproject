<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<html>
<head><title>Hello</title></head>
<body>
<%= request.getAttribute("hello") %>
</body>
</html>





 
<!--  
http://localhost:8080/SSOL/controllerUsingFile?cmd=hello
http://localhost:8080/SSOL/controllerUsingFile
 -->
 
 
<!-- 
http://localhost:8080/SSOL/hello.do
http://localhost:8080/SSOL/*.do
 -->