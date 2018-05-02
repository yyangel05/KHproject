package soldesk.mvc.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NullHandler implements CommandHandler {
	public String process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		return "/aprMVC_0501/nullCommand.jsp";
	}
}
