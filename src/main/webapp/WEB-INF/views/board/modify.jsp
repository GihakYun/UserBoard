<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">게시글 수정</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">게시글 수정</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/UserBoard/board/modify" method="post">

					<input type='hidden' name='pageNum'
						value='<c:out value="${cri.pageNum }"/>'> <input
						type='hidden' name='amount'
						value='<c:out value="${cri.amount }"/>'> <input
						type='hidden' name='type' value='<c:out value="${cri.type }"/>'>
					<input type='hidden' name='keyword'
						value='<c:out value="${cri.keyword }"/>'>


					<div class="form-group">
						<label>글 번호</label> <input class="form-control" name='bid'
							value='<c:out value="${board.bid }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>'>
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'><c:out
								value="${board.content}" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer}"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>게시글 등록일</label> <input class="form-control" name='regDate'
							value='<fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${board.regDate}" />'
							readonly="readonly">
					</div>


					<div class="form-group">
						<label>게시글 수정일</label> <input class="form-control"
							value='<fmt:formatDate pattern = "yyyy-MM-dd hh:mm:ss" value = "${board.updateDate}" />'
							readonly="readonly">
					</div>


					<sec:authentication property="principal" var="pinfo" />
					<sec:authorize access="isAuthenticated()">
						<c:if test="${pinfo.username eq board.writer}">
							<!-- username과 writer가 일치하면 수정 가능-->
							<button type="submit" data-oper='modify' class="btn btn-default">수정</button>
							<button type="submit" data-oper='remove' class="btn btn-danger">삭제</button>
						</c:if>
					</sec:authorize>

					<!-- 토큰 -->
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

					<button type="submit" data-oper='list' class="btn btn-info">게시글 목록</button>

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

		var formObj = $("form");
		var bidValue = '<c:out value="${board.bid}"/>'; // 게시물 번호


		$('button').on("click", function(e) {

			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation === 'remove') {

				formObj.attr("action", "/UserBoard/board/remove");

			} else if (operation === 'list') {
				//move to list
				formObj.attr("action", "/UserBoard/board/list").attr("method", "get");

				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				var keywordTag = $("input[name='keyword']").clone();
				var typeTag = $("input[name='type']").clone();

				formObj.empty();

				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(keywordTag);
				formObj.append(typeTag);
			}

			console.log("submit 시작");
			formObj.submit();
			console.log("submit 끝");
		});

	});
</script>





<%@include file="../includes/footer.jsp"%>
