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
					<tr>
						<td align="center">${n.noticeId }</td>
						<td align="center">${n.noticeWriter }</td>
						<td align="center">${n.noticeTitle }</td>
						<td align="center">${n.noticeWdate }</td>
						<td align="center">${n.noticeHit }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</div>

</body>
</html>