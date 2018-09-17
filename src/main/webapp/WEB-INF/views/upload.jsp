<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="lang" value="${pageContext.response.locale}"/>

<!DOCTYPE html>
<html lang="${pageContext.response.locale}">
<head>
    <jsp:include page="/WEB-INF/views/website/includes/meta.jsp" />
    <jsp:include page="/WEB-INF/views/website/includes/css.jsp" />
</head>
<body>
<div class="container">
    <div class="row well">
        <div class="progress"></div>
        <form action="" class="form-horizontal">

            <div class="form-group">
                <label for="emailInput" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" name="email" id="emailInput" class="form-control"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">		Upload Photos
                </label>
                <div class="col-sm-10 file_information" id="userPhoto_filesInput">
                    <label class="dragzone btn btn-info btn-file">
                        <span>Browse or Drag &amp; Drop</span>
                        <input type="file" id="userPhoto_files" multiple class="hide"/>
                    </label>
                    <div class="hide upload" style="margin-top: 10px;">
                        <button type="button" class="btn btn-primary upload_child_files">
                            <i class="fa fa-upload"> Upload</i>
                        </button>
                        &nbsp; &nbsp; &nbsp;
                        <button type="button" class="btn btn-danger remove_child_files">
                            <i class="fa fa-trash"></i>
                        </button>
                    </div>
                    <div class="child_list" style="margin-top:10px;">
                        <div class="row childs">
                            <!--
                            <div class="col-xs-6 col-sm-4 col-md-3 preview child">

                                <input type="hidden" name="userPhoto.files[0]"/>
                                <div class="thumbnail">
                                    <img style="height:100px;border:0px;border-radius: 10px;" alt="" src="THE_URL" class="img-rounded img-responsive form-control" />
                                    <div class="caption">
                                         <div class="progress">
                                            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                <span class="sr-only">40%</span>
                                            </div>
                                        </div>
                                        <p>
                                            <input type="text" placeholder="Write Title" class="form-control" name="userPhoto.title[0]"/>
                                        </p>
                                        <p>
                                            <textarea name="userPhoto.description[0]" class="form-control" placeholder="Write Description"></textarea>
                                        </p>
                                        <p>
                                            <a href="#" class="btn btn-primary upload_child_file" role="button">	<i class="fa fa-upload"></i>
                                            </a>
                                            <a href="#" class="btn btn-danger remove_child_file" role="button">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            -->
                            <div class="col-xs-6 col-sm-4 col-md-3 preloaded child" data-delete-url="test.php">

                                <input type="hidden" name="userPhoto.files[0]"/>

                                <div class="thumbnail">
                                    <img style="height:100px;border:0px;border-radius: 10px;" alt="Image" src="https://amarschool.files.wordpress.com/2008/11/ata00001-36.jpg?w=470&h=626" class="img-rounded img-responsive form-control" />
                                    <div class="caption">
                                        <p>
                                            <input type="text" placeholder="Write Title" class="form-control" name="userPhoto.title[0]"/>
                                        </p>
                                        <p>
                                            <textarea name="userPhoto.description[0]" class="form-control" placeholder="Write Description"></textarea>
                                        </p>
                                        <p>
                                            <a href="#" class="btn btn-danger remove_child_file" role="button">
                                                <span class="glyphicon glyphicon-trash"></span>
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </form>
    </div>
</div>
<script src="<c:url value="/resources/website/bower_components/jquery/dist/jquery.min.js"/>"></script>
<script src="<c:url value="/resources/website/bower_components/bootstrap/dist/js/bootstrap.min.js"/>"></script>
<script type="text/javascript">
    $(function() {
        /**
         *
         * Extend Jquery with function getComments to get html comments of any node.
         * nodeType for html comment is 8
         *
         */

        $.fn.getComments = function () {
            return this.contents().map(function () {
                if (this.nodeType === 8) return this.nodeValue;
            }).get();
        }



        /**
         *
         * Declare Global File Inputs
         *
         */


        var fileInputs = {};


        /**
         *
         *  Drag & Drop File Upload Handler
         *  Handle dragenter event for dragzone
         *
         */

        $(document).on("dragenter", ".dragzone", function(event) {
            event.preventDefault();
            event.stopPropagation();
            $(this).addClass('dragging');
        });



        $(document).on("dragover", ".dragzone", function(event) {
            event.preventDefault();
            event.stopPropagation();
            $(this).addClass('dragging');
        });

        $(document).on("dragleave", ".dragzone",  function(event) {
            event.preventDefault();
            event.stopPropagation();
            $(this).removeClass('dragging');
        });

        $(document).on("drop", ".dragzone",  function(event) {
            event.preventDefault();
            event.stopPropagation();
            $(this).removeClass('dragging');


            var name = $(this).find("input[type=file]").prop("id");

            if(typeof fileInputs[name]=="undefined"){
                fileInputs[name] = [];
            }

            $.each(event.originalEvent.dataTransfer.files, function(index, val) {
                fileInputs[name].push(val);
            });

            $(this).find('input[type=file]').trigger("filechange");
            $(this).removeClass('dragging');

        });


        $(document).on("change","input[type=file]", function(event) {
            event.preventDefault();

            var name = this.id;

            if(typeof fileInputs[name]=="undefined"){
                fileInputs[name] = [];
            }

            $.each(this.files, function(index, val) {
                /* iterate through array or object */
                fileInputs[name].push(val);
            });

            $(this).trigger("filechange");
        });



        $(document).on("filechange","input[type=file]",function(event){


            $.each(fileInputs, function(inputName, fileInput) {
                /* iterate through array or object */

                var obj = $('#'+inputName);
                var parentNodeId = obj.parents(".file_information").prop('id');
                var filePreviewNode  = $("#"+parentNodeId).find(".childs");
                //console.log(filePreviewNode);

                var formUploadNode   = $("#"+parentNodeId).find(".upload");

                var filePreviewHtml  = $.trim(filePreviewNode.getComments()[0]);

                //console.log(filePreviewHtml);

                if(fileInput.length >0){

                    formUploadNode.removeClass('hide');

                }else{

                    formUploadNode.addClass('hide');

                }

                $.each(fileInput, function(index, file) {

                    var length  = filePreviewNode.find('.child').not('.preloaded').length;

                    if(length > index){
                        return true;
                    }

                    if(file.type.split("/")[0]=="image"){

                        var reader     = new FileReader();
                        var percentage = 0;
                        reader.onload  = function(event) {
                            the_url    = event.target.result;
                            //console.log(file);
                            var contentString = filePreviewHtml.replace(/\[0\]\./g, "["+index+"].").replace("THE_URL", the_url);
                            var contentHtml = $($.parseHTML($.trim(contentString)));
                            contentHtml.find("input,select,textarea").removeAttr('value');
                            contentHtml.find("input[type=checkbox]").removeAttr('checked');
                            contentHtml.find("textarea").html('');
                            //console.log(contentHtml.clone());

                            $(contentHtml.clone()).hide().appendTo(filePreviewNode).show(500);
                        };
                        reader.onerror = function(event){
                            console.log("Error "+event);
                        };
                        reader.onprogress = function(event) {

                            if (event.lengthComputable) {
                                //console.log(" Total Size = "+event.total);
                                //console.log("Loaded = "+event.loaded);
                                percentage = parseInt((event.loaded/event.total)*100);

                            }
                        };
                        reader.onloadend = function(event) {
                            var contents = event.target.result,
                                    error    = event.target.error;

                            if (error != null) {
                                console.error("File could not be read! Code " + error.code);
                            } else {
                                //console.log(" Total Size = "+event.total);
                                //console.log("Loaded = "+event.loaded);
                            }
                        };
                        reader.readAsDataURL(file);
                    }else{
                        var contentString = filePreviewHtml.replace(/\[0\]\./g, "["+index+"].").replace("THE_URL", "");
                        var contentHtml = $($.parseHTML($.trim(contentString)));
                        contentHtml.find("img").replaceWith('<i class="img-rounded img-responsive fa fa-file-o fa-5x"></i>');
                        contentHtml.find("input,select,textarea").removeAttr('value');
                        contentHtml.find("input[type=checkbox]").removeAttr('checked');
                        contentHtml.find("textarea").html('');
                        //console.log(contentHtml.clone());
                        $(contentHtml.clone()).hide().appendTo(filePreviewNode).show(500);
                    }
                });



                $(document).on('click',"#"+parentNodeId+" .remove_child_files",function(event) {
                    event.preventDefault();
                    fileInputs[inputName] = [];
                    filePreviewNode.find('.child').not('.preloaded').remove();
                    $(this).parents('.upload').addClass('hide');

                });

                $(document).on('click',"#"+parentNodeId+" .remove_child_file",function(event) {
                    event.preventDefault();

                    var child      = $(this).parents(".child");
                    if(child.hasClass('preloaded')){
                        /**
                         *
                         * Delete from database
                         *
                         */

                    }else{
                        var preloaded  = child.parents(".child_list").find('.preloaded').length
                        var index      = child.index();
                        index = index - preloaded;
                        fileInputs[inputName].splice(index, 1);
                        child.remove();
                    }

                });
                $(document).on('click',"#"+parentNodeId+" .upload_child_file",function(event) {
                    event.preventDefault();

                    var child      = $(this).parents(".child");

                    var preloaded  = child.parents(".child_list").find('.preloaded').length
                    var index      = child.index();
                    index = index - preloaded;
                    //console.log(fileInputs[inputName][index]);

                    var formData = new FormData();
                    formData.append('file',fileInputs[inputName][index]);
                    //console.log(formData);
                    $.ajax({
                        url: 'http://localhost:8080/upload?${_csrf.parameterName}=${_csrf.token}',
                        type: 'POST',
                        dataType: 'json',
                        data: formData,
                        cache: false,
                        contentType: false,
                        processData: false,
                        xhr: function() {
                            var xhr = $.ajaxSettings.xhr();

                            if (xhr.upload) {
                                //alert(xhr);
                                xhr.upload.onprogress = function(event){
                                    var perc = Math.round((event.loaded / event.total) * 100);
                                    console.log(perc);
                                };
                            }
                            return xhr;
                        },
                        success: function(response){
                            console.log(response);
                        },
                    })
                            .done(function(response) {
                                console.log(response);
                            })
                            .fail(function(response) {
                                console.log(response);
                            })
                            .always(function() {
                                console.log("complete");
                            });
                });

            });
        })
    });
</script>
</body>
</html>