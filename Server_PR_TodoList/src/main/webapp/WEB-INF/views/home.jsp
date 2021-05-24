<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		box-sizing:border-box;
	}
	td,th{
		border : 1px solid green;
		padding : 5px auto;
		width:10%;
		text-align:center;
	}
	table{
		margin-left:250px;
	}
	tr:hover{
		cursor: pointer;
		background-color: #ddd;
	}
	td{
		color:blue;
	}
	h1,form{
		width : 80%;
		margin:10px auto;
	}
	h1{
		color:black;
		padding:1.2rem;
		text-align:center;
		border-radius: 10px;
	}
	form{
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
	}

	button:hover{
		/*
		 x-offset y-offset blue spread color 
		 
		*/
		box-shadow: 4px 4px 4px rgba(0,0,0,0.3);
	}
	
</style>
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
		<a href="${pageContext.request.contextPath }/todo/view">삭제하기</a>
	</form>
	
	
	<table>
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