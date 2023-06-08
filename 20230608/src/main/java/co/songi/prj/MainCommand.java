package co.songi.prj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.songi.prj.common.Command;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse reponse) {
		return "main/main";  //FrontController에 viewpage에 들어가는 값
	}

}
