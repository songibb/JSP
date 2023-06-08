package co.songi.prj.controller;

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

import co.songi.prj.MainCommand;
import co.songi.prj.common.Command;
import co.songi.prj.member.command.Contact;
import co.songi.prj.projects.command.Projects;
import co.songi.prj.resume.command.Resume;


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
		map.put("/main.do", new MainCommand());
		map.put("/resume.do", new Resume());
		map.put("/projects.do", new Projects());
		map.put("/contact.do", new Contact());
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//요청분석
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String page = uri.substring(contextPath.length());
		
		//수행할 command 찾아서 수행
		Command command = map.get(page); 
		String viewPage = command.exec(request, response);
		
		//viewPage를 사용자에게 보내주기
		if(!viewPage.endsWith(".do")) {    
//			viewPage = "WEB-INF/views/" + viewPage + ".jsp";
			viewPage += ".tiles";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);   
		} else {   
			response.sendRedirect(viewPage);  
		}
	}

}
