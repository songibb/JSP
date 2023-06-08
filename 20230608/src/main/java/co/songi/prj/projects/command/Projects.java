package co.songi.prj.projects.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.songi.prj.common.Command;

public class Projects implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse reponse) {
		return "projects/projects";
	}

}
