$(document).ready(function() {
	$("#btnLogin").click(function() {
		var adminId = $("#adminId").val();
		var adminPassword = $("#adminPassword").val();
		if (adminId == "") {
			alert("아이디를 입력하세요.");
			$("#adminId").focus();
			return;
		}
		if (adminPassword == "") {
			alert("비밀번호를 입력하세요.");
			$("#adminPassword").focus();
			return;
		}
	});
});