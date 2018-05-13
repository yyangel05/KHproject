package ssol.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.board.BoardDBBean;

public class ListAction implements CommandAction { //�� ��� ó��
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pageNum = request.getParameter("pageNum"); //��������ȣ
		String search = request.getParameter("search"); //�˻���
		
		int searchn=0;
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		if(search == null) search="";
		else searchn = Integer.parseInt(request.getParameter("searchn"));
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum); //�� �������� ���� ����
		int startRow = (currentPage-1)* pageSize +1; //�� �������� ���۱� ��ȣ
		int endRow = currentPage * pageSize; //�� �������� ������ �۹�ȣ
		int count=0;
		int number=0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance(); //DB����
		
		if(search.equals("") || search == null) //�˻�Ű���尡 ��������� 
			count = dbPro.getArticleCount(); //��ü ���� ��
		else //�˻�Ű���尡 ä����������
			count = dbPro.getArticleCount(searchn, search); //�˻��� ���� ��
		
		if(count > 0) {
			articleList = dbPro.getArticles(startRow, endRow); //���� �������� �ش��ϴ� �� ���
		}
		else {
			articleList = dbPro.getArticles(startRow, endRow, searchn, search);
		}
		
		number = count-(currentPage-1)*pageSize; //�� ��Ͽ� ǥ���� �� ��ȣ
		//�ش� �信�� ����� �Ӽ�
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
 //�˻���� �߰� �� �����ڵ�
 package ssol.action;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import soldesk.board.BoardDBBean;

public class ListAction implements CommandAction { //�� ��� ó��
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String pageNum = request.getParameter("pageNum"); //��������ȣ
		
		if(pageNum == null) {
			pageNum = "1";
		}
		
		int pageSize = 10;
		int currentPage = Integer.parseInt(pageNum); //�� �������� ���� ����
		int startRow = (currentPage-1)* pageSize +1; //�� �������� ���۱� ��ȣ
		int endRow = currentPage * pageSize; //�� �������� ������ �۹�ȣ
		int count=0;
		int number=0;
		
		List articleList = null;
		BoardDBBean dbPro = BoardDBBean.getInstance(); //DB����
		
		
		count = dbPro.getArticleCount(); //��ü ���� ��
		
		if(count > 0) {
			articleList = dbPro.getArticles(startRow, endRow); //���� �������� �ش��ϴ� �� ���
		}
		else {
			articleList = Collections.EMPTY_LIST;
		}
		
		number = count-(currentPage-1)*pageSize; //�� ��Ͽ� ǥ���� �� ��ȣ
		//�ش� �信�� ����� �Ӽ�
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