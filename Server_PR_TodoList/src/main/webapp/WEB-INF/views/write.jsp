<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib	uri="http://java.sun.com/jsp/jstl/core" 
		prefix="c" %>
<c:set value="${pageContext.request.contextPath}" 
			var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25-001"
	rel="stylesheet" />
<style>
	form.v1, div {
		width: 60%;
		margin:10px auto;
	}
	form.v1 label, form.v1 input{
		display: inline-block;
		padding:5px;
		margin:5px;
	}
	form.v1 label {
		width:150px;
		text-align: right;
	}
	form.v1 input{
		width: 300px;
		border: 1px solid green;
		border-radius: 5px;
	}
	form.v1 button {
		outline: 0;
		border:0;
		width: 100px;
		color:white;
		padding: 5px;
	}
	form.v1 button:nth-child(2) {
		background-color: green;
	}
	form.v1 button:nth-child(3) {
		background-color: red;
	}
	form.v1 button:nth-child(4) {
		background-color: blue;
	}
	form.v1 button:hover {
		box-shadow: 2px 2px 2px rgba(0,0,0,0.3);
	}
</style>
<script>
	document.addEventListener("DOMContentLoaded",function(){
		document.querySelector("button.btn_save").addEventListener("click",function(ev){
			let dom = document;
			let to_work = dom.querySelector("input[name='to_work']");
			let to_place = dom.querySelector("input[name='to_place']");
			
			if(to_work.value == ""){
				alert("할일은 반드시 입력해야 합니다");
				to_work.focus();
				return false;
			}
			alert("저장"
				+ to_work.value +"\n"
				+ to_place.value +"\n"
			);
			dom.querySelector("form.v1").submit()
		})
		document.querySelector("div.view_btn").addEventListener("click",function(ev){
			let className = ev.target.className;
			if(className == "btn_home"){
				document.location.href="${rootPath}";
			}
		})
	})

</script>

</head>
<body>
	<h1>수정하기</h1>
	<form class="v1" method="POST">
		<div>
			<label>작성일자</label>
			<input name="to_date" type="date" value="${TODO.to_date }">
		</div>
		<div>
			<label>작성시각</label>
			<input name="to_time" type="time" value="${TODO.to_time }">
		</div>
		<div>
			<label>할일</label>
			<input name="to_work" type="text" value="${TODO.to_work }">
		</div>
		<div>
			<label>장소</label>
			<input name="to_place" type="text" value="${TODO.to_place }">
			
		</div>
		<div class="view_btn">
			<label></label>
			<button class="btn_save" type="button">저장</button>
			<button type="reset">다시작성</button>
			<button class="btn_home" type="button">처음으로</button>		
		</div>
	</form>
</body>
</html>