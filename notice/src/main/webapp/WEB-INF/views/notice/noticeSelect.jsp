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
		<div><h1>게시글 상세보기</h1></div>
		<div>
			<table border="1">
				<tr>
					<th width="50">순번</th>
					<td width="50" align="center">${notice.noticeId }</td>
					<th width="80">작성자</th>
					<td width="120" align="center">${notice.noticeWriter }</td>
					<th width="80">작성일자</th>
					<td width="120" align="center">${notice.noticeWdate }</td>
					<th width="50">조회수</th>
					<td width="50" align="center">${notice.noticeHit }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="7">${notice.noticeTitle }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="7">
						<textarea rows="15" cols="100"> ${notice.noticeSubject }</textarea>
					</td>
				</tr>				
			</table>
		</div><br>
		
		<div>
			<c:if test="${name eq notice.noticeWriter }">
				<button type="button" onclick="callFunction('E')">수정</button>&nbsp;&nbsp;
				<button type="button" onclick="callFunction('D')">삭제</button>&nbsp;&nbsp;
			</c:if>
			<button type="button" onclick="location.href='noticeList.do'">목록</button>
		</div>
	</div>
	
	<div align="center">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>	
	
	<!-- post방식으로 보내주기 위해 hidden form 만듦 -->
	<div>
		<form id="frm" method="post">
			<input type="hidden" id="noticeId" name="noticeId" value="${notice.noticeId }">
		</form>
	</div>	
	
<!-- 수정 삭제 각각 메소드 만들어도 되지만, 매개변수를 통해서 반복을 줄임 -->
<script type="text/javascript">
	function callFunction(str){
		let frm = document.getElementById("frm");
		if(str == 'E'){
			//위의 hidden form 객체의 action 속성 이용
			frm.action="noticeEdit.do";
		} else{
			frm.action="noticeDelete.do";
		}
		frm.submit();
	}
</script>
	
</body>
</html>