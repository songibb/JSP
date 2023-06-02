package co.micol.notice;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.notice.common.Command;
import co.micol.notice.main.command.MainCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		//처음 시작될 때 동작하는 초기화 메소드. 한번만 수행.
		//요청한 것을 담아 두는 곳
		map.put("/main.do", new MainCommand()); //처음 들어오는 페이지를 돌려준다.

	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청을 분석하고, 수행할 Command를 찾아서 수행하고, 결과를 돌려준다.
		
		request.setCharacterEncoding("utf-8");  //한글깨짐 방지
		
		//요청분석
		String uri = request.getRequestURI();  //request객체가 가지고 있는 URI(호출한 URI)를 가져옴
		String contextPath = request.getContextPath();  //root를 구함
		String page = uri.substring(contextPath.length());  //URI에서 contextPath를 뺀 나머지를 가져옴 -> 실제 요청한 페이지를 구함
		
		//수행할 command 찾아서 수행
		Command command = map.get(page);  //수행할 command를 가져옴
		String viewPage = command.exec(request, response);
		
		//viewPage를 사용자에게 보내주기
		if(!viewPage.endsWith(".do")) {    //.do로 끝나는게 아닐 때
			viewPage = "WEB-INF/views/" + viewPage + ".jsp";
		} else {   //.do로 끝나는게 들어왔을 때
			response.sendRedirect(viewPage);   //객체를 안싣고 위임
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);   //request, response를 실어서 줌
		

//		forward, sendRedirect : 처음에 위임받은 request객체는 안가져오고 response만 전송 
//		dispatcher : 처음에 위임받은 request객체를 들고와서 request,response 같이 전송 
	}

}