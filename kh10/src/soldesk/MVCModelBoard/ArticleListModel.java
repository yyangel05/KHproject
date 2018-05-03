package soldesk.MVCModelBoard;

import java.util.ArrayList;
import java.util.List;

public class ArticleListModel {
	private List<Article> articleList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;
	
	//기본 생성자
	public ArticleListModel() {
		this(new ArrayList<Article>(),0,0,0,0);
	}
	
	//생성자 오버라이딩(파라미터 5개를 가짐)
	public ArticleListModel(List<Article> articleList, int requestPageNumber, int totalPageCount, int startRow, int endRow) {
		this.articleList = articleList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;			
	}
	
	public List<Article> getArticleList() {
		return articleList;
	}
	
	public boolean isHasArticle() {
		return ! articleList.isEmpty();
	}
	
	public int getRequestPage() {
		return requestPage;
	}
	
	public int getTotalPageCount() {
		return totalPageCount;
	}
	
	public int getStartRow() {
		return startRow;
	}
	
	public int getEndRow() {
		return endRow;
	}
	
}
