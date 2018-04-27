<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="gallery.Theme"%>
<%@ page import="gallery.ThemeManager"%>
<%@ page import="gallery.ThemeManagerException"%>

<%
	String themeId = request.getParameter("id");

	ThemeManager manager = ThemeManager.getInstance();
	Theme theme = manager.select(Integer.parseInt(themeId));
%>
<c:set var="theme" value="<%=theme%>" />
<c:if test="${empty theme}">
존재하지 않는 테마 이미지 입니다.
</c:if>
<c:if test="${! empty theme}">
	<table width="100%" border="1" cellpadding="1" cellspacing="0">
		<tr>
			<td>제목</td>
			<td>${theme.title}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
				${theme.name}
				<c:if test="${empty theme.email}">
				<a href="mailto:${theme.email}">[이메일]</a>
				</c:if>
			</td>
		</tr>
		<c:if test="${! empty theme.image}">
			<tr>
				<td colspan="2" align="center">
					<img src="/KH10GALLERY/image/${theme.image}" width="150" border="0"
					style="cursor: pointer;" onclick="viewImage('/KH10GALLERY/image/${theme.image}')"/> 
					<br>
				</td>
			</tr>
		</c:if>
		<tr>
			<td>내용</td>
			<td><pre>${theme.content}</pre></td>
		</tr>
		<tr>
			<td colspan="2">
			<a href="javascript:goReply()">[답변]</a> 
			<a href="javascript:goModify()">[수정]</a>
			<a href="javascript:goDelete()">[삭제]</a> 
			<a href="javascript:goList()">[목록]</a>
			</td>
		</tr>
	</table>
</c:if>

<script language="JavaScript" type="text/javascript">
	function goReply() {
		document.move.action = "writeForm.jsp";
		document.move.submit();
	}
	function goModify() {
		document.move.action = "updateForm.jsp";
		document.move.submit();
	}
	function goDelete() {
		document.move.action = "deleteForm.jsp";
		document.move.submit();
	}
	function goList() {
		document.move.action = "list.jsp"
		document.move.submit();
	}
	
	/* 	이미지크게보기 함수. 이미지를 클릭하면 원본사이즈의 이미지가 출력되고, 클릭하면 브라우저가 닫힌다. */
	function viewImage(img){
		 /* W=img1.width; 
			H=img1.height;  */
		 W= new Image().width; 
		 H= new Image().height; 

		 O="width="+W+",height="+H+",scrollbars=yes"; 
		 imgWin=window.open("","",O); 
		 imgWin.document.write("<html><head><title>이미지상세보기</title></head>");
		 imgWin.document.write("<body topmargin=0 leftmargin=0>");
		 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
		 imgWin.document.close();
	}
	
	
</script>

<form name="move" method="post">
	<input type="hidden" name="id" value="${theme.id}"> 
	<input type="hidden" name="parentId" value="${theme.id}"> 
	<input type="hidden" name="groupId" value="${theme.groupId}"> 
	<input type="hidden" name="page" value="${param.page}">
	
	<c:forEach var="searchCond" items="${paramValues.search_cond}">
		<c:if test="${searchCond == 'title'}">
			<input type="hidden" name="search_cond" value="title">
		</c:if>
		<c:if test="${searchCond == 'name'}">
			<input type="hidden" name="search_cond" value="name">
		</c:if>
	</c:forEach>

	<c:if test="${! empty param.search_key}">
		<input type="hidden" name="search_key" value="${param.search_key}">
	</c:if>

</form>

<!-- **크게보기 관련 소스코드 블로그... -->
<!-- http://blog.naver.com/kdeun00/80158174297 -->
<!-- // 이미지 클릭시 원본 크기로 팝업 보기
function doImgPop(img){ 
 img1= new Image(); 
 img1.src=(img); 
 imgControll(img); 
} 
  
function imgControll(img){ 
 if((img1.width!=0)&&(img1.height!=0)){ 
    viewImage(img); 
  } 
  else{ 
     controller="imgControll('"+img+"')"; 
     intervalID=setTimeout(controller,20); 
  } 
} 

function viewImage(img){ 
 W=img1.width; 
 H=img1.height; 
 O="width="+W+",height="+H+",scrollbars=yes"; 
 imgWin=window.open("","",O); 
 imgWin.document.write("<html><head><title>:*:*:*: 이미지상세보기 :*:*:*:*:*:*:</title></head>");
 imgWin.document.write("<body topmargin=0 leftmargin=0>");
 imgWin.document.write("<img src="+img+" onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
 imgWin.document.close();
}

 

사용시

<img src="파일경로" width="295px" height="295px" title="클릭하시면 원본크기로 보실 수 있습니다."
     style="cursor: pointer;" onclick="doImgPop('파일경로')" " />


 -->
