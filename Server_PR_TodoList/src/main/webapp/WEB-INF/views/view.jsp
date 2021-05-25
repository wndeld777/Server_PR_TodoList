<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${rootPath}/static/css/home.css?ver2021-05-25-001"
	rel="stylesheet" />
<style>
td {
	color: blue;
}

div.view_btn button {
	margin: 5px;
	padding: 15px;
	outline: none;
	border: none;
	color: white;
	
}

div.view_btn button:nth-child(1) {
	background-color: blue;
	margin-left: 1300px;
}

div.view_btn button:nth-child(2) {
	background-color: green;
}

div.view_btn button:nth-child(3) {
	background-color: red;
}

div.view_btn button:hover {
	box-shadow: 4px 4px 4px rgba(0,0,0,0.3);
}
</style>
<script>
	document.addEventListener("DOMContentLoaded",function(){
		document.querySelector("div.view_btn").addEventListener("click",function(ev){
			let className = ev.target.className;
			if(className == "btn_home"){
				document.location.href="${rootPath}";
			}else if(className == "btn_update"){
				document.location.href="${rootPath}/todo/update?to_seq=" + ${TL.to_seq};
			}else if(className == "btn_delete"){
				if(confirm("삭제합니다")){
					document.location.replace("${rootPath}/todo/delete?to_seq=" + ${TL.to_seq});
				}
			}
		})
	})

</script>

</head>
<body>
	<h1>list 확인하기</h1>
	<table>
		<tr>
			<th>No.</th>
			<th>할일</th>
			<th>작성일자</th>
			<th>작성시각</th>
			<th>장소</th>
		</tr>
		<tr>
			<td>${TL.to_seq}</td>
			<td>${TL.to_work }</td>
			<td>${TL.to_date }</td>
			<td>${TL.to_time }</td>
			<td>${TL.to_place }</td>
		</tr>
	</table>

	<div class="view_btn">
		<button class="btn_home">처음으로</button>
		<button class="btn_update">수정하기</button>
		<button class="btn_delete">삭제하기</button>
	</div>
</body>
</html>