<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/menu.css">
</head>
<body>
	<nav id="topMenu">
		<ul>
			<li><a href="main.do">Home</a></li>
			<li><a href="noticeList.do">Notice</a></li>
			<c:if test="${empty id}"> 
				<!-- 여기서 id는 session변수 (session변수는 jps페이지 전역에서 사용 가능) -->    
				<li><a href="memberJoin.do">MemberJoin</a>
			</c:if>		
			<li><a href="memberList.do">Member</a></li>
			<li><a href="#">보류</a></li>		
			<li><a href="#">보류</a></li>
			<c:if test="${empty id}">
				<li><a href="memberLoginForm.do">Login</a></li>
			</c:if>
			<c:if test="${not empty id}">
				<li><a href="memberLogout.do">Logout</a></li>
			</c:if>
			<c:if test="${not empty name}">
				<li><a href="#">${name}님 로그인</a></li>
			</c:if>
			
		</ul>
	</nav>
</body>
</html>