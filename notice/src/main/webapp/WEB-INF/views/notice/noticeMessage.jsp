<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</div>
	<div align="center">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>