<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script>

//선택 시 날짜 가져오기
	$(function() {
		$("#birth").datepicker({	// #birth 생년월일 아이디
			changeMonth : true,
			changeYear : true,
			dateFormat : 'yy-mm-dd'	// 박스에 들어가는 날짜의 형식
		});
		
		//클릭이벤트 생성
		//중복 확인
		$("#btn_idChk").click(function(){
			var userid = $("#userid").val();
			//공백제거
			userid = $.trim(userid); 
			// 공백입력 시 거부
			if(userid == ""){
				alert("아이디를 입력하세요.")
				//포커스 추가
				$('#userid').focus();
				return false;
			}
			$.ajax({
				type:"POST",
				data:"userid="+userid,
				url:"idChk.do",
				datatypa:"text"})
			}
			
			var pass = $("pass").val();
			var name = $("name").val();
			
			pass = $.trim(pass);
			name = $.trim(name);
			
			
			if(pass == ""){
				alert("패스워드를 입력하세요.")
				//포커스 추가
				$('#pass').focus();
				return false;
			}
			
			if(name == ""){
				alert("이름을 입력하세요.")
				//포커스 추가
				$('#name').focus();
				return false;
			}
			
			//값 변환
			$("#userid").val(userid);
			$("#pass").val(pass);
			$("#name").val(name);
			
			var formData = jQuery('#frm').serialize(); //시리얼라이즈
			//제이쿼리 형식으로 송신 : 비동기 전송방식의 기능을 가지고 있는 jquery 함수
			$.ajax(){
				type:"POST", //어떤 타입으로?
				data:formData, //폼데이터형식으로 던진다.
				url:"memberWrite.do", //실제 내가 호출하는 페이지
				dataTypa:"text",
				//정송 후 반환하는 값, 셋팅
				success:function(result){
					//답이 ok이면
					if(result=="ok"{
						alert("저장 완료했습니다.");
						("#frm")[0].reset();
					}else{
						alert("저장에 실패하였습니다");
					}
				},
				error : function(){
					alert("error가 발생하였습니다.");
				}
			
		});
		//클릭이벤트 생성 끝
		
	});
</script>
</head>
<meta charset="UTF-8">
<title>회원 등록</title>
</head>
<body>
	<table>
		<caption>회원가입 폼</caption>
		<tr>
			<th><label for="userid">아이디</label></th>
			<td><input type="text" name="userid" id="userid"
				placeholder="아이디">
				<button type="button" id="btn_idChk">중복체크</button></td>
		</tr>

		<tr>
			<th><label for="pass">패스워드</label></th>
			<td><input type="password" name="pass" id="pass"></td>
		</tr>

		<tr>
			<th><label for="name">이름</label>
			<td><input type="text" name="name" id="name" placeholder="이름"></td>
		</tr>

		<tr>
			<th><label for="gender">성별</label></th>
			<td><input type="radio" name="gender" id="gender" value="m">남
				<input type="radio" name="gender" id="gender" value="f">여</td>
		</tr>

		<tr>
			<th><label for="birth">생년월일</label></th>
			<td><input type="text" name="birth" id="birth"></td>
		</tr>

		<tr>
			<th><label for="tel">연락처</label></th>
			<td><input type="text" name="tel" id="tel"
				placeholder="예)010-0000-0000"></td>
		</tr>

		<tr>
			<th><label for="address">주소</label></th>
			<td><input type="text" name="address" id="address"></td>
		</tr>

	</table>
	<div class="div_btn">
		<button type="button" name="btn_submit" id="btn_submit">저장</button>
		<button type="reset">초기화</button>
	</div>


</body>
</html>