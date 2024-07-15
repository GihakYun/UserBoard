<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">관리자 전용 회원 조회</h1>
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
						value='<c:out value="${member.userid}" />' readonly="readonly">
				</div>

				<div class="form-group">
					<label>이름</label> <input class="form-control" name='username'
						value='<c:out value="${member.username}" />' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>이메일</label> <input class="form-control" name='email'
						value='<c:out value="${member.email}" />' readonly="readonly">
				</div>
				
				<div class="form-group">
					<label>회원가입 일</label> <input class="form-control" name='regDate'
						value='<c:out value="${member.regDate}" />' readonly="readonly">
				</div>
				
				<form role="form" action="/UserBoard/member/remove" method="post">
					<input type="hidden" name='userid'
						value='<c:out value="${member.userid}" />'/>
						
					<!-- 토큰 -->
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<button type="submit" class="btn btn-warning">관리자 전용 회원 탈퇴</button>
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
</script>

<script type="text/javascript">
</script>
<%@include file="../includes/footer.jsp"%>
