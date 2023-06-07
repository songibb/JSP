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
		<div><h1>회원가입</h1></div>
		<div>
			<form id="frm" action="memberInsert.do" onsubmit="return formCheck()" method="post">
			
				<div>
					<table border="1">
						<tr>
							<th width="150">* 아이디</th>
							<td width="300">
								<input type="email" id="memberId" name="memberId">
								<button type="button" id="checkId" value="No" onclick="idCheck()">중복체크</button>
							</td>
						</tr>
						<tr>
							<th>* 비밀번호</th>
							<td>
								<input type="password" id="memberPassword" name="memberPassword" required="required">
							</td>
						</tr>
						<tr>
							<th>* 비밀번호 확인</th>
							<td>
								<input type="password" id="passwordCheck" name="passwordCheck" required="required">
							</td>
						</tr>
						<tr>
							<th>* 이름</th>
							<td>
								<input type="text" id="memberName" name="memberName" required="required">
							</td>
						</tr>
						<tr>
							<th>나이</th>
							<td>
								<input type="text" id="memberAge" name="memberAge">
							</td>
						</tr>
						<tr>
							<th>* 연락처</th>
							<td>
								<input type="tel" id="memberTel" name="memberTel" required="required">
							</td>
						</tr>
						<tr>
							<th>* 성별</th>
							<td>
								<input type="radio" id="memberGender" name="memberGender" value="F" checked>여자
								<input type="radio" id="memberGender" name="memberGender" value="M" >남자
							</td>
						</tr>
					</table>
				</div><br>
				<div>
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="취소">&nbsp;&nbsp;
					<input type="button" onclick="location.href='main.do'" value="홈">
				</div>
			</form>
		</div>
	</div>
	<div align="center">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>	
	
	<script type="text/javascript">
		function formCheck(){
			let frm = document.getElementById("frm");
			if(frm.memberPassword.value != frm.passwordCheck.value){
				alert("비밀번호가 일치하지 않습니다.");
				frm.memberPassword.value ="";
				frm.passwordCheck.value="";
				frm.memberPassword.focus();
				return false;
			} else if(frm.checkId.value != "Yes"){
				alert("아이디 중복체크를 확인하세요.");
				return false;
			}
			
			return true;
		}
		
		function idCheck(){
			let id = document.getElementById("memberId").value;  
			let url = "ajaxCheckId.do?id=" + id;			
			fetch(url)   //ajax 호출, get방식 생략가능  -> ajax 동작 
				//.then()으로 결과를 받는ㄴ다
				.then(response => response.text())
				
				.then(text => htmlProcess(text));
		}
		
		function htmlProcess(data){
			if(data == 'Yes'){
				alert(document.getElementById("memberId").value + "\n사용가능한 아이디입니다.");
				document.getElementById("checkId").value = 'Yes';			
			}else{
				alert(document.getElementById("memberId").value + "\n이미 사용중인 아이디입니다.");
				document.getElementById("memberId").value = "";
				document.getElementById("memberId").focus();
			}
		}
	</script>
</body>
</html>
