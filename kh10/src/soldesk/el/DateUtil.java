package soldesk.el;

import java.text.SimpleDateFormat;
import java.util.Date;;

public class DateUtil {
	private static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd hh:mm:dd");
	
	//날짜출력하는 format메서드 정의
	public static String format(Date date) {
		return formatter.format(date);
	}

}
