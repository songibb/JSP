package co.micol.notice.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.notice.common.Command;
import co.micol.notice.member.service.MemberService;
import co.micol.notice.member.service.MemberVO;
import co.micol.notice.member.serviceImpl.MemberServiceImpl;

public class AjaxCheckId implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 아이디 중복체크(Ajax리턴)
		MemberService ms = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(request.getParameter("id"));
		vo = ms.memberSelect(vo);
		String str = "Ajax:";  //Ajax라는 것 알려주려고 붙여줌
		if(vo != null) {   //존재하는 아이디라면 vo가 채워져서 올 것 -> 사용할 수 없는 아이디
			str += "No";
		}else {   //아이디가 없다면 vo가 null인채 텅비워져서 올 것 -> 사용가능한 아이디
			str += "Yes";
		}
		return str;
	}
	

}
