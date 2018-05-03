package ssol.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.board.BoardDBBean;

public class ListAction implements CommandAction { //글 목록 처리
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pageNum = request.getParameter("pageNum"); //페이지번호
		String search = request.getParameter("search"); //검색어
		
		int searchn=0;
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		if(search == null) search="";
		else searchn = Integer.parseInt(request.getParameter("searchn"));
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum); //한 페이지의 글의 개수
		int startRow = (currentPage-1)* pageSize +1; //한 페이지의 시작글 번호
		int endRow = currentPage * pageSize; //한 페이지의 마지막 글번호
		int count=0;
		int number=0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance(); //DB연동
		
		if(search.equals("") || search == null) //검색키워드가 비어있을때 
			count = dbPro.getArticleCount(); //전체 글의 수
		else //검색키워드가 채워져있을때
			count = dbPro.getArticleCount(searchn, search); //검색한 글의 수
		
		if(count > 0) {
			articleList = dbPro.getArticles(startRow, endRow); //현재 페이지에 해당하는 글 목록
		}
		else {
			articleList = dbPro.getArticles(startRow, endRow, searchn, search);
		}
		
		number = count-(currentPage-1)*pageSize; //글 목록에 표시할 글 번호
		//해당 뷰에서 사용할 속성
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("articleList", articleList);
		
		request.setAttribute("search", search);
		request.setAttribute("searchn", searchn);
		
		
		return "/MVC/list.jsp";
	}

}



/*
 //검색기능 추가 전 원본코드
 package ssol.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.board.BoardDBBean;

public class ListAction implements CommandAction { //글 목록 처리
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pageNum = request.getParameter("pageNum"); //페이지번호
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum); //한 페이지의 글의 개수
		int startRow = (currentPage-1)* pageSize +1; //한 페이지의 시작글 번호
		int endRow = currentPage * pageSize; //한 페이지의 마지막 글번호
		int count=0;
		int number=0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance(); //DB연동
		
		
		count = dbPro.getArticleCount(); //전체 글의 수
		
		if(count > 0) {
			articleList = dbPro.getArticles(startRow, endRow); //현재 페이지에 해당하는 글 목록
		}
		else {
			articleList = Collections.EMPTY_LIST;
		}
		
		number = count-(currentPage-1)*pageSize; //글 목록에 표시할 글 번호
		//해당 뷰에서 사용할 속성
		request.setAttribute("currentPage", new Integer(currentPage));
		request.setAttribute("startRow", new Integer(startRow));
		request.setAttribute("endRow", new Integer(endRow));
		request.setAttribute("count", new Integer(count));
		request.setAttribute("pageSize", new Integer(pageSize));
		request.setAttribute("number", new Integer(number));
		request.setAttribute("articleList", articleList);
		
		return "/MVC/list.jsp";
	}

}

 
 */