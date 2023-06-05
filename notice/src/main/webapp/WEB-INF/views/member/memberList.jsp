<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<div><h1>회원 목록</h1></div>
		<div>
			<table border="1">
			<thead>
				<tr>
					<th width="200">아이디</th>
					<th width="150">이름</th>
					<th width="50">나이</th>
					<th width="150">전화번호</th>
					<th width="50">성별</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${members }" var="m">   <!-- 객체 하나당(테이블형태에서 한줄당) n으로 불러옴 -->
					<tr>
						<td align="center">${m.memberId }</td>
						<td align="center">${m.memberName }</td>
						<td align="center">${m.memberAge }</td>
						<td align="center">${m.memberTel }</td>
						<td align="center">${m.memberGender }</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>