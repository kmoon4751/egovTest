<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탑메뉴</title>
</head>
<style>
body {
	font-size: 9pt;
	font-colr: #333333;
	font-family: 맑은 고딕;
}

a {
	text-decoration: none;
}

table {
	width: 600px;
	border-collapse: collapse; /* cell 간격 조정*/
}

th, td {
	border: 1px solid #cccccc;
	padding: 3px;
	line-height: 2;
}

.div_btn {
	width: 600px;
	text-align: center;
	margin-top: 5px;
}

caption {
	font-size: 15px;
	font-weight: bold;
	margin-top: 10px;
	padding-bottom: 5px;
}
</style>
<body>
	<%
	String sUID = (String)session.getAttribute("sessionID");	//컨트롤러에 있는 세션이름
%>

	<table>
		<tr>
			<th><a href="main.do">홈</a></th>
			
			<%
			//sUID : 로그인에 성공한 유저의 아이디
			if(sUID == null){
			%> <!-- 로그인이 돼있지 않으면 -->
			<th><a href="memberWrite.do">회원가입</a></th>
			<th><a href="login.do">로그인</a></th>
			<%
			
			}else{
			%>
			<th><a href="memberList.do">회원리스트</a></th>
			<th><a href="logout.do">로그아웃</a></th>
			<%
			}
			%>
		</tr>
	</table>

</body>
</html>