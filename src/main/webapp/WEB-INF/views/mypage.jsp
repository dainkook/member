<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> <!DOCTYPE html> <html>
<head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    background-color: #f5f6f8;
    font-family: Arial, sans-serif;
    color: #333;
}

.container {
    width: 750px;
    margin: 70px auto;
}

.title {
    margin-bottom: 25px;
}

.title h1 {
    margin: 0;
    font-size: 28px;
}

.title p {
    margin: 8px 0 0;
    color: #888;
    font-size: 14px;
}

.profile {
    background-color: white;
    border: 1px solid #e2e2e2;
    border-radius: 12px;
    padding: 35px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
}

.profile h2 {
    margin: 0 0 30px;
    font-size: 19px;
}

.info {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 22px 25px;
}

.item {
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.item.full {
    grid-column: 1 / 3;
}

.item label {
    font-size: 13px;
    font-weight: bold;
    color: #666;
}

.item input {
    width: 100%;
    height: 42px;
    padding: 0 12px;
    border: 1px solid #ddd;
    border-radius: 6px;
    background-color: #f8f9fa;
    font-size: 14px;
    color: #333;
    outline: none;
}

.item input:focus {
    background-color: white;
    border-color: #999;
}

.bottom {
    margin-top: 30px;
    padding-top: 25px;
    border-top: 1px solid #eee;
    text-align: right;
}

.bottom button {
    padding: 10px 20px;
    border: 1px solid #ccc;
    border-radius: 6px;
    background-color: white;
    cursor: pointer;
}

.bottom button:hover {
    background-color: #f3f3f3;
}
</style>

</head>

<body>

<div class="container">

    <div class="title">
        <h1>마이페이지</h1>
        <p>회원 정보를 확인할 수 있습니다.</p>
    </div>

    <div class="profile">

        <h2>회원 정보</h2>

        <div class="info">

            <div class="item">
                <label>아이디</label>
                <input type="text" name="id" readonly>
            </div>

            <div class="item">
                <label>이름</label>
                <input type="text" name="name" readonly>
            </div>

            <div class="item">
                <label>전화번호</label>
                <input type="text" name="phone" readonly>
            </div>

            <div class="item">
                <label>이메일</label>
                <input type="text" name="email" readonly>
            </div>

            <div class="item">
                <label>비밀번호</label>
                <input type="password" name="pw" readonly>
            </div>

            <div class="item">
                <label>가입일</label>
                <input type="text" name="regdate" readonly>
            </div>

            <div class="item">
                <label>우편번호</label>
                <input type="text" name="zipcode" readonly>
            </div>

            <div class="item">
                <label>주소</label>
                <input type="text" name="address1" readonly>
            </div>

            <div class="item full">
                <label>상세주소</label>
                <input type="text" name="address2" readonly>
            </div>

        </div>

        <div class="bottom">
            <button type="button">수정</button>
            <button type="button" onclick="deleteMember()">회원탈퇴</button>
        </div>

    </div>

</div>

</body>

	<script>
		function deleteMember() {
			if(confirm("정말 회원탈퇴 하시겠습니까?")) {
				location.href = "/delete";
			}
		}
	</script>
</html>