<%@ page pageEncoding="euc-kr" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import = "soldesk.FileIO.IncreaseDownloadCountService" %>
<%@ page import = "java.net.URLEncoder" %>
<%@ page import = "soldesk.FileIO.PdsItemNotFoundException" %>
<%@ page import = "soldesk.FileIO.FileDownloadHelper" %>
<%@ page import = "soldesk.FileIO.PdsItem" %>
<%@ page import = "soldesk.FileIO.GetPdsItemService" %>


<%
	int id = Integer.parseInt(request.getParameter("id"));
	try {
		PdsItem item = GetPdsItemService.getInstance().getPdsItem(id);
		
		response.reset();
		
		String fileName = new String(item.getFileName().getBytes("euc-kr"),"UTF-8");
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setContentLength((int)item.getFileSize());
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		
		FileDownloadHelper.copy(item.getRealPath(), response.getOutputStream());
		
		response.getOutputStream().close();
		
		IncreaseDownloadCountService.getInstance().increaseCount(id);
	} catch(PdsItemNotFoundException ex) {
		response.setStatus(HttpServletResponse.SC_NOT_FOUND);
	}
%>