<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: #f5f6f8;
	font-family: Arial, sans-serif;
}

.container {
	width: 500px;
	margin: 50px auto;
}

h1 {
	text-align: center;
	margin-bottom: 30px;
	font-size: 28px;
}

form {
	width: 100%;
}

fieldset {
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: white;
	padding: 20px;
	margin-bottom: 20px;
}

legend {
	font-size: 18px;
	font-weight: bold;
	padding: 0 8px;
}

label {
	display: block;
	margin-top: 15px;
	margin-bottom: 7px;
	font-size: 14px;
	font-weight: bold;
}

fieldset label:first-of-type {
	margin-top: 0;
}

input {
	width: 100%;
	height: 42px;
	padding: 0 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	outline: none;
}

input:focus {
	border-color: #777;
}

input::placeholder {
	color: #aaa;
}

.input-button-area {
	display: flex;
}

.input-button-area input {
	width: calc(100% - 110px);
}

.input-button-area button {
	width: 105px;
	height: 42px;
	margin-left: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: white;
	cursor: pointer;
}

.input-button-area button:hover {
	background-color: #f1f1f1;
}

#zipcode {
	width: calc(100% - 115px);
}

#zipcode+button {
	width: 105px;
	height: 42px;
	margin-left: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: white;
	cursor: pointer;
}

#zipcode+button:hover {
	background-color: #f1f1f1;
}

#idCheckResult {
	margin-top: 7px;
	font-size: 13px;
}

.button-area {
	display: flex;
	gap: 10px;
	margin-top: 20px;
}

.button-area button {
	flex: 1;
	height: 45px;
	border-radius: 5px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
}

.button-area button[type="submit"] {
	border: none;
	background-color: #333;
	color: white;
}

.button-area button[type="submit"]:hover {
	background-color: #222;
}

.button-area button[type="button"] {
	border: 1px solid #ccc;
	background-color: white;
	color: #333;
}

.button-area button[type="button"]:hover {
	background-color: #f1f1f1;
}
</style>
</head>

<body>

	<div class="container">

		<h1>회원가입</h1>

		<form action="/members/register" method="post">

			<fieldset>

				<legend>계정정보</legend>

				<label for="id">아이디</label>

				<div class="input-button-area">

					<input name="id" id="id" type="text"
						placeholder="영문, 숫자 4~30자">

					<button id="idCheckBtn" type="button">중복검사</button>

				</div>

				<div id="idCheckResult"></div>


				<label for="pw">비밀번호</label>

				<input name="pw" id="pw" type="password"
					placeholder="영문, 숫자, 특수문자 8~20자">


				<label for="pwCheck">비밀번호 확인</label>

				<input id="pwCheck" type="password"
					placeholder="비밀번호 재입력">

			</fieldset>


			<fieldset>

				<legend>개인 정보</legend>

				<label for="name">이름</label>

				<input name="name" id="name" type="text"
					placeholder="이름 입력">


				<label for="phone">연락처</label>

				<input name="phone" id="phone" type="text"
					placeholder="'-' 제외 숫자만 입력(최대 11자리)">


				<label for="email">이메일</label>

				<input name="email" id="email" type="email"
					placeholder="example@naver.com">

			</fieldset>


			<fieldset>

				<legend>주소 정보</legend>

				<label for="zipcode">우편번호</label>

				<input name="zipcode" id="zipcode" type="text"
					placeholder="우편번호(5자리)" readonly>

				<button id="zipcodeBtn" type="button">
					우편번호 찾기
				</button>


				<label for="address1">주소 1</label>

				<input name="address1" id="address1" type="text"
					placeholder="기본 주소" readonly>


				<label for="address2">주소 2</label>

				<input name="address2" id="address2" type="text"
					placeholder="상세 주소">

			</fieldset>


			<div class="button-area">

				<button type="submit">가입완료</button>

				<button type="button" onclick="location.href='/'">
					취소
				</button>

			</div>

		</form>

	</div>


	<script>

		// 아이디 중복검사
		$("#idCheckBtn").click(function() {

			let id = $("#id").val();

			// 아이디 형식 검사
			let idReg = /^[a-zA-Z0-9]{4,30}$/;

			if (!idReg.test(id)) {

				$("#idCheckResult")
					.text("아이디는 영문, 숫자를 사용하여 4~30자로 입력해주세요.")
					.css("color", "red");

				$("#id").focus();

				return;
			}


			$.ajax({

				url: "/members/idcheck",

				data: {
					id: id
				}

			}).done(function(resp) {

				if (resp) {

					// true = 이미 존재하는 아이디
					$("#idCheckResult")
						.text("이미 사용 중인 아이디입니다.")
						.css("color", "red");

					$("#id").attr("check", "false");

				} else {

					// false = 존재하지 않는 아이디
					$("#idCheckResult")
						.text("사용 가능한 아이디입니다.")
						.css("color", "green");

					$("#id").attr("check", "true");

				}

			}).fail(function() {

				$("#idCheckResult")
					.text("중복검사 중 오류가 발생했습니다.")
					.css("color", "red");

				$("#id").attr("check", "false");

			});

		});


		// 아이디가 변경되면 중복검사 상태 초기화
		$("#id").on("input", function() {

			$(this).attr("check", "false");

			$("#idCheckResult")
				.text("");

		});


		// 우편번호 검색
		$("#zipcodeBtn").click(function() {

			new daum.Postcode({

				oncomplete : function(data) {

					$("#zipcode").val(data.zonecode);

					$("#address1").val(data.address);

					$("#address2").focus();

				}

			}).open();

		});


		// 회원가입 정규식 검사
		$("form").submit(function(e) {

			let id = $("#id").val();

			let pw = $("#pw").val();

			let pwCheck = $("#pwCheck").val();

			let name = $("#name").val();

			let phone = $("#phone").val();

			let email = $("#email").val();

			let zipcode = $("#zipcode").val();


			// 아이디
			let idReg = /^[a-zA-Z0-9]{4,30}$/;


			// 비밀번호
			let pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;


			// 이름
			let nameReg = /^[가-힣a-zA-Z]{2,20}$/;


			// 전화번호
			let phoneReg = /^01[016789]\d{7,8}$/;


			// 이메일
			let emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;


			// 우편번호
			let zipcodeReg = /^\d{5}$/;


			// 아이디 형식 검사
			if (!idReg.test(id)) {

				alert("아이디는 영문, 숫자를 사용하여 4~30자로 입력해주세요.");

				$("#id").focus();

				e.preventDefault();

				return;
			}


			// 아이디 중복검사 여부
			if ($("#id").attr("check") !== "true") {

				alert("아이디 중복검사를 해주세요.");

				$("#id").focus();

				e.preventDefault();

				return;
			}


			// 비밀번호 검사
			if (!pwReg.test(pw)) {

				alert("비밀번호는 영문, 숫자, 특수문자를 포함하여 8~20자로 입력해주세요.");

				$("#pw").focus();

				e.preventDefault();

				return;
			}


			// 비밀번호 확인
			if (pw !== pwCheck) {

				alert("비밀번호가 일치하지 않습니다.");

				$("#pwCheck").focus();

				e.preventDefault();

				return;
			}


			// 이름 검사
			if (!nameReg.test(name)) {

				alert("이름을 올바르게 입력해주세요.");

				$("#name").focus();

				e.preventDefault();

				return;
			}


			// 전화번호 검사
			if (!phoneReg.test(phone)) {

				alert("연락처는 '-' 없이 숫자만 입력해주세요.");

				$("#phone").focus();

				e.preventDefault();

				return;
			}


			// 이메일 검사
			if (!emailReg.test(email)) {

				alert("올바른 이메일 형식으로 입력해주세요.");

				$("#email").focus();

				e.preventDefault();

				return;
			}


			// 우편번호 검사
			if (!zipcodeReg.test(zipcode)) {

				alert("우편번호를 검색해주세요.");

				$("#zipcodeBtn").focus();

				e.preventDefault();

				return;
			}

		});

	</script>

</body>
</html>