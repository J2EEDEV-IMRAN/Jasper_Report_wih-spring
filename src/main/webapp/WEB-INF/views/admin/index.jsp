<%--
  Created by IntelliJ IDEA.
  User: ataur
  Date: 1/16/17
  Time: 11:25 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>ADMIN PANEL</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, login-scalable=no" name="viewport">
    <%@ include file="/WEB-INF/views/admin/includes/css.jsp" %>

</head>
<body ng-app="cptuApp" class="hold-transition skin-green sidebar-mini sidebar-collapse" ng-controller="appController">
<div class="wrapper">


    <%@ include file="/WEB-INF/views/admin/includes/header.jsp" %>

    <!-- Left side column. contains the logo and sidebar -->


    <%@ include file="/WEB-INF/views/admin/includes/sidebar.jsp" %>


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                Dashboard
                <small>Control panel</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">


            <div class="row well-sm" ng-include="page" id="pageContent">

            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


    <%@ include file="/WEB-INF/views/admin/includes/footer.jsp" %>


    <!-- ./wrapper -->

</div>
<%@ include file="/WEB-INF/views/admin/includes/script.jsp" %>
</body>
</html>