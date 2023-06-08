package co.songi.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.songi.prj.common.Command;

public class Contact implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse reponse) {
		return "member/contact";
	}

}
