<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="rootPath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>No.</th>
			<th>할일</th>
			<th>작성일자</th>
			<th>작성시각</th>
			<th>장소</th>
		</tr>
		<tr>
			<td>${index.count}</td>
			<td>${TL.to_work }</td>
			<td>${TL.to_date }</td>
			<td>${TL.to_time }</td>
			<td>${TL.to_place }</td>
		</tr>
	</table>

	<div>
		<button>처음으로</button>
		<button>수정하기</button>
		<button>삭제하기</button>
	</div>
</body>
</html>