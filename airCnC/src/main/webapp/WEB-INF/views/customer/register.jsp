<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="panel">
		<form:form commandName="${commandName}" name="frm" cssClass="panel-body" method="post">
			<header class="text-left createHeader">
				기본정보입력&nbsp; <span class="subCreateHeader">기본정보를 정확히 입력해주세요</span>
			</header>
			<div class="form-group">
				<span class="star">*</span>&nbsp; <label
					class="control-label idCheck" style="float: left;"><spring:message
						code="messageVo.idLabel" /></label>
				<form:errors cssClass="idSuccess"
					style="color:red; font-size :10px; margin-top:5px; margin-left:5px; width:235px; float:left"
					path="userId" />
				<div class="createIdSpan" id="createIdSpan"></div>
				<form:input type="text" path="userId" cssClass="form-control"
					maxlength="20" onKeyup="checkedId(this);" onblur="onblur_event();"
					autocomplete="off" />
			</div>
			<div class="form-group">
				<span class="star">*</span>&nbsp; <label
					class="control-label nameCheck" style="float: left;"><spring:message
						code="messageVo.nameLabel" /></label>
				<form:input type="text" path="userNm" placeholder="이름을 입력하세요"
					cssClass="form-control" maxlength="20" autocomplete="off" />
			</div>
			<div class="form-group auth">
				<span class="star">*</span>&nbsp; <label
					class="control-label emailCheck" style="float: left;"><spring:message
						code="messageVo.emailLabel" /></label>
				<form:errors cssClass="emailSuccess"
					style="color:red; font-size :10px; margin-top:5px; margin-left:5px; width:250px; float:left"
					path="userEmail" />
				<div class="createEmailSpan" id="createEmailSpan"></div>
				<form:input type="email" path="userEmail"
					placeholder="example@example.com"
					cssClass="form-control emailInput" maxlength="30"
					autocomplete="off" />
				<button type="button" class="btn btn-info emailBtn" id="emailBtn">인증번호
					전송</button>
				&nbsp;&nbsp;
			</div>
			<div class="form-group">
				<label class="control-label"><spring:message
						code="messageVo.passwordLabel" /></label>
				<form:password path="userPw" placeholder="Password" maxlength="16"
					cssClass="form-control" onblur="onblur_passwordCheck();"
					autocomplete="off" />
			</div>
			<div class="form-group">
				<label class="control-label passwordCheck"><spring:message
						code="messageVo.passwordLabel2" /></label> <input type="password"
					id="userPw2" placeholder="Password 재확인" maxlength="16"
					class="form-control" onblur="onblur_passwordCheck();"
					autocomplete="off" />
			</div>
			<div class="form-group">
				<label class="control-label labelAddr"><spring:message
						code="messageVo.addrLabel" /></label>
				<div>
					<form:input cssClass="form-control zipCode" path="userZipCode"
						placeholder="클릭 후 검색"
						onclick="openDaumPostcode('userZipCode','userFirstAddr','userSecondAddr'); return false;"
						readonly="true" />
					<form:input cssClass="form-control userFirstAddr"
						path="userFirstAddr" readonly="true" />
					<form:input cssClass="form-control userSecondAddr"
						path="userSecondAddr" />
				</div>
				<div id="layer"
					style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
					<img
						src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
						id="btnCloseLayer"
						style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
						onclick="closeDaumPostcode()" alt="닫기 버튼">
				</div>
			</div>
			<div class="btnDiv">
				<button type="button" class="btn btn-info" id="create"
					data-toggle="tooltip" data-placement="bottom"
					data-original-title="회원가입">회원 가입</button>
				&nbsp;&nbsp;
				<button type="button" class="btn" id="formReset"
					data-toggle="tooltip" data-placement="bottom"
					data-original-title="양식 초기화">
					<spring:message code="messageVo.messageReset" />
				</button>
			</div>
		</form:form>
		<input type="hidden" path="random" id="random" value="${random }" />
	</section>
</body>
</html>