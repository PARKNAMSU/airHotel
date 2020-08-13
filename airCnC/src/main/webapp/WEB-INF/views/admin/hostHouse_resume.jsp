<!DOCTYPE html>
<html class="no-js" lang="zxx">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Travelo</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png" />

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="/Mainwork/css/hostdetail1.css"
    />
    <link
      href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css"
    />
  </head>
  <style>
    h2 {
      font-size: 50px;
      color: black;
    }
    h4 {
      width: 500px;
      border-bottom: 3px solid black;
    }
    li {
      margin-top: 40px;
      color: black;
      list-style: none;
      font-size: 25px;
    }
    li:hover {
      color: #ff5a5f;
    }
    input[type="submit"] {
      color: white;
      display: inline-block;
      width: auto;
      height: auto;
      background-color: #ff5a5f;
      border-radius: 5px;
      font-size: 30px;
      text-decoration: none;
      padding: 3px;
      border: none;
    }
  </style>
  <body>
    <!-- header-start -->
    <header style="color: #ff5a5f;">
      <span
        ><i
          class="fas fa-list-alt"
          style="font-size: 35px; padding-left: 20px; float: left;"
        ></i
      ></span>
      <label for="fas fa-question" style="font-size: 40px;"
        >숙소 등록시 확인사항</label
      >
    </header>
    <!-- header-end -->
    <div class="container" style="align-content: center;">
      <img src="/Mainwork/images/step.png" alt="" style="float: right;" />
      <h2>숙소 등록을 완료하고 수입을 올려보세요.</h2>
      <h4>숙소를 등록한 후 언제든 숙소를 수정할 수 있습니다.</h4>
      <div class="hoststep">
        <ul>
          <a href=""><li>숙소 및 게스트</li></a>
          <a href=""><li>위치</li></a>
          <a href=""><li>편의시설</li></a>
          <a href=""><li>사진</li></a>
          <a href=""><li>설명 및 제목</li></a>
          <a href=""><li>예약설정</li></a>
          <a href=""><li>달력 및 예약 가능 여부</li></a>
          <a href=""><li>요금</li></a>
          <a href=""><li>검토하기</li></a>
        </ul>
      </div>
      <input type="submit" value="확인" style="margin-left: 85%;" />
    </div>
  </body>
</html>