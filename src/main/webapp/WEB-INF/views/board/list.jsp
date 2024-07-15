<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/header.jsp"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">게시판</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <!-- /.panel-heading -->
                 
            
            <div class="panel-body">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>수정일</th>
                        </tr>
                    </thead>

                    <c:forEach items="${list}" var="board">
                        <tr>
                            <td><c:out value="${board.bid}" /></td>
                            <td><a class='move' href='${board.bid}'>
                                <c:out value="${board.title}" />
                            </a></td>
                            <td><c:out value="${board.writer}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regDate}" /></td>
                            <td><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
                        </tr>
                    </c:forEach>
                </table>
                <!-- 인증된 사용자만 게시글 작성 버튼 표시 -->
                <sec:authorize access="isAuthenticated()">
                    <button id='regBtn' type="button" class="btn btn-success pull-right">게시글 작성</button>
                </sec:authorize>
                
                <div class='row'>
                    <div class="col-lg-12">
                    	검색
                        <form id='searchForm' action="/UserBoard/board/list" method='get'>
                            <select name='type'>
                                <option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>--</option>
                                <option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : ''}>제목</option>
                                <option value="C" ${pageMaker.cri.type eq 'C' ? 'selected' : ''}>내용</option>
                                <option value="W" ${pageMaker.cri.type eq 'W' ? 'selected' : ''}>작성자</option>
                                <option value="TC" ${pageMaker.cri.type eq 'TC' ? 'selected' : ''}>제목 or 내용</option>
                                <option value="TW" ${pageMaker.cri.type eq 'TW' ? 'selected' : ''}>제목 or 작성자</option>
                                <option value="TWC" ${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}>제목 or 내용 or 작성자</option>
                            </select>
                            <input type='text' name='keyword' value='${pageMaker.cri.keyword}' />
                            <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}' />
                            <input type='hidden' name='amount' value='${pageMaker.cri.amount}' />
                            <button class='btn btn-default'>Search</button>
                        </form>
                    </div>
                </div>
                </br>
                
                <!-- 관리자 전용 유저 조회 -->
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <form id='adminForm' action="/UserBoard/member/getByAdmin" method='get'>
                        <input type="text" name="userid" />
                        <button class="searchMember btn btn-primary">관리자 전용 유저 조회</button>
                    </form>
                 </sec:authorize>

                <div class='pull-right'>
                    <ul class="pagination">
                        <c:if test="${pageMaker.prev}">
                            <li class="paginate_button previous"><a href="${pageMaker.startPage - 1}">Previous</a></li>
                        </c:if>

                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                            <li class="paginate_button ${num == pageMaker.cri.pageNum ? 'active' : ''}">
                                <!-- 현재 페이지버튼 활성화 --> 
                                <a href="${num}">${num}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${pageMaker.next}">
                            <li class="paginate_button next"><a href="${pageMaker.endPage + 1}">Next</a></li>
                        </c:if>
                    </ul>
                </div>
                <!-- end Pagination -->
            </div>

            <form id='actionForm' action="/UserBoard/board/list" method='get'>
                <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
                <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
                <input type='hidden' name='type' value='${pageMaker.cri.type}'>
                <input type='hidden' name='keyword' value='${pageMaker.cri.keyword}'>
            </form>
        </div>
        <!-- end panel-body -->
    </div>
    <!-- end panel -->
</div>
<!-- /.row -->

<script type="text/javascript">
    $(document).ready(function() {
        var actionForm = $("#actionForm");

        $("#regBtn").on("click", function() {
            self.location = "/UserBoard/board/register"; // register로 이동
        });

        $(".paginate_button a").on("click", function(e) {
            e.preventDefault();
            actionForm.find("input[name='pageNum']").val($(this).attr("href"));
            actionForm.submit();
        });

        $(".move").on("click", function(e) {
            e.preventDefault();
            actionForm.append("<input type='hidden' name='bid' value='" + $(this).attr("href") + "'>");
            actionForm.attr("action", "/UserBoard/board/get");
            actionForm.submit();
        });

        var searchForm = $("#searchForm");

        $("#searchForm button").on("click", function(e) {
            if (!searchForm.find("option:selected").val()) {
                alert("검색종류를 선택하세요");
                return false;
            }

            if (!searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요");
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
            e.preventDefault();
            searchForm.submit();
        });
    });
</script>

<%@include file="../includes/footer.jsp"%>

