<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 서버쪽 스크립트를 가져올 때 특정한 클래스를 사용하여 편하게 가져오려고 만들어놓은 태그 라이브러리 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
</head>
<body>

	<%@ include file="topMenu.jsp"%>
	<table>
		<tr>
			<th width=20%>순번</th>
			<th width=10%>사용자아이디</th>
			<th width=10%>비밀번호</th>
			<th width=10%>이름</th>
			<th width=20%>전화번호</th>
			<th width=30%>주소</th>
		</tr>
			<c:forEach var="list" items="${memberList}">
				<tr>
					<td><c:out value="${list.rownum}" /></td>
					<td><c:out value="${list.userid}" /></td>
					<td><c:out value="${list.pass}" /></td>
					<td><c:out value="${list.name}" /></td>
					<td><c:out value="${list.tel}" /></td>
					<td><c:out value="${list.address}" /></td>
				</tr>
			</c:forEach>
	</table>
</body>
</html>

<!-- ${memberList} : 컨트롤러에서 선언한 매개변수 -->