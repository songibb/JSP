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
		<div><h1>게시글 목록</h1></div>
		<div>
			<table border="1">
			<thead>
				<tr>
					<th width="100">순번</th>
					<th width="150">작성자</th>
					<th width="250">제목</th>
					<th width="150">작성일자</th>
					<th width="100">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${notices }" var="n">   <!-- 객체 하나당(테이블형태에서 한줄당) n으로 불러옴 -->
					<tr onmouseover='this.style.background="#cce6ff";'
						onmouseleave='this.style.background="#ffffff";'
						onclick="noticeChoice(${n.noticeId})">
						<td align="center">${n.noticeId }</td>
						<td align="center">${n.noticeWriter }</td>
						<td align="center">${n.noticeTitle }</td>
						<td align="center">${n.noticeWdate }</td>
						<td align="center">${n.noticeHit }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div><br>
		
		<div>
			<c:if test="${not empty id }">
				<button type="button" onclick="location.href='noticeInsertForm.do'">글쓰기</button>
			</c:if>
		</div>
		
		
		<div>
			<form id="frm" action="noticeSelect.do" method="post">
				<input type="hidden" id="noticeId" name="noticeId">
			</form>
		</div>
	</div>
	<div align="center">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>	
	
	<script type="text/javascript">
	function noticeChoice(id){
		//GET방식
		//let url = 'noticeSelect.do?noticeId='+id;
		//location.href = url;
		
		//POST방식 -> 폼객체에 말아서 전달
		let frm = document.getElementById("frm");
		frm.noticeId.value = id;
		frm.submit();
	}
	</script>
	

</body>
</html>