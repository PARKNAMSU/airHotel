<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>결제 확인하기</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/resources/css/payment.css" />
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
		  rel="stylesheet">
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/resources/css/hostregister.css">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/resources/css/index.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/javascript/jquery-3.5.1.min.js"></script>
	<!-- 아이콘 이미지 -->

</head>
<body>
<!-- header-start -->
<c:if test="${login_session eq null }">
	<header style="padding: 20px; background: rgb(025, 025, 025);">
		<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/logo111.png"/></a>
		<div class="menudiv3-1" id="div1" style="padding-top: 13px;">
			<ul id="menuItems">
				<li class="item">
					<a
							href="/cnc/registerView.do"
							onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
					><li class="item">회원가입</li></a>
				<a
						href="/cnc/loginView.do"
						onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
				><li class="item">로그인</li></a>
				<a
						href=""
						onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'"
				><li class="item">공지사항</li></a>
				</li>
			</ul>
		</div>
	</header>
</c:if>
<c:if test="${login_session ne null }">
	<header class="menudiv1">
		<div class="menudiv2-1" style="margin:0 0 10px;">
			<a href="/cnc/indexView.do"><img alt="" src="${pageContext.request.contextPath}/resources/images/main/mainlogoblack.PNG" /></a>
		</div>
		<div class="menudiv2-2" style="padding:0 0 4px;">
			<div class="menudiv3-1" id="div1" style="float:left;width:70%;">
				<ul id="menuItems" style="padding:12px;">
					<li class="item"><p><a href="/cnc/indexView.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;">메인페이지</a></p></li>
					<li class="item">
						<p>
							<a href="/cnc/selectBoardList.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >공지사항</a>
						</p>
					</li>
					<li class="item"><p><a href="myHouse.do" style="color:white;font-family:'Jua', sans-serif;font-size:20px;" >호스트</a></p></li>
				</ul>
			</div>
			<div style="width:50px;height:50px;margin-left:5%;margin-top:10px;border-radius: 30px 30px 30px 30px;float:left;background-color:white;overflow:hidden;" id="myinfo">
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
		<div id="mydiv" style="display:none;margin-left:90%;z-index:100;width:200px;background-color:#d2d2d2;font-size:20px;border-radius: 15px 15px 15px 15px;font-family: 'Jua', sans-serif;" >
			<ul>
				<li><br></li>
				<li style="margin-bottom:20px;"><a href="mypage.do">내 정보</a></li>
				<li style="margin-bottom:20px;"><a href="hostRegisterView.do">호스트 신청</a></li>
				<li style="margin-bottom:20px;"><a href="reservationPage.do">예약한 숙소</a></li>
				<li style="margin-bottom:20px;"><a href="myFavoriteHouse.do">저장한 숙소</a></li>
				<li style="margin-bottom:20px;"><a href="getCuponList.do">쿠폰함</a></li>
				<li style="margin-bottom:20px;"><a href="chat.do">메세지</a></li>
				<c:choose>
					<c:when test="${social_type ne null }">
						<li style="margin-bottom:20px;"><a href="kakaologout.do">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<li style="margin-bottom:20px;"><a href="logout.do">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				<li ><br></li>
			</ul>
		</div>
	</header>

	<script type="text/javascript">
		$(function(){
			$("#myinfo").click(function(){
				$("#mydiv").fadeToggle("slow");
			})
		})
	</script>
</c:if>
<div class="container">
	<div class="total_container">
		<div class="payment_info_container">
			<div class="payment_image">
				<img
						src="${pageContext.request.contextPath}/resources/images/theme_search/jejusample.jpeg"
						alt="">
			</div>
			<div class="payment_info">
				<table class="payment_info_table" style="color: black;">
					<tr class="noline">
						<td>숙소이름 : ${house.house_name}</td>
					</tr>
					<tr>
						<td class="border-bottom">인원 : ${peopleNum}</td>
					</tr>
					<tr>
						<td class="border-bottom">${checkin} -> ${checkout}</td>
					</tr>
					<tr>
						<td><c:set var="housePrice"
								   value="${house.house_price_default}" /> <c:set var="totalDay"
																				  value="${totalDay}" /> <c:set var="totalPrice"
																												value="${housePrice * totalDay}" /> 1박
							${house.house_price_default}원 X ${totalDay}박 -> ${totalPrice}원</td>
					</tr>
					<tr>
						<td class="border-bottom">총 합계 -> <font id="totalPrice">${totalPrice}</font> 원</td>
					</tr>
					<tr class="noline">
						<td>
							<div class="popup" data-popup="example">
								<form action="checkNumber.do">
									<div class="popup-inner">
										<div class="popup-contents"
											 style="text-align: center; margin-top: 4px;">
											<label for="cuponNum" style="font-size: 30px; font-weight: bold;">쿠폰사용</label></br>
											<input type="text" name="cuponNumber" id="cuponNum" value="">&nbsp;
											<input type="button" value="쿠폰 적용" class="btn btn-sm" onclick="getCupon()">
											<script type="text/javascript">
												var getData = [];
												var justOne = 0;
												var finalPrice = '${totalPrice}';
												var num = document.getElementById("cuponNum");
												window.onload = function() {
													$.ajax({
														type:"GET",
														url:"cuponList.do",
														dataType:"json",
														success : function(data){
															getData = data;
														},
														error:function(){
															alert("error");
														}
													});
												}
												var getCupon = function() {
													if(justOne>=1) return;
													let flag = false;
													num = document.getElementById("cuponNum");
													for(var idx=0; idx<getData.length; idx++){
														if(getData[idx].cupon_number===num.value){
															justOne++;
															let price = document.getElementById("totalPrice");
															finalPrice = Math.ceil(${totalPrice}*((100-getData[idx].cupon_discount_rate)/100)-getData[idx].cupon_discount_money);
															if(finalPrice<0) finalPrice = 0;
															price.innerText = finalPrice;
															alert("쿠폰이 적용되었습니다.");
															flag = true;
															num.disabled = true;
															break;
														}
													}
													if(flag==false) alert("해당 쿠폰이 없습니다.");
												}
											</script>
										</div>
									</div>
								</form>
							</div></td>
					</tr>
					<tr class="noline">
						<td><input class="btn btn-outline-danger" type="button"
								   value="결제하기" onclick="goPaymentFinal('${checkin}', '${checkout}')"></td>
						<script>
							function goPaymentFinal(checkin, checkout){
								var form = document.createElement("form");
								var input = document.createElement("input");
								var input2 = document.createElement("input");
								var input3 = document.createElement("input");
								var input4 = document.createElement("input");
								input.setAttribute("type", "hidden");
								input.setAttribute("name", "totalPrice");
								input.setAttribute("value", finalPrice);
								input2.setAttribute("type", "hidden");
								input2.setAttribute("name", "checkin");
								input2.setAttribute("value", checkin);
								input3.setAttribute("type", "hidden");
								input3.setAttribute("name", "checkout");
								input3.setAttribute("value", checkout);
								input4.setAttribute("type", "hidden");
								input4.setAttribute("name", "cuponNum");
								input4.setAttribute("value", num.value);
								form.appendChild(input);
								form.appendChild(input2);
								form.appendChild(input3);
								form.appendChild(input4);
								document.body.appendChild(form);
								form.action = "paymentfinal.do";
								form.method = "post";
								form.submit();
							}
						</script>


					</tr>
				</table>
			</div>
		</div>
		<form>
			<input type="hidden" name="">
		</form>
		<div class="right_container" style="color: black">
			<div class="warning_container ">
				<div class="room_policy">
					<h1>숙소 제약사항</h1>
					<ul>
						<c:set var="restrictList" value="${restrictList}" />
						<c:forEach var="item" items="${restrictList}" begin="0"
								   end="${restrictList.size()}" step="1">
							<li><i class="fa fa-exclamation"></i>${item}</li>
						</c:forEach>
					</ul>
				</div>
				<div class="room_policy">
					<h1>숙소 편의사항</h1>
					<ul>
						<c:forEach var="item" items="${convinList}" begin="0"
								   end="${convinList.size()}" step="1">
							<li><i class="fa fa-exclamation"></i>${item}</li>
						</c:forEach>
					</ul>
				</div>
				<div class="room_reservation_day">
					<i class="fas fa-calendar-day fa-2x"></i>
					<ul>
						<li id="li-margin-bottom"><span class="checkin-day">${checkin}
									체크인:${house.house_checkin_time} 이후</span></li>
						<li><span class="checkout-day">${checkout}
									체크아웃:${house.house_checkout_time} 이전</span></li>
					</ul>
				</div>


				<%--<div class="warning-icons">
                <ul>
                    <li><i class="fas fa-paw fa-2x"></i><span> 강아지와 함께 숙소 이용 가능 </span></li>
                </ul>
            </div>--%>
			</div>
		</div>
	</div>
</div>


<!-- footer-start -->
<footer class="first" id="bottom">
	<div class="second">
		회사소개 | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때 마케팅센터 | 액티비티 호스트센터 | HOTEL
		여기어때 |콘텐츠산업진흥법에의한 표시<br> <br> 고객행복센터 1670-6250 오전 9시 - 새벽
		3시, 점심시간: 오후 12시 - 오후 1시<br>
		<br> (주) 여기어때컴퍼니<br>
		<br> 주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br> 대표이사 : 박남수 |
		사업자등록번호: 742-86-00224<br> 통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호:
		제1026-24호<br> 전화번호 : 1670-6250<br> 전자우편주소 :
		skatn7979@gmail.com<br> Copyright GC COMPANY Corp. All rights
		reserved.<br>
		<hr id="bline">
		<img
				src="${pageContext.request.contextPath}/resources/images/face.png"
				id="blogo"> <img
			src="${pageContext.request.contextPath}/resources/images/insta.png"
			id="blogo">
	</div>
</footer>
<!-- footer-end -->

</body>
</html>