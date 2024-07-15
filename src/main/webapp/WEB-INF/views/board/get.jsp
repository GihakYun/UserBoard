<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">게시글</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>글 번호</label> <input class="form-control" name='bid'
						value='<c:out value="${board.bid }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>제목</label> <input class="form-control" name='title'
						value='<c:out value="${board.title }"/>' readonly="readonly">
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='content'
						readonly="readonly"><c:out value="${board.content}" /></textarea>
				</div>

				<div class="form-group">
					<label>작성자</label> <input class="form-control" name='writer'
						value='<c:out value="${board.writer }"/>' readonly="readonly">
				</div>

				<sec:authentication property="principal" var="pinfo" />
				<sec:authorize access="isAuthenticated()">
					<c:if test="${pinfo.username eq board.writer}">
						<!-- username과 writer가 일치하면 Modify 버튼 출현-->
						<button data-oper='modify' class="btn btn-default">수정</button>
					</c:if>
					
					<sec:authorize access="hasRole('ROLE_ADMIN')">
	                    <button data-oper='delete' class="btn btn-danger">관리자 전용삭제</button>
                	 </sec:authorize>
					
				</sec:authorize>
				
				
				<button data-oper='list' class="btn btn-info">게시글 목록</button>


				<form id='operForm' action="/UserBoard/board/modify" method="get">
					<input type='hidden' id='bid' name='bid'
						value='<c:out value="${board.bid}"/>'> <input
						type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum}"/>'> <input
						type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword}"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
			<!--  end panel-body -->
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->


<div class='row'>

	<div class="col-lg-12">

		<!-- /.panel -->
		<div class="panel panel-default">
			<!--       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->

			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> 댓글

			</div>
			<!-- Reply  -->
			<!-- /.panel-heading -->
			<div class="panel-body">
				<!-- 댓글추가 -->
				<sec:authorize access="isAuthenticated()">
					<form id='replyForm' action="/UserBoard/board/get" method="get">
						<label>유저 : </label>
						<sec:authentication property="principal.username" />
						</br>
						<label>댓글 작성</label>
						<textarea class="form-control" rows="3" name='reply'></textarea>
						<input type='hidden' id='bid' name='bid'
							value='<c:out value="${board.bid}"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'>
					</form>

					<button id='addReplyBtn' class='btn btn-primary btn-sm'
						data-oper='replyCreate' style="float: right; margin-top: 5px;">댓글
						추가</button>
				</sec:authorize>

				<ul class="chat">
					<!--  start reply -->
					<li class="left clearfix" data-rid='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong> <small
									class="pull-right text-muted">2018-01-01 13:13</small>
								
								<sec:authorize access='hasRole("ROLE_ADMIN")'>
									<c:if test="${principal.member.authList[0].auth eq ADMIN}">
											<!--관리자면 관리자 전용 삭제 버튼 출현-->
											<button data-oper='replyDelete' class="btn btn-danger">관리자 전용 댓글삭제</button>
									</c:if>
								</sec:authorize>

								<sec:authorize access="isAuthenticated()">
									<c:if test="${pinfo.username eq board.writer}">
										<!-- username과 writer가 일치하면 댓글 수정 버튼 출현-->
										<button type="button"
											class="replyDelete pull-right btn btn-link">삭제</button>
										<button type="button"
											class="replyModify pull-right btn btn-link">수정</button>
									</c:if>
								</sec:authorize>
							</div>
							<p>Good job!</p>
						</div>
					</li>
					<!-- end reply -->
				</ul>
				<!-- ./ end ul -->
			</div>
			<!-- /.panel .chat-panel -->

			<!-- 페이징-->
			<div class="panel-footer"></div>


		</div>
	</div>
	<!-- ./ end row -->
</div>


<sec:authorize access="hasRole('ROLE_ADMIN')">
    <script type="text/javascript">
        var isAdmin = true;
    </script>
</sec:authorize>
<sec:authorize access="!hasRole('ROLE_ADMIN')">
    <script type="text/javascript">
        var isAdmin = false;
    </script>
</sec:authorize>
<script type="text/javascript" src="/UserBoard/resources/js/reply.js"></script>
<script type="text/javascript">
	console.log("===============");
	console.log("JS TEST");
	var bidValue = '<c:out value="${board.bid}"/>'; // 게시물 번호
	var username = null; // 로그인한 유저 id
	<sec:authorize access="isAuthenticated()">
		username = '${pinfo.username}'; // 수정한 부분: 유저명 설정 시 sec:authorize 태그 내로 이동
	</sec:authorize>
	
	
	var replyForm = $("#replyForm"); // 댓글 작성 form
	var replyUL = $(".chat"); // 댓글 리스트
	
	var replyerValue = null;	// 작성자(유저 id)
	<sec:authorize access="isAuthenticated()">
	replyerValue = '<sec:authentication property="principal.username" />';
	</sec:authorize>
	console.log("replyerValue : " + replyerValue);
	
	/* csrf */
	var csrfHeaderName = "${_csrf.headerName}";	// 인증
	var csrfTokenValue = "${_csrf.token}";
	
	//Ajax spring security header...
	$(document).ajaxSend(function(e, xhr, oprtions){
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	});
	
	
	showList(1);	//List Show
	
	function refresh(){	//refresh 페이지
		replyForm.attr("action", "/UserBoard/board/get")
		replyForm.submit();
	}

	$("button[data-oper='replyCreate']").on("click", function(e) { // 댓글 작성 ajax
		var replyValue = $('textarea[name="reply"]').val(); // 댓글 내용
		
		replyService.add({
			bid : bidValue,
			reply : replyValue,
			replyer : replyerValue
		}, function(success) {
			alert("댓글 추가 완료.");
			refresh();	// 페이지 새로고침
		});
		
	});


	function showList(page) {	// 댓글 출력
		
		console.log("댓글 출력 실행...");
		
		replyService.getList({	
			bid : bidValue,
			page : page
		}, function(replyCnt, list) { 
	
			console.log("replyCnt :" + replyCnt);
			console.log("list :" + list);
			
			if(page == -1){
				pageNum = Math.ceil(replyCnt/10.0);
				showList(pageNum);
				return;
			}
			
			var str = "";
			if (list == null || list.length == 0) {
				replyUL.html("");
				return;
			}
	
			for (var i = 0, len = list.length || 0; i < len; i++) { // 댓글 str에 담은 뒤 출력
				str += "<li class='left clearfix' data-rid='" + list[i].rid + "'>";
				str += "<div><div class='header'><strong class='primary-font'>"
						+ list[i].replyer + "</strong>";
				str += "<small class='pull-right text-muted'>"
						+ replyService.displayTime(list[i].replyDate)
						+ "</small>";
				if (username === list[i].replyer) {
					str += "<button type='button' class='replyDelete pull-right btn btn-link'>삭제</button>";
					str += "<button type='button' class='replyModify pull-right btn btn-link'>수정</button>";
				}
				 if (isAdmin) {
				        str += "<button class='replyDelete pull-right btn btn-warning small-btn'>관리자 전용 댓글삭제"
				             + "</button>";
				    }
				str += "</div>";
				str += "<p>" + list[i].reply + "</p></div></li>";
			}
			
	
			replyUL.html(str);
			
			console.log("replyUL..끝");
			showReplyPage(replyCnt);
	
		});	// end replyService.getList()
	}	// end showList
	
	
	var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(replyCnt){	// 댓글 페이징 함수
      
      var endNum = Math.ceil(pageNum / 10.0) * 10;  
      var startNum = endNum - 9; 
      
      var prev = startNum != 1;	// 1 ~ 10 이면 false prev 버튼 비활성화
      var next = false;
      
      if(endNum * 10 >= replyCnt){	// (?)이게 부정인 경우가 있나?
        endNum = Math.ceil(replyCnt/10.0);	
      }
      
      if(endNum * 10 < replyCnt){	// 마지막 페이징 숫자가 10 단위를 넘어가면 next 버튼 활성화
        next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      
      for(var i = startNum ; i <= endNum; i++){
        
        var active = pageNum == i? "active":"";
        
        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
      }
      
      if(next){
        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
      }
      
      str += "</ul></div>";
      
      console.log(str);
      
      replyPageFooter.html(str);
    }
    
    replyPageFooter.on("click","li a", function(e){
        e.preventDefault();
        console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
        showList(pageNum);
      });     
	
	
	$(".chat").on("click", "li", function(e){	// 댓글 눌렀을 때 event
		var rid = $(this).data("rid");
		console.log(rid);
		
	});	
	
	
	<!-- 댓글 수정 -->
	$(".chat").on("click", ".replyModify", function(e){
		console.log("댓글 수정 버튼");
		// replyModify 버튼의 부모 요소인 li를 찾습니다 
        var liElement = $(this).closest('li');
        // li 요소 내에서 p 요소를 찾습니다
        var pElement = liElement.find('p');
        // p 요소의 텍스트 내용을 가져옵니다
        var pContent = pElement.text();
        // p 요소를 textarea 요소로 대체합니다
        var textareaElement = $('<textarea></textarea>').val(pContent).css({
            width: '100%',
            height: '100px'
        });
        
        var saveButton = $('<button type="button" class="pull-right replySave btn">수정</button>').css({
            display: 'block',
            margin: '5px 0'
        });

        var cancelButton = $('<button type="button" class="pull-right replyCancel btn">취소</button>').css({
            display: 'block',
            margin: '5px 0'
        });

        pElement.replaceWith(textareaElement);
        textareaElement.after(cancelButton, saveButton);
        $(this).hide();
	});
	

    $(document).on('click', '.replyCancel', function() {	// 댓글 수정 취소
        var liElement = $(this).closest('li');
        var rid = $(liElement).data("rid");		// 댓글 rid
        var textareaElement = liElement.find('textarea');
        replyService.get(rid, function(data){
        	console.log(data.reply);
	        var pElement = $('<p></p>').text(data.reply);	// 다시 뒤로갈 댓글 내용
	        
	        textareaElement.nextAll('.replySave, .replyCancel').remove();
	        textareaElement.replaceWith(pElement);
	        liElement.find('.replyModify').show();
        });
    });
    
    $(document).on('click', '.replySave', function() {	// 댓글 수정 확인
        var liElement = $(this).closest('li'); 
        var rid = $(liElement).data("rid");		// 댓글 rid
        var textareaElement = liElement.find('textarea');	
        var textareaContent = textareaElement.val();	// 쓰여진 text 값
        var pElement = $('<p></p>').text(textareaContent);	// 수정할 댓글 내용
        
      
    	replyService.update({	// 댓글 수정 ajax
    	  rid : rid,
    	  bid : bidValue,
    	  reply : textareaContent
    	}, function(result) {

    	  alert("수정 완료.");

    	});

        textareaElement.nextAll('.replySave, .replyCancel').remove();
        textareaElement.replaceWith(pElement);
        liElement.find('.replyModify').show();
    });
    
    <!-- 댓글 삭제 -->
    $(".chat").on("click", ".replyDelete", function(e){
		console.log("댓글 삭제 버튼");
		
		// replyModify 버튼의 부모 요소인 li를 찾습니다 
        var liElement = $(this).closest('li');
        var rid = $(liElement).data("rid");		// 댓글 rid
        
        replyService.remove(rid, function(count) {
 	   		console.log(count);
 	   		if (count === "success") {
 	     		alert("삭제완료.");
 	   		}}, function(err) {
 	   		alert('삭제 오류입니다.');
 	 	});
        
		refresh();	// 페이지 새로고침
	});

    
</script>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {

			operForm.attr("action", "/UserBoard/board/modify").submit();

		});
		
		$("button[data-oper='delete']").on("click", function(e) {

			 operForm.attr("action", "/UserBoard/board/removeByAdmin");
			 operForm.attr("method", "post");
			 operForm.submit();

		});

		$("button[data-oper='list']").on("click", function(e) {

			operForm.find("#bid").remove();
			operForm.attr("action", "/UserBoard/board/list");
			operForm.submit();

		});
	});
</script>
<%@include file="../includes/footer.jsp"%>
