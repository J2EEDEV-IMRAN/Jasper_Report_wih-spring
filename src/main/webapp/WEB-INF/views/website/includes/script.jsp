<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script src="<c:url value="/resources/website/bower_components/jquery/dist/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/website/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/valigniter.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/footnote.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templeteasing.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templethoverIntent.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetisotope.pkgd.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetjquery.ajaxchimp.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetjquery.counterup.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetjquery.magnific-popup.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetjquery.nice-select.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetmail-script.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetjquery.tabs.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetowl.carousel.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetsimple-skillbar.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetsuperfish.min.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/templetmain.js"/>"></script>
<script src="<c:out value="/resources/website/assets/js/jquery-scrollToTop.min.js"/>"></script>
<%--templetpopper.min.js--%>
<script>


        $(document).ready(function() {

            $(document).on('click','.advancedSearch',function (event) {
                console.log(event);
                $('.advancedSearchForm').toggle("slow");
            })
            $('[data-toggle="tooltip"]').tooltip();
            String.prototype.bn_number = function(){
                var b = String (this);
                 var c = b.replace(/0/g,'০')
                  .replace(/1/g,'১')
                  .replace(/2/g,'২')
                  .replace(/3/g,'৩')
                  .replace(/4/g,'৪')
                  .replace(/5/g,'৫')
                  .replace(/6/g,'৬')
                  .replace(/7/g,'৭')
                  .replace(/8/g,'৮')
                  .replace(/9/g,'৯');
                 //console.log(c);
                return c;
            }



            String.prototype.en_number = function(){
                var b = String (this);
                var c = b.replace(/০/g,'0')
                        .replace(/১/g,'1')
                        .replace(/২/g,'2')
                        .replace(/৩/g,'3')
                        .replace(/৪/g,'4')
                        .replace(/৫/g,'5')
                        .replace(/৬/g,'6')
                        .replace(/৭/g,'7')
                        .replace(/৮/g,'8')
                        .replace(/৯/g,'9');
                //console.log(c);
                return c;
            }

            $(document).on("keyup","[data-td-index]",function () {

                var table = $(".table-search");
                var filter = [];

                $(this).parents("form").find("[data-td-index]").each(function (index){
                    if ($(this).val().trim()!="" && $(this).val()!=null){
                        filter.push(
                                {
                                    "bn": $(this).val().trim().toUpperCase().bn_number(),
                                    "en": $(this).val().trim().toUpperCase().en_number(),
                                    "td": $(this).data("td-index")
                                }
                        )
                     }
                })


                var trs = table.find("tbody tr");

                $.each(trs, function (index, tr) {
                    var rowShow = true;
                    $.each(filter, function (ind, val){
                        console.log(val);
                        var td = $(tr).find("td").get(val["td"]);
                        var text = $(td).text();

                        if (text.toUpperCase().indexOf(val["en"]) > -1
                        || text.toUpperCase().indexOf(val["bn"]) > -1){
                            rowShow = rowShow && true;
                        }else{
                            rowShow = false;
                        }
                    })
                    if (rowShow==true){
                        $(tr).show();
                    }else{
                        $(tr).hide();
                    }
                } )

            })

            $(document).on("keyup","[data-search]",function () {


                var searchContent = $(this).data("search");

                var filter1 = $(this).val().trim().toUpperCase().bn_number();
                var filter2 = $(this).val().trim().toUpperCase().en_number();


                var rows = $(document).find(searchContent);


                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < rows.length; i++) {

                    var row = rows[i];
                    if (row) {
                        if ($(row).text().toUpperCase().indexOf(filter1) > -1
                                ||$(row).text().toUpperCase().indexOf(filter2) > -1
                        ) {
                            $(row).show();
                        } else {
                            $(row).hide();
                        }
                    }
                }
            })

            $(document).find(".removableRowTable").each(function (index) {
                console.log($(this).find("tbody tr").length);
                $(this).find("tbody").each(function () {
                    if ($(this).find("tr").length<=1){
                        $(this).remove();
                    }
                })
            })


            $(document).on("reset","form",function () {

                var table = $(".table-search");


                var tr = table.find("tbody tr");


                // Loop through all table rows, and hide those who don't match the search query
                for (i = 0; i < tr.length; i++) {

                    tr[i].style.display = "";

                }


            })


            $(".like-btn").click(function() {
                var postId = $(this).parent().attr('id');

                $.ajax({
                    type: "GET",
                    // dataType: "json",
                    url: "http://localhost:8086/like?postId=" + postId,

                    success: function(response){
                       // alert("Submit succeeded"+response);
                        /* if(response===true){
                         window.alert("Update the HTML");*/
                        //update the like button color here
                        //var respContent = "";
                       // respContent += "<span class='success'>"+response+"</span>";
                        $("#like_count-"+postId).html(response);
                       // $('#like-btn').css('color','blue');
//                        }
                    },
                    error: function(e){
                        alert("Submit failed"+e);
                    }
                })
            })





        });

        $(document).ready(function($) {
            $('body').scrollToTop({
                distance: 200,
                speed: 1000,
                easing: 'linear',
                animation: 'fade', // fade, slide, none
                animationSpeed: 500,

                mobile: {
                    width: 768,
                    distance: 100,
                    speed: 1000,
                    easing: 'easeInOutElastic',
                    animation: 'slide',
                    animationSpeed: 200
                },

                trigger: null, // Set a custom triggering element. Can be an HTML string or jQuery object
                target: null, // Set a custom target element for scrolling to. Can be element or number
                text: '<i class="fa fa-chevron-circle-up" aria-hidden="true"></i>Top', // Text for element, can contain HTML

                skin: null,
                throttle: 250,

                namespace: 'scrollToTop'
            });
        });
</script>