<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <%--<div class="user-panel">--%>
            <%--<div class="pull-left image">--%>
                <%--<img src="<c:url value="/resources/admin/assets/dist/img/ataur-160x160.png"/>" class="img-circle"--%>
                     <%--alt="User Image">--%>
            <%--</div>--%>
            <%--<div class="pull-left info">--%>
                <%--<p>Ataur Rahman</p>--%>
                <%--<a href="#"><i class="fa fa-circle text-success"></i> Online</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                    <span class="pull-right-container">
          <i class="fa fa-angle-left pull-right"></i>
        </span>
                </a>
            </li>
            <%@ include file="/WEB-INF/views/admin/includes/sidebar_menu.jsp" %>
        </ul>

    </section>
    <!-- /.sidebar -->
</aside>