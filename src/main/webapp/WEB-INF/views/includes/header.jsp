<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="/UserBoard/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/UserBoard/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/UserBoard/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/UserBoard/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/UserBoard/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/UserBoard/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/UserBoard/board/list">게시판</a>
            </div>
            <!-- /.navbar-header -->
	            <ul class="nav navbar-top-links navbar-right">
	                <!-- /.dropdown -->
	                <li class="dropdown">
	                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
	                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
	                    </a>
	                    <ul class="dropdown-menu dropdown-user">
	                       	<sec:authorize access="isAuthenticated()">
	                        <li><a href="../member/get"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
	                        </sec:authorize>
	                        
	                        <li class="divider"></li>
	                        <sec:authorize access="isAuthenticated()">
		                        <li><a href="/UserBoard/customLogout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
		                        </li>
	                        </sec:authorize>
	                        
	                        <sec:authorize access="isAnonymous()">
	                        	<li><a href="/UserBoard/customLogin"><i class="fa fa-sign-out fa-fw"></i> Login</a>
		                        </li>
	                        </sec:authorize>
	                    </ul>
	                    
	                    <!-- /.dropdown-user -->
	                </li>
	                <!-- /.dropdown -->
	            </ul>
	            <div class="navbar-brand navbar-right">
				<sec:authorize access="isAuthenticated()">
					환영합니다! <sec:authentication property="principal.member.username" />님
	            </sec:authorize>
	            <!-- 인증된 사용자만 표시 -->
                <sec:authorize access="isAnonymous()">
                	<a href="../member/register">회원가입</a>
                </sec:authorize>
	            </div>
            <!-- /.navbar-top-links -->

            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>