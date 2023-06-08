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
		<div><h1>제품 등록</h1></div>
		<img src="c:/temp/강아지.jpg">
		<div>
			<form id="frm" action="productInsert.do" method="post" enctype="multipart/form-data">
			<!-- form안에 text가 아닌 형태를 넣어야할 땐 enctype 속성 이용 -> 파일 전송시 주로 multipart/form-data 사용 -->
				<table border="1">
					<tr>
						<th width="200">제품코드</th>
						<td width="250">
							<input type="text" id="productId" name="productId">
						</td>	
					</tr>
					<tr>
						<th>제품명</th>
						<td>
							<input type="text" id="productName" name="productName">
						</td>
					</tr>
					<tr>
						<th>제품이미지</th>
						<td>
							<!-- file객체가 가진 파일명을 id와 name -->
							<input type="file" id="pfile" name="pfile">					
						</td>
					</tr>
				</table><br>
				
				<div>
					<input type="submit" value="등록">&nbsp;&nbsp;
					<input type="reset" value="취소">&nbsp;&nbsp;
					<button type="button" onclick="location.href='productList.do'">목록</button>
				</div>						
			</form>
		</div>
	</div>
	
	<div align="center">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>	
	
</body>
</html>