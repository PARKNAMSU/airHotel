<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
<script src="resources/jQuery/jquery-3.4.1.min.js"></script>
</head>
<body>
	<a href="/">메인</a>
	<table border="1" >
		<tr>
			<th bgcolor="" width="50">no</th>
			<th bgcolor="" width="200">제목</th>
			<th bgcolor="" width="150">작성자</th>
			<th bgcolor="" width="150">작성일</th>
		</tr>
		<c:choose>
			<c:when test="${!empty boardList}">
				<c:forEach items="${boardList }" var="board">
					<tr>
						<td>${board.idx }</td>
						<td align="left"><a href="${board.idx }">
								${board.title }</a></td>
						<td>${board.writer }</td>
						<td><fmt:formatDate value="${board.regDate }" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="5">등록된 글이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<br>
	<a href="writeBoard.do">글 쓰기</a>
	
<ul class="btn-group pagination">
    <c:if test="${paging.prev }">
    <li>
        <a href='<c:url value="/selectBoardList.do?page=${paging.startPage-1 }"/>'>이전</a>
    </li>
    </c:if>
    <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="pageNum">
    <li>
        <a href='<c:url value="/selectBoardList.do?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
    </li>
    </c:forEach>
    <c:if test="${paging.next && paging.endPage >0 }">
    <li>
        <a href='<c:url value="/selectBoardList.do?page=${paging.endPage+1 }"/>'>다음</a>
    </li>
    </c:if>
</ul>




	
</body>

</html>