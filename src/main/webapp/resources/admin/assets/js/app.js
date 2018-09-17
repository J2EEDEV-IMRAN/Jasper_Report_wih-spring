/**
 * Created by ataur on 3/6/17.
 */
$(function(){


    $(document).on("childPageReload",function () {
        console.log("Child Page Reloaded! ");
        var column = $(".datatable th:contains('Created By')").index();
        var value = '';
        $(".datatable tr td:nth-child("+column+")").each(function () {
            value += $.trim($(this).html());
        });
        if (value == ''){
            $(".datatable tr td:nth-child("+column+")").hide();
            $(".datatable th:nth-child("+column+")").hide();
        }
        //console.log(column);
    })
    /*
      To add multiple row in child table
     */
    $(document).on('change', '[data-change-pull]', function(event) {
        /* Split the data-change-pull params  by pipe(|) */
        var obj = this;
        var params     = $(this).attr('data-change-pull').split("|");
        /*
        * inputs are to be pulled by filters
        */
        var inputs     = params[0].split(",");

        var filters    = params[1].split(",");


        var actionUrl  = params[2];

        var inputName  = '';
        /*
         All the pulling inputs are being reset by the follow code.
         */
        $.each(inputs, function(index, val) {
            /* iterate through array or object */
            $('[name="'+val+'"]').html('<option value="0"> --SELECT--</option>');
            //console.log(val);
            inputName  = val;
            var itemLabel  = $('[name="'+val+'"]').data('itemLabel');
            var itemValue  = $('[name="'+val+'"]').data('itemValue');
            //console.log(itemLabel);
            //console.log(itemValue);
        });

        var data = {};
        /*
         Take all the dependent inputs into data array
         */
        var ret = false;
        $.each(filters, function(index, val) {
            /* iterate through array or object */
            //console.log(val);
            //console.log($('[name="'+val+'"]').val());
            if( $('[name="'+val+'"]').val()>0){
                data[val] = $('[name="'+val+'"]').val();
            }else{

                if ($('[name="'+val+'"]').data("null-accepted")!=undefined){
                    data[val] = 0;
                }else{
                    ret = true;
                }

            }
        });
        console.log(" ret value is "+ret);
        if (ret ==false){
            /*
             Now Fetch the ajax request to pull the required field value.
             */
            $.ajax({
                url: actionUrl,
                type: 'get',
                dataType: 'json',
                data: data,
                beforeSend: function () {
                    $(obj).parents("form").myAjaxLoder();
                },
            }).done(function(response) {

                if (response != null &&  typeof response != null) {

                    $('[name="'+inputName+'"]').html('<option value="0"> --SELECT--</option>');
                    $.each(response, function(index, val) {

                        $('[name="'+inputName+'"]').append('<option value="' +val[0]+ '">' + decodeURIComponent(val[1]) + '</option>');
                        if(parseInt($('[name="'+inputName+'"]').data('selected'))>0){
                            $('[name="'+inputName+'"]').find('option[value="'+parseInt($('[name="'+inputName+'"]').data('selected'))+'"]').attr("selected","selected");
                        }
                        $('[name="'+inputName+'"]').trigger('change');
                    });

                }
            }).fail(function() {
                console.log("error");
            }).always(function() {
                console.log("complete");
                $(obj).parents("form").removeMyAjaxLoder();
            });
        }
    });
    $("[data-change-pull]").trigger("change");

    // $(document).on('click',".data-delete-action", function(event) {
    //     /* Act on the event */
    //     event.preventDefault();
    //     /**
    //      * This requires the bootboxjs javascript plugin to be loaded.
    //      */
    //     var obj = $(this);
    //     bootbox.confirm({
    //         message: "<h3 class='text-warning'>Are you sure you want to delete this record?</h3>",
    //         buttons: {
    //             confirm: {
    //                 label: 'Yes',
    //                 className: 'btn-success'
    //             },
    //             cancel: {
    //                 label: 'No',
    //                 className: 'btn-danger'
    //             }
    //         },
    //         callback: function (result) {
    //             if(result){
    //                 $('.datatable').myAjaxLoder();
    //                 var actionUrl = obj.attr('href');
    //
    //                 $.ajax({
    //                     url: actionUrl,
    //                     type: 'GET',
    //                     dataType: 'json',
    //                 })
    //                     .done(function(result) {
    //                         if(typeof result.success!='undefined'){
    //                             bootbox.alert("<h3 class='text-success'>"+result.message+"</h3>");
    //                             obj.parents("tr").remove();
    //                         }else{
    //                             bootbox.alert("<h3 class='text-danger'>"+result.message+"</h3>");
    //                         }
    //
    //                     })
    //                     .fail(function() {
    //                         bootbox.alert("<h3 class='text-danger'>Sorry! Something goes wrong! Please try again after sometime.</h3>");
    //                     })
    //                     .always(function() {
    //                         $('.datatable').removeMyAjaxLoder();
    //                     });
    //
    //             }
    //         }
    //     });
    // });


    $(document).on("click",".add_row",function (e){

        $(this).next()
        var table = $(this).parents("fieldset").find("table tbody");
        var row   = $(table).find("tr");
        var new_row_index = row.length;
        var first_row  = row.get(0);
        var first_td = $(first_row).find("td").get(0);
        var inputField = $(first_td).children().get(0);
        var idReplace  = $(inputField).prop("id");
        idReplace = idReplace.split(".")[0].split("[")[0];
        var nameReplace = $(inputField).prop("name");
        nameReplace = nameReplace.split(".")[0].split("[")[0];
        var content = $(first_row).html();
        content     = content.split(idReplace+"[0]").join(idReplace+"["+new_row_index+"]");
        content     = content.replace(/value=\"w+\"/g,'value=""');
        content     = content.split(nameReplace+"[0]").join(nameReplace+"["+new_row_index+"]");
        $(table).append("<tr>"+content+"</tr>");
        $( ".remove_last" ).trigger("display");
    });
    // $(document).on("click",".remove_last",function (e) {
    //     var table = $(this).parents("fieldset").find("table tbody");
    //     if($(table).find("tr").length>1){
    //         var row   = $(table).find("tr:last");
    //         console.log(row.prop("id"));
    //         var actionUrl = row.data("action");
    //         console.log(actionUrl);
    //         if (row.prop("id")==""){
    //             row.remove();
    //         }else{
    //
    //             //alert(actionUrl);
    //             bootbox.confirm({
    //                 message: "<h3 class='text-warning'>Are you sure you want to delete this row?</h3>",
    //                 buttons: {
    //                     confirm: {
    //                         label: 'Yes',
    //                         className: 'btn-success'
    //                     },
    //                     cancel: {
    //                         label: 'No',
    //                         className: 'btn-danger'
    //                     }
    //                 },
    //                 callback: function (result) {
    //                     if(result){
    //                         $('.datatable').myAjaxLoder();
    //                         console.log("Ajax URL: "+actionUrl);
    //                         $.ajax({
    //                             url: actionUrl,
    //                             type: 'GET',
    //                             dataType: 'json',
    //                         })
    //                             .done(function(result) {
    //                                 if(typeof result.success!='undefined'){
    //                                     bootbox.alert("<h3 class='text-success'>"+result.message+"</h3>");
    //                                     row.remove();
    //                                 }else{
    //                                     bootbox.alert("<h3 class='text-danger'>"+result.message+"</h3>");
    //                                 }
    //
    //                             })
    //                             .fail(function() {
    //                                 bootbox.alert("<h3 class='text-danger'>Sorry! Something goes wrong! Please try again after sometime.</h3>");
    //                             })
    //                             .always(function() {
    //                                 $('.datatable').removeMyAjaxLoder();
    //                             });
    //
    //                     }
    //                 }
    //             });
    //         }
    //     }
    //     $( ".remove_last" ).trigger("display");
    // });

    // $(".remove_last").on("load",function (){
    //     if($(this).parents("fieldset").find("table tbody tr").length <=1){
    //         $(this).hide();
    //     }else{
    //         $(this).show();
    //     }
    // });
    // $( ".add_row" ).bind( "display", function() {
    //     if($(this).parents("fieldset").find("table tbody tr").length <=1){
    //         $(this).hide();
    //     }else{
    //         $(this).show();
    //     }
    // });
    // $( ".remove_last" ).bind( "display", function() {
    //     if($(this).parents("fieldset").find("table tbody tr").length <=1){
    //         $(this).hide();
    //     }else{
    //         $(this).show();
    //     }
    // });



        /**
         *
         * Display child table data
         *
         *
         */

        $(document).on('display_child_information', '.child_list', function(event) {
            event.preventDefault();
            /* Act on the event */
            if($(this).find(".child").length == 0){
                $(this).hide(500);
            }else{
                $(this).show(500);
            }
        });



        $(document).on('click', '.add_child_row', function(event) {
            event.preventDefault();

            var childList = $(this).parents(".child_information").find(".child_list");

            /* Act on the event */
            var childs = $(this).parent().find('.childs');
            var index = childs.find('.child').length;

            var content = childs.getComments();
            //console.log(content[0]);
            var contentString = content[0].replace(/\[0\]/g, "["+index+"]");
            var contentHtml = $($.parseHTML($.trim(contentString)));
            contentHtml.find("input,select,textarea").removeAttr('value');
            contentHtml.find("input[type=checkbox]").removeAttr('checked');
            contentHtml.find("input[type=text]").val('[');
            contentHtml.find("textarea").html('');
            //console.log(contentHtml.clone());

            $(contentHtml.clone()).hide().appendTo(childs).show(500);
            //$(contentHtml.clone()).hide().prependTo(childs).show(500);

            childList.trigger('display_child_information');
        });

    $(document).on('click', '.add_child_row_attachment', function(event) {
        event.preventDefault();

        var childList = $(this).parents(".child_information").find(".child_list");

        /* Act on the event */
        var childs = $(this).parent().find('.childs');
        var index = childs.find('.child').length;

        var content = childs.getComments();
        //console.log(content[0]);
        if(index===0)
        {
            var contentString = content[0].replace(/\[0\]/g, "["+index+"]");
        }
         if(index===2)
        {
            var count=index-1;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }
         if(index===4)
        {
            var count=index-2;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }
         if(index===6)
        {
            var count=index-3;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }
         if(index===8)
        {
            var count=index-4;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }
        if(index===10)
        {
            var count=index-5;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }
        if(index===12)
        {
            var count=index-6;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }
        if(index===14)
        {
            var count=index-7;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }
        if(index===16)
        {
            var count=index-8;
            var contentString = content[0].replace(/\[0\]/g, "["+count+"]");

        }


        var contentHtml = $($.parseHTML($.trim(contentString)));
        contentHtml.find("input,select,textarea").removeAttr('value');
        contentHtml.find("input[type=checkbox]").removeAttr('checked');
        contentHtml.find("input[type=text]").val('[');
        contentHtml.find("textarea").html('');
        //console.log(contentHtml.clone());

        $(contentHtml.clone()).hide().appendTo(childs).show(500);
        //$(contentHtml.clone()).hide().prependTo(childs).show(500);

        childList.trigger('display_child_information');
    });





        $(document).on("remove_child_record",".child_list",function(event){

            $(this).find('.childs .child').each(function(index, el) {
                console.log(el);
                console.log(index);

                var content = $(el).html();
                content = content.replace(/\[\d+\]\./g, "["+index+"].");
                $(el).html(content);
            });

            $(this).trigger('display_child_information');
        });


        $(document).on('click', '.remove_child_row', function(event) {
            event.preventDefault();
            /* Act on the event */

            var child            = $(this).parents(".child");
            var child_list = child.parents(".child_list");


            /**
             *
             * Delete From Live Database
             *
             */

            if(child.hasClass('preloaded')){

                var actionUrl = child.data('action');

                bootbox.confirm({
                    message: "<h3 class='text-warning'>Are you sure you want to delete this row?</h3>",
                    buttons: {
                        confirm: {
                            label: 'Yes',
                            className: 'btn-success'
                        },
                        cancel: {
                            label: 'No',
                            className: 'btn-danger'
                        }
                    },
                    callback: function (result) {
                        if(result){
                            $(this).myAjaxLoder();

                            $.ajax({
                                url: actionUrl,
                                type: 'GET',
                                dataType: 'json',
                            })
                                .done(function(result) {
                                    if(typeof result.success!='undefined'){
                                        bootbox.alert("<h3 class='text-success'>"+result.message+"</h3>");
                                        child.remove();
                                        child_list.trigger('remove_child_record');
                                    }else{
                                        bootbox.alert("<h3 class='text-danger'>"+result.message+"</h3>");
                                    }

                                })
                                .fail(function() {
                                    bootbox.alert("<h3 class='text-danger'>Sorry! Something goes wrong! Please try again after sometime.</h3>");
                                })
                                .always(function() {
                                    $(this).removeMyAjaxLoder();
                                });

                        }
                    }
                });



            }else{

                child.remove();
                child_list.trigger('remove_child_record');
            }


        });


        $(document).on("change","input[type=file]",function (event) {
            event.preventDefault();
            //alert(this.files);
            $parent  = $(this).parent();
            console.log($parent);

            $preview = $parent.parent().find(".preview");
            console.log($preview);
            $.each(this.files, function(index, file) {
                /* iterate through array or object */
                var the_url       = window.URL.createObjectURL(file);
                console.log(the_url);
                if ($preview.find('[src]').length >0){
                    $preview.find('[src]').prop('src',the_url);
                    $preview.find('[src]').prop('title',file.name);
                }else{
                    $preview.find('[href]').prop('href',the_url);
                    $preview.find('[href]').prop('title',file.name);
                }
            });
            $preview.removeClass('hide');
        })

        /**
         *
         * Display All Child Information By default
         * This child pulled from
         *
         */

        $(".child_list").trigger('display_child_information');

})

$(function () {
    $(document).bind("childPageReload",function () {
        $(document).find("[data-change-pull]").trigger("change");



        /*
          Activate Rich Textarea
         */

        $(document).find("textarea.richtext").each(function(index,value){
            CKEDITOR.replace( value,{
                toolbar : 'Full',
                skin: 'moono-lisa',
                enterMode		: 1,
                shiftEnterMode	: 2,
                height :'400',
            });
        });

        /*
          Do Other Staffs
         */

        $(".child_list").trigger('display_child_information');




    })
})







