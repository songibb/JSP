package co.micol.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.notice.common.Command;
import co.micol.notice.service.NoticeService;
import co.micol.notice.service.NoticeVO;
import co.micol.notice.service.Impl.NoticeServiceImpl;

public class NoticeDelete implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		NoticeService ns = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		vo.setNoticeId(Integer.valueOf(request.getParameter("noticeId")));

		int n = ns.noticeDelete(vo);
		if (n != 0) {
			request.setAttribute("message", "정상적으로 삭제 되었습니다.");
		} else {
			request.setAttribute("message", "게시글 삭제가 실패했습니다.");
		}

		return "notice/noticeMessage";
	}

}
