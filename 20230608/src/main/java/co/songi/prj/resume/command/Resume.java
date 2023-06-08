package co.songi.prj.resume.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.songi.prj.common.Command;

public class Resume implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse reponse) {
		// 
		return "resume/resume";
	}

}
