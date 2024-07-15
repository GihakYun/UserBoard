<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
    uri="http://www.springframework.org/security/tags"%>
<%@include file="../includes/header.jsp"%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">회원가입</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-default">

            <div class="panel-heading">회원가입</div>
            <!-- /.panel-heading -->
            <div class="panel-body">

                <form role="form" action="/UserBoard/member/register" method="post">
                    <input type="hidden" name="${_csrf.parameterName }"
                        value="${_csrf.token }" />
                    <div class="form-group">
                        <label>아이디</label> 
                        <input class="form-control" id="userid" placeholder="아이디" name='userid'>
                        <label id="label1"></label>
                    </div>

                    <div class="form-group">
                        <label>비밀번호</label> 
                        <input class="form-control" type="password" placeholder="비밀번호" name='userpw' id="userpw" />
                        <label id="label2"></label>
                    </div>

                    <div class="form-group">
                        <label>비밀번호 확인</label> 
                        <input class="form-control" type="password" placeholder="비밀번호 확인" id="userpwConfirm" />
                        <span id="passwordCorrection"></span>
                    </div>
                    
                    <div class="form-group">
                        <label>이름</label> 
                        <input class="form-control"  id="username" placeholder="이름" name='username' />
                        <label id="label3"></label>
                    </div>
                    

                    <div class="form-group">
                        <label>이메일</label> 
                        <input class="form-control" placeholder="이메일을 입력해주세요" name="email"
                            id="email" type="email" autofocus> <br>
                        <input type="button" value="인증하기" class="btn btn-primary"
                            id="emailAuth">
                        <span id="countdown" style="margin-left: 10px;"></span>
                        <label id="label4"></label>
                    </div>
                    
                    <div class="form-group">
                        <input class="form-control" placeholder="인증 코드 6자리를 입력해주세요."
                            maxlength="6" disabled="disabled" name="authCode" id="authCode"
                            type="text" autofocus>
                        <span id="emailAuthWarn"></span>
                    </div>

                    <div class="form-group">
                        <button type="submit" id="registerBtn" class="btn btn-default">작성</button>
                        <button type="reset" class="btn btn-default">리셋</button>
                    </div>
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
    // csrf
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";

    var countdownInterval; // 카운트다운 인터벌 변수
    var disableTimeout; // setTimeout 타이머 ID

    // Ajax spring security header...
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
    });
    
    
    
    var isUseridCom = false;
    var isPasswordCom = false;
    var isUsernameCom = false;
    var isEmailCom = false;
    
    $("#registerBtn").attr("disabled", true);
    
    function updateButtonStatus() {
    	console.log("isUseridCom : " + isUseridCom);
    	console.log("isPasswordCom : " + isPasswordCom);
    	console.log("isUsernameCom : " + isUsernameCom);
    	console.log("isEmailCom : " + isEmailCom);
    	
        if (isUseridCom && isPasswordCom && isUsernameCom && isEmailCom) {
            $("#registerBtn").prop("disabled", false);
        } else {
            $("#registerBtn").prop("disabled", true);
        }
    }
    
    
    
    
        // ID 중복 확인
        $("#userid").on("focusout", function() {
            var userid = $("#userid").val();

            if (userid == '' || userid.length == 0) {
                $("#label1").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
                isUseridCom = false;
                updateButtonStatus();
                return false;
            }

            // Ajax로 전송
            $.ajax({
                url: './confirmUserid',
                data: {
                    userid: userid
                },
                type: 'POST',
                dataType: 'json',
                success: function(result) {
                    if (result == true) {
                        $("#label1").css("color", "green").text("사용 가능한 ID 입니다.");
                        isUseridCom = true;
                        updateButtonStatus();
                    } else {
                        $("#label1").css("color", "red").text("중복된 ID 입니다.");
                        $("#id").val('');
                        isUseridCom = false;
                        updateButtonStatus();
                    }
                }
            }); // End Ajax
        });

        // 비밀번호와 비밀번호 확인 일치 여부 검사
        $("#userpw, #userpwConfirm").on("keyup", function() {
            const userpw = $("#userpw").val();
            const userpwConfirm = $("#userpwConfirm").val();
            
            if (userpw == '' || userpw.length == 0) {
                $("#label2").css("color", "red").text("공백은 비밀번호로 사용할 수 없습니다.");
                isPasswordCom = false;
                updateButtonStatus();
                return false;
            }

            if (userpw === userpwConfirm) {
                $("#passwordCorrection").css("color", "green").text("비밀번호가 일치합니다!");
                $("#label2").text("");
                isPasswordCom = true;
                updateButtonStatus();
            } else {
                $("#passwordCorrection").css("color", "red").text("비밀번호가 일치하지 않습니다!");
                isPasswordCom = false;
                updateButtonStatus();
            }
        });
        
        $("#username").on("focusout", function() {
            var username = $("#username").val();
            
            isUsernameCom = true;
            updateButtonStatus();

            if (username == '' || username.length == 0) {
                $("#label3").css("color", "red").text("공백은 이름으로 사용할 수 없습니다.");
                isUsernameCom = false;
                updateButtonStatus();
                return false;
            }

        });
    

    $("#emailAuth").click(function() {
        const email = $("#email").val();
        
        if (email == '' || email.length == 0) {
            $("#label4").css("color", "red").text("공백은 입력할 수 없습니다.");
            isEmailCom = false;
            updateButtonStatus();
            return false;
        }
        
        $("#emailAuth").attr("disabled", true);
        

        // Ajax로 전송
        $.ajax({
            url: './emailAuth',
            data: {
                email: email
            },
            type: 'POST',
            dataType: 'json',
            success: function(result) {
                console.log("result : " + result);
                $("#authCode").attr("disabled", false);
                code = result;
                alert("인증 코드가 입력하신 이메일로 전송 되었습니다.");
                
                $("#label4").text("");
                
                // 3분 후에 registerBtn 비활성화
                disableTimeout = setTimeout(function() {
	                }, 3 * 60 * 1000); // 3분을 밀리초로 변환하여 설정

                // 남은 시간 분:초 형식으로 표시
                var countdown = 180; // 3분 = 180초
                countdownInterval = setInterval(function() {
                    var minutes = Math.floor(countdown / 60);
                    var seconds = countdown % 60;

                    // 1분 미만일 때 숫자 앞에 0을 추가하여 2자리로 표시
                    var minutesDisplay = (minutes < 10 ? "0" : "") + minutes;
                    var secondsDisplay = (seconds < 10 ? "0" : "") + seconds;

                    $("#countdown").css("color", "red").text(minutesDisplay + ":" + secondsDisplay + " 남음");

                    countdown--;

                    if (countdown < 0) {
                        clearInterval(countdownInterval);
                        $("#countdown").text("시간 초과");
                    	isEmailCom = false;
                    	updateButtonStatus();
                    	 
                        $("#emailAuth").val("재인증");	// 버튼 텍스트 변경
                        $("#emailAuth").removeAttr("disabled");	// 버튼 활성화
                    }
                }, 1000); // 1초마다 업데이트
            }
        }); // End Ajax
    });

    // 인증 코드 비교
    $("#authCode").on("focusout", function() {
        const inputCode = $("#authCode").val();

        console.log("입력코드 : " + inputCode);
        console.log("인증코드 : " + code);

        if (Number(inputCode) === code) {
            clearInterval(countdownInterval); // 카운트다운 멈춤
            clearTimeout(disableTimeout); // 버튼 비활성화 타이머 멈춤
            $("#emailAuthWarn").html('인증번호가 일치합니다.');
            $("#emailAuthWarn").css('color', 'green');
            $('#emailAuth').attr('disabled', true);
            $('#email').attr('readonly', true);
            isEmailCom = true;
            updateButtonStatus();
        } else {
            $("#emailAuthWarn").html('인증번호가 불일치 합니다. 다시 확인해주세요!');
            $("#emailAuthWarn").css('color', 'red');
            $("#registerBtn").attr("disabled", true);
            isEmailCom = false;
            updateButtonStatus();
        }
    });

   
</script>
<%@include file="../includes/footer.jsp"%>

