<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/menu.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myreservation.css?version=123">
<!-- Latest compiled JavaScript -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${login_session == null }">
		<script type="text/javascript">location.href ='loginView.do'</script>
	</c:if>
	<header class="menudiv1">
		<div class="menudiv2-1">
			<a href="/cnc/indexView.do"><img alt=""
				src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2">
			<div class="menudiv3-1" id="div1" >
				<ul id="menuItems">	
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
							</p>
						</li>
						<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
						<li class="item">
								<p><a href="/cnc/logout.do" style="color:white;font-family: 'Jua', sans-serif;font-size:20px;" >로그아웃</a></p>
						</li>
				</ul>
			</div>
		</div>
	</header>
	<div style="clear:both;"></div>
	 <!-- slider_area_start -->
    <div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center">
                                <h3>My Favorite House</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>

    </div>
    <!-- slider_area_end -->
	<div style="clear:both;"></div>
	<%@include file="../html/sideMenu.jsp" %>
	
	<div class="maindiv" id="main">
	<h1 style="margin-bottom:5%;margin-left:25%;font-size:40px;color:red;">내가 좋아하는  숙소</h1>
	<c:forEach items="${favoriteList }" var="item">
		<div class="subdiv" id="imgdiv1" onclick="goToHouse(${item.house_seq},'notres')" style="color:black;margin-top:5%;">
			<div class="imgdiv" >
				<img alt="" src="${pageContext.request.contextPath}/resources/images/myreservation/house1.png" id="img1" class="imgs">
			</div>
			<div class="textdiv" id="td1" style="word-break:break-all;padding:30px;">${item.house_name }</div>
		</div>
	</c:forEach>
	</div>
	
	<div style="clear:both;"></div>
	<footer>
		<%@ include file="../html/footer.jsp" %>
	</footer>
</body>
<script type="text/javascript">
	function goToHouse(house_seq,accessType){
		var form = document.createElement("form");
		var input = new Array()
		var names = ["house_seq","accessType"]
		var values = [house_seq,accessType]
        form.action = "reservationHouse.do";
        form.method = "post";
        for (var i = 0; i < 3; i++) {
        	input[i] = document.createElement("input");
            input[i].setAttribute("type", "hidden");
            input[i].setAttribute('name', names[i]);
            input[i].setAttribute("value", values[i]);
            form.appendChild(input[i]);
        }
        document.body.appendChild(form);
        form.submit();
	}
</script>
</html>