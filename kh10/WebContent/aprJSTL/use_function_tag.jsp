<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
<head><title>함수 사용</title></head>
<body>
<c:set var="str1" value="Functions <태그>를 사용합니다." />
<c:set var="str2" value="사용" />
<c:set var="tokens" value="1,2,3,4,5,6,7,8,9,10" />

length(str1) = ${fn:length(str1)}<br>
toUpperCase(str1) = "${fn:toUpperCase(str1)}" <br>
toLowerCase(str1) = "${fn:toLowerCase(str1)}" <br>
substring(str1,3,6) = "${fn:substring(str1,3,6)}" <br>
substringAfter(str1, str2) = "${fn:substringAfter(str1, str2)}" <br>
substringBefore(str1, str2) = "${fn:substringBefore(str1, str2)}" <br>
trim(str1) = "${fn:trim(str1)}" <br>
replace(str1,src,dest) = "${fn:replace(str1, " ","-")}" <br>
indexOf(str1, str2) = "${fn:indexOf(str1, str2)}" <br>
startsWith(str1, str2) = "${fn:startsWith(str1, 'Fun')}" <br>
endsWith(str1, str2) = "${fn:endsWith(str1,"합니다.")}" <br>
contains(str1, str2) = "${fn:contains(str1, str2)}" <br>
containsIgnoreCase(str1, str2) = "${fn:containsIgnoreCase(str1, str2)}" <br>

<c:set var="array" value="${fn:split(tokens,',')}" />

join(array, "-") = "${fn:join(array,"-")}" <br>
escapeXml(str1) = "${fn:escapeXml(str1)}" <br>


</body>
</html>


<!-- 결과화면
length(str1) = 22
toUpperCase(str1) = "FUNCTIONS <태그>를 사용합니다." 
toLowerCase(str1) = "functions <태그>를 사용합니다." 
substring(str1,3,6) = "cti" 
substringAfter(str1, str2) = "합니다." 
substringBefore(str1, str2) = "Functions <태그>를 " 
trim(str1) = "Functions <태그>를 사용합니다." 
replace(str1,src,dest) = "Functions-<태그>를-사용합니다." 
indexOf(str1, str2) = "16" 
startsWith(str1, str2) = "true" 
endsWith(str1, str2) = "true" 
contains(str1, str2) = "true" 
containsIgnoreCase(str1, str2) = "true" 
join(array, "-") = "1-2-3-4-5-6-7-8-9-10" 
escapeXml(str1) = "Functions <태그>를 사용합니다." 

 -->
