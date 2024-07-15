<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@include file="../includes/header.jsp"%>


<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">게시글 등록</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">게시글 등록</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/UserBoard/board/register" method="post">
	        <input type="hidden" name="${_csrf.parameterName }"
			 value="${_csrf.token }"/>
			         
          <div class="form-group">
            <label>제목</label> <input class="form-control" id="title" name='title'>
             <label id="label1"></label>
          </div>

          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" id="content" rows="3" name='content'></textarea>
            <label id="label2"></label>
          </div>

          <div class="form-group">
            <label>작성자</label> <input class="form-control" name='writer'
             value='<sec:authentication property="principal.username" />' readonly="readonly">
          </div>
          <button id="registerBtn" type="submit" class="btn btn-default">작성</button>
          <button type="reset" class="btn btn-default">리셋</button>
        </form>

      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<script>
$(document).ready(function(e){
	var isTitleCom = false;
    var isContentCom = false;
	
    $("#registerBtn").attr("disabled", true);
    
    function updateButtonStatus() {
        if (isTitleCom && isContentCom) {
            $("#registerBtn").prop("disabled", false);
        } else {
            $("#registerBtn").prop("disabled", true);
        }
    }
	
    $("#title").on("focusout", function() {
        var title = $("#title").val();
        
        isTitleCom = true;
        $("#label1").text("");
        updateButtonStatus();

        if (title == '' || title.length == 0) {
            $("#label1").css("color", "red").text("공백은 사용할 수 없습니다.");
            isTitleCom = false;
            updateButtonStatus();
            return false;
        }

    });
    
    $("#content").on("focusout", function() {
        var content = $("#content").val();
        
        isContentCom = true;
        $("#label2").text("");
        updateButtonStatus();

        if (content == '' || content.length == 0) {
            $("#label2").css("color", "red").text("공백은 사용할 수 없습니다.");
            isContentCom = false;
            updateButtonStatus();
            return false;
        }

    });


  
});

</script>
<%@include file="../includes/footer.jsp"%>
