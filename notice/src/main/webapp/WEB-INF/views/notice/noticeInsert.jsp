<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core"  prefix = "c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<jsp:include page="../main/menu.jsp"></jsp:include>
	</div>
	
	<div align="center">
		<div><h1>새 게시글 작성</h1></div>
		<div>
			<form id="frm" action="noticeInsert.do" method=post>
				<table border="1">
					<tr>
						<th width="100">작성자</th>
						<td width="250">
							<input type="text" id="noticeWriter" name="noticeWriter" value="${name }" readonly="readonly">
						</td>
						<th width="100">작성일자</th>
						<td width="250">
							<input type="date" id="noticeWdate" name="noticeWdate" required="required">
						</td>	
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3">
							<input type="text" id="noticeTitle" name="noticeTitle" size="80" required="required">						
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
							<textarea rows="15" cols="82" id="noticeSubject" name="noticeSubject" required="required"></textarea>
						</td>
					</tr>
				</table><br>
				
				<div>
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="취소">&nbsp;&nbsp;
					<button type="button" onclick="location.href='noticeList.do'">목록</button>
				</div>						
			</form>
		</div>
		
		
		
	</div>	
	
	<div align="center">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>	

</body>
</html>