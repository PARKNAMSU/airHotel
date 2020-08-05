<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/menu.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/footer.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reservation_map.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/resources/css/SUHWAN.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
    <title>지도 있는 예약 페이지</title>
  </head>
  <body>
    <!-- header-start -->
    <header class="logo">
      <span style="color: #ff5a5f;"
        ><i
          class="fas fa-images"
          style="
            font-size: 35px;
            padding-left: 20px;
            float: left;
            padding-top: 25px;
          "
        ></i
      ></span>
      <label for="fas fa-question" style="font-size: 40px;"
        >지도가 있는 숙소 페이지</label
      >
    </header>
    <!-- header-end -->
    <main>
      <div class="searchOptions">
        <form action="reservation_map.html" class="searchZone">
          <div class="srcachlocation">
            <label class="searchConditions"
              >지역 <input type="" size="5" id="location"
            /></label>
            <label class="searchConditions"
              >상세 <input type="" size="5" id="locationDetail"
            /></label>
            <label class="searchConditions"
              >체크인 <input type="date" id="checkIn"
            /></label>
            <label class="searchConditions"
              >체크아웃 <input type="date" id="checkOut"
            /></label>
            <label class="searchConditions"
              >인원 <input type="number" id="people"
            /></label>
            <!-- 팝업창 코드-->
            <button class="btn1" type="submit" value="검색">검색</button>
         <button class="btn2" id="button" >상세검색</button>
         <div id="divToggle" style="display: none; color: black;">
            <select id="select_type">
               <option>종류 선택</option>
               <option>서울</option>
               <option>인천</option>
               <option>대전</option>
              </select>
              <select id="select_menu">
               <option>지역 선택</option>
              </select>
         </div>
          <div class="hiddenDetail">
            <div class="manu1">
               <div class="menu2">
                  <label for="manu2" class="lab1"
                     >생활에 관한것
                     <label for="che1" style="cursor: pointer;"
                     ><input type="checkbox" id="che1" />동물</label
                     >
                     <label for="che2" style="cursor: pointer;"
                     ><input type="checkbox" id="che2" />파티룸</label
                     >
                     <label for="che3" style="cursor: pointer;"
                     ><input type="checkbox" id="che3" />바베큐장</label
                     >
                     <label for="che4" style="cursor: pointer;"
                     ><input type="checkbox" id="che4" />욕조</label
                     >
                     <label for="che5" style="cursor: pointer;"
                     ><input type="checkbox" id="che5" />WIFI</label
                     >
                     <label for="che6" style="cursor: pointer;"
                     ><input type="checkbox" id="che6" />헬스장</label
                     >
                  </label></br>
               </div>
               <div class="menu3">
                  <label for="manu3" class="lab2"
                     >생활에 관한것
                     <label for="che7" style="cursor: pointer;"
                     ><input type="checkbox" id="che7" />동물</label
                     >
                     <label for="che8" style="cursor: pointer;"
                     ><input type="checkbox" id="che8" />파티룸</label
                     >
                     <label for="che9" style="cursor: pointer;"
                     ><input type="checkbox" id="che9" />바베큐장</label
                     >
                     <label for="che10" style="cursor: pointer;"
                     ><input type="checkbox" id="che10" />욕조</label
                     >
                     <label for="che11" style="cursor: pointer;"
                     ><input type="checkbox" id="che11" />WIFI</label
                     >
                     <label for="che12" style="cursor: pointer;"
                     ><input type="checkbox" id="che12" />헬스장</label
                     >
                  </label>
               </div>
            </div>
          </div>
        </form>
        <div class="container">
          <div id="map">
        </div>
          <div class="houseList">
            <img src="../images/face.png" alt="숙소 이미지" class="littleImg" />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/insta.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/menubar.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img src="../images/face.png" alt="숙소 이미지" class="littleImg" />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/insta.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/menubar.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img src="../images/face.png" alt="숙소 이미지" class="littleImg" />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/insta.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/menubar.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img src="../images/face.png" alt="숙소 이미지" class="littleImg" />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/insta.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
          <div class="houseList">
            <img
              src="../images/menubar.png"
              alt="숙소 이미지"
              class="littleImg"
            />
            숙소이름<br />
            숙소 소개<br />
            주소<br />
            별점<br />
            가격
          </div>
          <hr />
        </div>
      </div>
    </main>
    <footer class="first" id="bottom">
      <div class="second">
        회사소개 | 이용약관 | 개인정보처리방침 |사업자 정보확인 | 여기어때
        마케팅센터 | 액티비티 호스트센터 | HOTEL 여기어때
        |콘텐츠산업진흥법에의한 표시<br />
        <br />
        고객행복센터 1670-6250 오전 9시 - 새벽 3시, 점심시간: 오후 12시 - 오후
        1시<br /><br />
        (주) 여기어때컴퍼니<br /><br />
        주소 : 서울특별시 강남구 봉은사로 479, 479타워 11층<br />
        대표이사 : 박남수 | 사업자등록번호: 742-86-00224<br />
        통신판매번호 : 2017-서울강남-01779 | 관광사업자 등록번호: 제1026-24호<br />
        전화번호 : 1670-6250<br />
        전자우편주소 : skatn7979@gmail.com<br />
        Copyright GC COMPANY Corp. All rights reserved.<br />
        <hr id="bline" />
        <img src="../images/face.png" id="blogo" />
        <img src="../images/insta.png" id="blogo" />
      </div>
    </footer>
    <script
      type="text/javascript"
      src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"
    ></script>
    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=34a9b57d9683ba3774a7043210836806&libraries=services"
    ></script>
    <script src="${pageContext.request.contextPath}/resources/js/map.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(function () {
        $("a[name='trigger']").toggle(
          function () {
            $(this).closest("div").next().show();
          }
        );
      });
    </script>
    <!-- 상세검색 js (기본 event를 없애줫다)-->
     <script>
      $(function () {
        $("#button").click(function (event) {
         event.preventDefault();
          $("#divToggle").slideToggle("fast");
        });
      });
     </script>
      <script type="text/javascript">
         var f_seoul = ["서울지역선택", "강남구", "강서구"];
         var f_incheon = ["인천지역선택", "부평구", "남동구", "미추홀구"];
         var f_deajeon = ["대전지역선택", "3구", "변화구", "직구"];
         var foods = [["지역 선택"], f_seoul, f_incheon, f_deajeon];
        
         function createTag(index) {
           var result = "";
           foods[index].forEach(function (item) {
            result += "<option>" + item + "</option>";
           });
           return result;
         }
        
         function chgOptions() {
           var selected_index = $("#select_type option").index(
            $("#select_type option:selected")
           );
           $("#select_menu").html(createTag(selected_index));
         }
        
         $("#select_type").on("change", function () {
           chgOptions();
         });
        </script>
  </body>
</html>