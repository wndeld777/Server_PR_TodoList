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
	
	
	
	tr:hover{
		cursor: pointer;
		background-color: #ddd;
	}
	td{
		color:blue;
	}
	form{
		margin:10px auto;
		width : 80%;
		border:1px solid green;
		border-radius: 20px;
		padding : 10px;
	}
	label{
		display:inline-block;
		width:20%;
		text-align: right;
		padding:8px;
		margin:5px;
	}
	input{
		width:60%;
		padding:8px;
		margin:5px;
	}
	button{
		background-color:blue;
		color:white;
		padding : 8px;
		width:10%;
		outline:0;
		border:0;
		border-radius: 10px;
		cursor: pointer;
		margin-left:320px;
	}

	button:hover{
		box-shadow: 4px 4px 4px rgba(0,0,0,0.3);
	}
	
</style>
<script>
	document.addEventListener("DOMContentLoaded",function(){
		document.querySelector("table#tolist").addEventListener("click",function(ev){
			let tag_name = ev.target.tagName;
			if(tag_name = "TD"){
				let to_seq = ev.target.closest("TR").dataset.seq
				document.location.href="${rootPath}/todo/view?to_seq=" + to_seq;
			}
			
		})
	})

</script>
</head>
<body>
	<h1>TO DO List</h1>
	<form method="POST">
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
		<button>추가하기</button>
	</form>
	
	
	<table id="tolist">
		<tr>
			<th>No.</th>
			<th>할일</th>
			<th>작성일자</th>
			<th>작성시각</th>
			<th>장소</th>
		</tr>
		<c:forEach items="${todoList }" var="TL" varStatus="index">
			<tr data-seq="${TL.to_seq }">			
				<td>${index.count}</td>
				<td>${TL.to_work }</td>
				<td>${TL.to_date }</td>
				<td>${TL.to_time }</td>
				<td>${TL.to_place }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>