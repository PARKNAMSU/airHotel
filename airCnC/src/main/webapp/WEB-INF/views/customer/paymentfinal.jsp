<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script>
        var IMP = window.IMP;
        IMP.init('imp33045769');

        IMP.request_pay({ //param
            pg : 'inicis', // version 1.1.0부터 지원.
            pay_method : 'card',
            merchant_uid : 'merchant_' + 'customer_id${customerInfo.customer_id}' + 'house_seq${house.house_seq}time' + new Date().getTime(),
            name : '에어씨엔씨',
            amount : 1000,
            buyer_email : '${customerInfo.customer_email}',
            buyer_name : '${customerInfo.customer_name}',
            buyer_tel : '${customerInfo.customer_phone}}',
            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
        }, function(rsp) { //callback
            if ( rsp.success ) {
                var info = {"imp_uid": rsp.imp_uid, "paid_amount": rsp.paid_amount, "apply_num": rsp.apply_num,
                    "buyer_name": '${customerInfo.customer_name}', "paid_at": rsp.paid_at, "host_id": '${house.host_id}',
                    "check_in": '${checkin}', "check_out": '${checkout}', "house_seq":'${house.house_seq}',
                    "customer_id": '${customerInfo.customer_id}', "cuponNum": '${cuponNum}', "customer_refund_account" : '${customerInfo.customer_refund_account}',
                    "customer_refund_bank": '${customerInfo.customer_refund_bank}'};
                jQuery.ajax({
                    url: "http://localhost:8080/cnc/paymentcomplete.do",
                    method : "POST",
                    headers : {"Content-Type":"application/json"},
                    dataType : 'json',
                    data : JSON.stringify(info)
                }).done(function (data) {
                    //가맹점 서버 결제 API 성공시 로직
                });
                alert("성공적으로 결제되었습니다.");
                location.href="reservationPage.do";
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
        });
    </script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

</body>
</html>
