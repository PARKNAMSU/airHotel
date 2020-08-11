<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>결제 확인하기</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/payment.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">
    <!-- 아이콘 이미지 -->

</head>
<body>
<!-- header-start -->
<header class="menudiv1">
    <div class="menudiv2-1">
        <img alt="" src="${pageContext.request.contextPath}/resources/images/logo2.png">
    </div>
    <div class="menudiv2-2">
        <div class="menudiv3-1" id="div1">
            <ul id="menuItems">
                <li class="item">호스트</li>
                <!-- 히든으로 리스트 -->
                <li class="item">로그인</li>
            </ul>
        </div>
    </div>
</header>
<!-- header-end -->
<div class="container">
    <div class="total_container">
        <div class="payment_info_container">
            <div class="payment_image">
                <img src="${pageContext.request.contextPath}/resources/images/theme_search/jejusample.jpeg" alt="">
            </div>
            <div class="payment_info">
                <table class="payment_info_table" style="color: black;">
                    <tr class="noline">
                        <td>
                            제주 맛있는 감귤 숙소
                        </td>
                    </tr>
                    <tr>
                        <td class="border-bottom">
                            게스트 3명
                        </td>
                    </tr>
                    <tr>
                        <td class="border-bottom">
                            2020년 6월 7일 -> 2020년 6월 10일
                        </td>
                    </tr>
                    <tr>
                        <td>
                            4,0000 원 x 3박 -> 120,000 원
                        </td>
                    </tr>
                    <tr>
                        <td>
                            서비스 수수료 -> 12,000 원
                        </td>
                    </tr>
                    <tr>
                        <td class="border-bottom">
                            총 합계 -> 144,000 원
                        </td>
                    </tr>
                    <tr class="noline">
                        <td><input class="btn btn-outline-danger" type="button" value="결제하기"></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="right_container" style="color: black">
            <div class="warning_container ">
                <div class="room_policy">
                    <h1>숙소 이용규칙 확인하기</h1>
                    <ul>
                        <li><i class="fa fa-exclamation"></i>너무 소란스러운 행위는 금지입니다.</li>
                        <li><i class="fa fa-exclamation"></i>너무 소란스러운 행위는 금지입니다.</li>
                    </ul>
                </div>
                <div class="room_reservation_day">
                    <i class="fas fa-calendar-day fa-2x"></i>
                    <ul>
                        <li id="li-margin-bottom"><span class="checkin-day">6월 7일 체크인:화요일 오후 2:00 이후</span></li>
                        <li><span class="checkout-day">6월 10일 체크아웃:목요일 오전 11:00 </span></li>
                    </ul>
                </div>

                <div class="warning-icons">
                    <ul>
                        <li><i class="fas fa-paw fa-2x"></i><span> 강아지와 함께 숙소 이용 가능 </span></li>

                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- footer-start -->
<footer class="first" id="bottom">
    <div class="second">
        회사소개 | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때 마케팅센터 | 액티비티 호스트센터 | HOTEL 여기어때 |콘텐츠산업진흥법에의한 표시<br>
        <br>
        고객행복센터 1670-6250 오전 9시 - 새벽 3시, 점심시간: 오후 12시 - 오후 1시<br><br>
        (주) 여기어때컴퍼니<br><br>
        주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br>
        대표이사 : 박남수 | 사업자등록번호: 742-86-00224<br>
        통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호: 제1026-24호<br>
        전화번호 : 1670-6250<br>
        전자우편주소 : skatn7979@gmail.com<br>
        Copyright GC COMPANY Corp. All rights reserved.<br>
        <hr id="bline">
        <img src="${pageContext.request.contextPath}/resources/images/face.png" id="blogo">
        <img src="${pageContext.request.contextPath}/resources/images/insta.png" id="blogo">
    </div>
</footer>
<!-- footer-end -->

</body>
</html>
