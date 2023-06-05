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
		<h1>${message }</h1>
		<button type="button" onclick="location.href='memberList.do'">멤버목록</button>
	</div>
</body>
</html>