<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">회원 정보</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">회원 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>아이디</label> <input class="form-control" name='userid'
						value='<sec:authentication property="principal.member.userid"/>'
						readonly="readonly">
				</div>

				<div class="form-group">
					<label>이름</label> <input class="form-control" name='username'
						value='<sec:authentication property="principal.member.username"/>'
						readonly="readonly">
				</div>

				<div class="form-group">
					<label>이메일</label> <input class="form-control" name='email'
						value='<sec:authentication property="principal.member.email"/>'
						readonly="readonly">
				</div>

				<div class="form-group">
					<label>가입일</label> <input class="form-control" name='regDate' 
						value='<sec:authentication property="principal.member.regDate"/>'
						readonly="readonly">
				</div>

				<form id="removeForm" role="form" method="post">
					<input type="hidden" name="userid"
						value="<sec:authentication property='principal.username'/>" />

					<!-- CSRF 토큰 -->
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<button type="button" class="btn btn-danger" id="removeBtn">회원탈퇴</button>
				</form>



			</div>
			<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
$(document).ready(function() {
    $("#removeBtn").on("click", function(e) {
        e.preventDefault();
        
        /* csrf */
    	var csrfHeaderName = "${_csrf.headerName}";	// 인증
    	var csrfTokenValue = "${_csrf.token}";
    	
    	//Ajax spring security header...
    	$(document).ajaxSend(function(e, xhr, oprtions){
    		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    	});
    	
        // AJAX 요청으로 회원 탈퇴
        $.ajax({
            url: "/UserBoard/member/remove",
            type: "POST",
            data: {
                userid: $("input[name='userid']").val()
            },
            success: function(response) {
            	alert("탈퇴 성공");
                // 탈퇴 성공 후 로그아웃 요청
                $.ajax({
                    url: "/UserBoard/customLogout",
                    type: "POST",
                    success: function(response) {
                    	alert("로그아웃 성공");
                        // 로그아웃 성공 후 리다이렉트
                        window.location.href = "/UserBoard/board/list";
                    },
                    error: function(xhr, status, error) {
                        console.error("Logout failed:", error);
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error("Member removal failed:", error);
            }
        });
    });
});

</script>

<%@include file="../includes/footer.jsp"%>
