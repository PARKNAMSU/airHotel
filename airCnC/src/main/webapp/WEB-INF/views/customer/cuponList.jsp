<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/sideMenu.css" />
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet"
    />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/hostdetail1.css"
    />
    <!-- Latest compiled and minified CSS -->

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
			<div class="menudiv3-1" id="div1" style="float:left;">
				<ul id="menuItems">	
						<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
						<li class="item">
							<p>
								<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
							</p>
						</li>
						<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
				</ul>
			</div>
			<div style="width:50px;height:50px;margin-left:35px;margin-top:12px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
				<c:choose>
					<c:when test="${my_image eq 'profile.png'}">
						<img alt="" src="${pageContext.request.contextPath}/resources/images/profile.png" style="max-width:120%;max-height:120%;">
					</c:when>
					<c:otherwise>
						<img alt="" src="/cnc/display.do?name=${my_image}" style="max-width:120%;max-height:120%;">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="mydiv" style="display:none;margin-left:88%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
					<ul>
						<li><br></li>
						<li style="margin-bottom:20px;"><a href="">내정보</a></li>
						<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
						<li style="margin-bottom:20px;"><a href="getCuponList.do">쿠폰함</a></li>
						<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
						<li style="margin-bottom:20px;"><a href="logout.do">로그아웃</a></li>
						<li ><br></li>
					</ul>
		</div>
    </header>

    <!-- slider_area_start -->
	<div class="slider_area">
        <div class="slider_active owl-carousel">
            <div class="single_slider  d-flex align-items-center slider_bg_2">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="slider_text text-center" style="margin-left:100%">
                                <h3>My Cupon</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider_area_end -->
    <div style="clear: both;"></div>
	<%@include file="../html/sideMenu.jsp" %>
    <div class="coupon">
      <div class="coupontitle">
        <label for="" style="font-size:50px; color:black;">쿠폰관리</label>
      </div>
    </div>
    <div class="couponimage" style="margin-top: 50px;">
      <img src="/Mainwork2/images/partyroom.jpg" alt="" />
    </div>
    <ol style="color:black;">
    <c:forEach items="${cuponList}" var="cupon">
    	<c:set var="dis" value="${cupon.cupon_discount_money }"/>
    	<li>쿠폰 번호: ${cupon.cupon_number },
    	<c:if test="${dis eq 0}">할인 율: ${cupon.cupon_discount_rate}%,</c:if>
    	<c:if test="${dis ne 0}">할인 금액: ${cupon.cupon_discount_money },</c:if>
    	유효기간: ${cupon.cupon_limit}</li>
    </c:forEach>
    </ol>
    <footer></footer>
    <script type="text/javascript">
      function openChat(url) {
        var openWin = window.open(
          url,
          "rankpopup",
          "width=750, height=900, resizable = no, scrollbars = no"
        );
      }
    </script>
    <script type="text/javascript">
		$(function(){
			$("#myinfo").click(function(){
				$("#mydiv").fadeToggle("slow");
			})
		})
	</script>
  </body>
</html>