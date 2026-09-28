<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>홈</title>

<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	background-color: #f5f6f8;
}

.container {
	width: 400px;
	margin: 100px auto;
	padding: 40px;
	background-color: white;
	border: 1px solid #ddd;
	border-radius: 10px;
}

h2 {
	margin: 0 0 35px;
	text-align: center;
}

.box {
	margin-bottom: 20px;
}

.box label {
	display: block;
	margin-bottom: 8px;
	font-size: 14px;
	font-weight: bold;
}

.box input {
	width: 100%;
	height: 45px;
	padding: 0 12px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
}

.box input:focus {
	outline: none;
	border-color: #555;
}

.loginbtn {
	margin-top: 10px;
}

.loginbtn button {
	width: 100%;
	height: 45px;
	border: none;
	border-radius: 5px;
	background-color: #333;
	color: white;
	font-size: 15px;
	cursor: pointer;
}

.loginbtn button:hover {
	background-color: #222;
}

.regbtn {
	margin-top: 10px;
	text-align: center;
}

.regbtn button {
	border: none;
	background: none;
	color: #666;
	font-size: 13px;
	cursor: pointer;
}

.regbtn button:hover {
	color: #222;
	text-decoration: underline;
}

.welcome {
	text-align: center;
}

.welcome p {
	margin: 0 0 15px;
	font-size: 15px;
	color: #666;
}

.welcome h3 {
	margin: 0 0 30px;
	font-size: 20px;
	color: #333;
}

.logoutbtn {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.logoutbtn form {
	width: 50%;
}

.logoutbtn button {
	width: 100%;
	height: 45px;
	border: none;
	border-radius: 5px;
	background-color: #333;
	color: white;
	font-size: 15px;
	cursor: pointer;
}

.logoutbtn button:hover {
	background-color: #222;
}

.withdrawbtn {
	width: 100%;
	height: 45px;
	border: none;
	border-radius: 5px;
	background-color: #b02a37;
	color: white;
	font-size: 15px;
	cursor: pointer;
}

.withdrawbtn:hover {
	background-color: #c74747;
}

.board button {
	justify-content: center;
	margin-bottom: 10px;
	width: 100%;
	height: 45px;
	border: none;
	border-radius: 5px;
	background-color: #222;
	color: white;
	font-size: 15px;
	cursor: pointer;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${loginId != null}">
			<div class="container">
				<div class="welcome">
					<p>안녕하세요!</p>
					<h3>${loginId}님환영합니다.</h3>
					<div class="board">
						<form action="/board/board">
							<input type="hidden" name="cpage" value="1">
							<button type="submit">게시판</button>
						</form>
					</div>
					<div class="logoutbtn">
						<form action="/member/mypage">
							<button type="submit" class="mypagebtn"
								onclick="return confirm('마이페이지로 가시겠습니까?');">마이 페이지</button>
						</form>
						<form action="/member/logout">
							<button type="submit" onclick="return confirm('로그아웃을 하시겠습니까?');">로그아웃</button>
						</form>
						<form action="/member/withdraw">
							<button type="submit" class="withdrawbtn"
								onclick="return confirm('회원을 정말 탈퇴하시겠습니까?');">회원 탈퇴</button>
						</form>
					</div>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="container">

				<h2>로그인</h2>
				<form action="/member/login" method="post">
					<div class="box">
						<label for="id">아이디</label> <input type="text" id="id" name="id"
							placeholder="아이디를 입력하세요">
					</div>
					<div class="box">
						<label for="password">비밀번호</label> <input type="password"
							id="password" name="pw" placeholder="비밀번호를 입력하세요">
					</div>
					<div class="loginbtn">
						<button type="submit">로그인</button>
					</div>
				</form>
				<div class="regbtn">
					<form action="/member/signup">
						<button type="submit">회원가입</button>
					</form>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
</body>

</html>