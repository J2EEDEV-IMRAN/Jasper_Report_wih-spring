<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery 2.2.3 -->
<script src="<c:url value="/resources/admin/assets/plugins/jQuery/jquery-2.2.3.min.js"/>"></script>
<!-- jQuery UI 1.11.4 -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="<c:url value="/resources/admin/assets/bootstrap/js/bootstrap.min.js"/>"></script>
<%--<!-- Morris.js charts -->--%>
<%--<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>--%>
<%--<script src="<c:url value="/resources/admin/assets/plugins/morris/morris.min.js"/>"></script>--%>
<%--<!-- Sparkline -->--%>
<%--<script src="<c:url value="/resources/admin/assets/plugins/sparkline/jquery.sparkline.min.js"/>"></script>--%>
<%--<!-- jvectormap -->--%>
<%--<script src="<c:url value="/resources/admin/assets/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>"></script>--%>
<%--<script src="<c:url value="/resources/admin/assets/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>"></script>--%>
<%--<!-- jQuery Knob Chart -->--%>
<%--<script src="<c:url value="/resources/admin/assets/plugins/knob/jquery.knob.js"/>"></script>--%>
<!-- daterangepicker -->
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="<c:url value="/resources/admin/assets/plugins/daterangepicker/daterangepicker.js"/>"></script>
<!-- datepicker -->
<script src="<c:url value="/resources/admin/assets/plugins/datepicker/bootstrap-datepicker.js"/>"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="<c:url value="/resources/admin/assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>
<!-- Slimscroll -->
<script src="<c:url value="/resources/admin/assets/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>
<!-- FastClick -->
<script src="<c:url value="/resources/admin/assets/plugins/fastclick/fastclick.js"/>"></script>
<script src="<c:url value="/resources/admin/assets/plugins/select2/select2.full.min.js"/>"></script>
<!-- InputMask -->
<script src="<c:url value="/resources/admin/assets/plugins/input-mask/jquery.inputmask.js"/>"></script>
<script src="<c:url value="/resources/admin/assets/plugins/input-mask/jquery.inputmask.date.extensions.js"/>"></script>
<script src="<c:url value="/resources/admin/assets/plugins/input-mask/jquery.inputmask.extensions.js"/>"></script>
<!-- bootstrap color picker -->
<script src="<c:url value="/resources/admin/assets/plugins/colorpicker/bootstrap-colorpicker.min.js"/>"></script>
<!-- bootstrap time picker -->
<script src="<c:url value="/resources/admin/assets/plugins/timepicker/bootstrap-timepicker.min.js"/>"></script>
<!-- SlimScroll 1.3.0 -->
<script src="<c:url value="/resources/admin/assets/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>
<!-- iCheck 1.0.1 -->
<script src="<c:url value="/resources/admin/assets/plugins/iCheck/icheck.min.js"/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value="/resources/admin/assets/dist/js/app.min.js"/>"></script>
<!-- AdminLTE for demo purposes -->
<script src="<c:url value="/resources/admin/assets/dist/js/demo.js"/>"></script>
<!-- Page script -->


<script type="text/javascript" src="<c:url value="/resources/admin/assets/js/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/admin/datatable/JSZip-2.5.0/jszip.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/pdfmake-0.1.18/build/pdfmake.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/pdfmake-0.1.18/build/vfs_fonts.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/DataTables-1.10.12/js/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/DataTables-1.10.12/js/dataTables.bootstrap.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/AutoFill-2.1.2/js/dataTables.autoFill.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/AutoFill-2.1.2/js/autoFill.bootstrap.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Buttons-1.2.2/js/dataTables.buttons.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Buttons-1.2.2/js/buttons.bootstrap.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Buttons-1.2.2/js/buttons.colVis.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Buttons-1.2.2/js/buttons.flash.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Buttons-1.2.2/js/buttons.html5.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Buttons-1.2.2/js/buttons.print.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/ColReorder-1.3.2/js/dataTables.colReorder.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/FixedColumns-3.2.2/js/dataTables.fixedColumns.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/FixedHeader-3.1.2/js/dataTables.fixedHeader.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/KeyTable-2.1.3/js/dataTables.keyTable.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Responsive-2.1.0/js/dataTables.responsive.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Responsive-2.1.0/js/responsive.bootstrap.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/RowReorder-1.1.2/js/dataTables.rowReorder.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Scroller-1.4.2/js/dataTables.scroller.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/admin/datatable/Select-1.2.0/js/dataTables.select.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/admin/assets/js/datatable.js"/>"></script>

<script type="text/javascript" src="<c:url value="/resources/admin/assets/js/bootbox.min.js"/>"></script>
<script type="text/javascript" src="//code.angularjs.org/snapshot/angular.min.js"></script>
<script type="text/javascript" src="//code.angularjs.org/snapshot/angular-route.js"></script>
<script type="text/javascript">
    (function (angular) {
        'use strict';
        angular.module('cptuApp', ['ngRoute'])
                .controller('appController', ['$rootScope', '$scope', '$route', '$routeParams', '$location', '$templateCache', function ($rootScope, $scope, $route, $routeParams, $location, $templateCache) {
                    /*
                     location change handling
                     */
                    $scope.page = '/admin/home';
                    $scope.current_page = "";
                    
//                    $(document).on("click","a[href*='#']",function (event) {
//
//                        console.log("CURRENT PAGE = "+$scope.current_page);
//                        console.log("REQUEST PAGE = "+$location.hash());
//                        if ($.trim(this.href.split("#")[1]) != "" && $scope.current_page==$location.hash()) {
//                            //location.reload();
//                        }
//                        return false;
//                    })

                    $scope.$on('$locationChangeStart', function (event) {
                        //event.preventDefault();
                        console.info("Has Page = "+$location.hash());
                        console.log("Curreent Page = "+$scope.current_page);
                        if ($location.hash() != "" && $scope.current_page!=$location.hash()) {
                            $scope.current_page = $location.hash();
                            $("body").myAjaxLoder();
                            $scope.page = '/admin/' + $location.hash() + '';
                        }
                        return false;
                    });
                    /* remove cache for ng-include directory
                     */
                    $scope.$on('$includeContentLoaded', function (event, templateName) {
                        $templateCache.remove(templateName);
                        $("body").removeMyAjaxLoder();
                        $(document).trigger("childPageReload");
                    });
                }]);
    })(window.angular);
</script>
<script src="<c:url value="/resources/admin/ckeditor/ckeditor.js"/>"></script>

<script src="<c:url value="/resources/admin/assets/js/valigniter.js"/>"></script>
<script src="<c:url value="/resources/admin/assets/js/app.js"/>"></script>
<script>
    $(function () {
        $.fn.datepicker.defaults.format = "dd/mm/yyyy";
        $(document).bind("childPageReload",function () {
            //$(document).find(".select2").select2();

//            //Datemask dd/mm/yyyy
////            $(document).find(".date input").inputmask("dd/mm/yyyy", {"placeholder": "dd/mm/yyyy"});
////            $(document).find(".time input").inputmask("h:mm A", {"placeholder": "h:mm A"});
////            //Datemask2 mm/dd/yyyy
//            $(document).find("#datemask2").inputmask("mm/dd/yyyy", {"placeholder": "mm/dd/yyyy"});
//            //Money Euro
//            $(document).find("[data-mask]").inputmask();
//            //Date range picker
//            $(document).find('#reservation').daterangepicker();
//            //Date range picker with time picker
//            $(document).find('#reservationtime').daterangepicker({timePicker: true, timePickerIncrement: 30, format: 'MM/DD/YYYY h:mm A'});
//            //Date range as a button
//            $(document).find('#daterange-btn').daterangepicker(
//                    {
//                        ranges: {
//                            'Today': [moment(), moment()],
//                            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
//                            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
//                            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
//                            'This Month': [moment().startOf('month'), moment().endOf('month')],
//                            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
//                        },
//                        startDate: moment().subtract(29, 'days'),
//                        endDate: moment()
//                    },
//                    function (start, end) {
//                        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
//                    }
//            );

            //Date picker
//            $(document).find('.datepicker').datepicker({
//                autoclose: true
//            });
            $(document).find('.date').datepicker({
                autoclose: true
            });
//            $(document).find('.datetime').datepicker({
//                format:"dd/mm/yyyy hh:mm A",
//                autoclose: true
//            });

            //iCheck for checkbox and radio inputs
            $(document).find('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
                checkboxClass: 'icheckbox_minimal-blue',
                radioClass: 'iradio_minimal-blue'
            });
            //Red color scheme for iCheck
            $(document).find('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
                checkboxClass: 'icheckbox_minimal-red',
                radioClass: 'iradio_minimal-red'
            });
            //Flat red color scheme for iCheck
            $(document).find('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
            });

            //alert($('.myCustomDataTable').length);
            $('.myCustomDataTable').DataTable();


//            //Colorpicker
//            $(document).find(".my-colorpicker1").colorpicker();
//            //color picker with addon
//            $(document).find(".my-colorpicker2").colorpicker();
//
//            //Timepicker
            $(document).find(".timepicker input").timepicker();
        })
        //Initialize Select2 Elements

    });
</script>
