<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css">
</head>
<body>
    <header class="menudiv1" style="position : static">
		<div class="menudiv2-1" >
		<img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png" class="logo">
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1">
				<ul id="menuItems">
					<li class="item">메뉴1</li>
					<li class="item">메뉴2</li>
					<li class="item">메뉴3</li>
					<li class="item">메뉴4</li>
				</ul>
			</div>
			<div class="menudiv3-2">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/menubar.png" id="menubar">
			</div>
		</div>
    </header>
</body>
</html>