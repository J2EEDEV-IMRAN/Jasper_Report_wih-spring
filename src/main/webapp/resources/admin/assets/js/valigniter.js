    var lang                          = new Array();
    lang['file_required']             = "%s is required!";
    lang['file_size_max']             = " %s file size is too large(maximum %s)!";
    lang['file_size_min']             = "%s file size is too small (mimimum %s)!";
    lang['file_allowed_type']         = "%s supports only %s !";
    lang['file_disallowed_type']      = "%s does not support %s!";
    lang['file_image_maxdim']         = "%s File Size Is Too Large!";
    lang['file_image_mindim']         = "%s File Size Is Too Small!";
    lang['file_image_exactdim']       = "%s File Structure Is Note Well Defined!";
    lang['is_exactly']                = "%s Value Is Invalid!";
    lang['is_not']                    = "%s  Invalid!";
    lang['valid_hour']                = "%s Time Has To Be In Defined Format!";
    lang['error_max_filesize_phpini'] = "Uploaded File Has To Be In Specified Size!";
    lang['error_max_filesize_form']   = "Uploaded HTML File Has To Be In Specified Size!";
    lang['error_partial_upload']      = "This Is A Partial Uploaded File Only!";
    lang['error_temp_dir']            = "Error In Temp Directory!";
    lang['error_disk_write']          = "Error In Disk Writing!";
    lang['error_stopped']             = "Error In File Upload By Extension!";
    lang['error_unexpected']          = "Unexpected Error In File Upload: %s !";
    lang['valid_date']                = "%s Has To Be Valid Date!";
    lang['valid_range_date']          = "%s Has To Be Valid Date Range!";
    lang['valid_bd_phone_no']         = "%s Has To Be Valid Bangladeshi Mobile Number(Ex.017********)";
    lang['find_unique']               = "%s Not Found In Record!";
    lang['group_unique']              = "Duplicate Record Found!";
    lang['required']                  = "%s Required!";
    lang['requiredif']                = "%s Required!";
    lang['required_if']               = "%s Required!";
    lang['isset']                     = "The %s  Is Required!";
    lang['valid_email']               = "%s Invalid Email ID!";
    lang['valid_emails']              = "%s Invalid Email ID!";
    lang['valid_url']                 = "%s Can Have A Valid URL!";
    lang['valid_ip']                  = "%s Can Have A Valid IP Address!";
    lang['min_length']                = "%s Value Must Be Minimum of %d!";
    lang['max_length']                = "%s Value Must Be Maximum of %d!";
    lang['exact_length']              = " The length of %s should be %d!!";
    lang['alpha']                     = "%s Value Can Be Only Alphabet (Ex.a-z,A-Z)!";
    lang['alpha_numeric']             = "%s Value Can Be Only Alpha-Numeric (Ex.a-z,A-Z,0-9)!";
    lang['alpha_dash']                = "%s Value Can Be Only Alpha-Numeric(a-z,A-Z,0-9) with Underscore(_) and Dash('-') !";
    lang['numeric']                   = "%s Must Be In Numeric Only!";
    lang['is_numeric']                = "%s Must Be In Numeric Only!";
    lang['integer']                   = "%s Must Be Interger Only!";
    lang['regex_match']               = "%s Invalid Format!";
    lang['matches']                   = "%s And %s Must Be Same!";
    lang['is_unique']                 = "%s Must Be Unique!";
    lang['is_natural']                = "%s Must Be Positive Number!";
    lang['is_natural_no_zero']        = "%s Must Be Greater Than Zero (0)!";
    lang['decimal']                   = "%s Must Be Decimal Number!";
    lang['less_than']                 = "%s Value Muste Be Less Than %s!";
    lang['greater_than']              = "%s Value Must Be Greater Than %s!";

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




    $.fn.center =  function (){
        this.css("position","fixed");
        this.css("z-index",99999999999);
        this.css("font-wieght",200);
        this.css("max-width","400px");
        this.css("font-size","20px");
        this.css("top", ($(window).height() / 2) - (this.outerHeight() / 2));
        this.css("left", ($(window).width() / 2) - (this.outerWidth() / 2));
        return this;
    }

    $.fn.myAjaxLoder = function(){
        this.find('div:first').css({opacity:0.5});
        this.append('<div class="row well myAjaxLoder"><i class="fa fa-spinner fa-pulse fa-5x"></i></div>')
        $('.myAjaxLoder').css("position","fixed");
        $('.myAjaxLoder').css("z-index",99999999999);
        $('.myAjaxLoder').css("font-wieght",200);
        $('.myAjaxLoder').css("border-radius","20px");
        $('.myAjaxLoder').css("max-width","400px");
        $('.myAjaxLoder').css("color","#33F");
        $('.myAjaxLoder').css("opacity",1);
        $('.myAjaxLoder').css("font-size","20px");
        $('.myAjaxLoder').css("top", "45%");
        $('.myAjaxLoder').css("left","48%");
        return this;
    }

    $.fn.removeMyAjaxLoder = function(){
        this.find('div:first').css({opacity:1});
        this.find('.myAjaxLoder').remove();
        return this;
    }

    function bn_number(a){
      // var b = String (a);
      // var c = b.replace(/0/g,'০')
      //  .replace(/1/g,'১')
      //  .replace(/2/g,'২')
      //  .replace(/3/g,'৩')
      //  .replace(/4/g,'৪')
      //  .replace(/5/g,'৫')
      //  .replace(/6/g,'৬')
      //  .replace(/7/g,'৭')
      //  .replace(/8/g,'৮')
      //  .replace(/9/g,'৯');
      //console.log(c);
      return a;
    }

    String.prototype.mysqlDateFormatToBangladeshiDateFormat = function(){
      var b       = String (this);
      var myDate  = b.split(" ")[0];
      var myYear  = myDate.split("-")[2];
      var myMonth = myDate.split("-")[1];
      var myDay   = myDate.split("-")[0];
      var returnDate = myDay+'/'+myMonth+'/'+myYear;
      if(b.length >1){
        return returnDate+' '+b[1];
      }else{
        return returnDate;
      }
    }
    
    String.prototype.bangladeshiDateFormatToMysqlDateFormat = function(){
      var b       = String (this);
      var myDate  = b.split(" ")[0];
      var myYear  = myDate.split("/")[2];
      var myMonth = myDate.split("/")[1];
      var myDay   = myDate.split("/")[0];
      var returnDate = myYear+'-'+myMonth+'-'+myDay;
      if(b.length >1){
        return returnDate+' '+b[1];
      }else{
        return returnDate;
      }
    }

    String.prototype.bn_number = function(){
      var b = String (this);
      // var c = b.replace(/0/g,'০')
      //  .replace(/1/g,'১')
      //  .replace(/2/g,'২')
      //  .replace(/3/g,'৩')
      //  .replace(/4/g,'৪')
      //  .replace(/5/g,'৫')
      //  .replace(/6/g,'৬')
      //  .replace(/7/g,'৭')
      //  .replace(/8/g,'৮')
      //  .replace(/9/g,'৯');
      // //console.log(c);
      return b;
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

    function codeigniterValidatorShowMessage(fn_name,input,number,message){

        var field_data_name     = $(input).attr("name");

        var field_data_name_str = field_data_name
                                  .replace(/\[/g,"_")
                                  .replace(/\]/g,"");
        field_data_name_str     = (field_data_name_str.substr(-1) =="_") ? field_data_name_str.substr(0,(field_data_name_str.length-1)) : field_data_name_str;

        if(typeof $("."+field_data_name_str+"_error_message") =="undefined" 
            || $("."+field_data_name_str+"_error_message").length == 0
        ){
            //console.log($(input).parents('.form-group').find('label').html());
            var field_label_name    = $(input).attr("data-label") || $(input).parents('.form-group').find('label').html();
            if(typeof message == 'undefined' 
                || message == 'undefined' 
                || message == 0 
                || message == '0'){

                message = lang[fn_name]
                          .replace("%s",field_label_name)
                          .replace("%d",bn_number(number))
                          .replace("%s",number);
            }else{

                message = message;

            }
            //console.log(field_data_name_str);
            if($(".help-block-for-"+field_data_name_str).length >0){

                if($(input).parent().get(0).tagName=='TD'){

                    $(input).parent(0)
                    .addClass('has-error has-error-'+field_data_name_str);
                    
                    $(".help-block-for-"+field_data_name_str)
                    .append('<div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_'+fn_name+'_for_'+field_data_name_str+'">'+message+'</div>');
               
                }else{
                   
                    $(input).parents(".form-group").addClass('has-error  has-error-'+field_data_name_str);
                    $(input).parents(".form-group").find('.form-control-feedback').addClass('glyphicon-remove');
                    $(".help-block-for-"+field_data_name_str).append('<div class="'+field_data_name_str+'_error_message text-danger valigniter_error_message" id="error_message_'+fn_name+'_for_'+field_data_name_str+'">'+message+'</div>');
                
                }
            }else{
               
                if($(input).parent().get(0).tagName=='TD'){
                    
                    $(input).parent(0).addClass('has-error has-error-'+field_data_name_str);
                    $(input).parent(0).append('<div class="help-block help-block-for-'+field_data_name_str+'"><div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_'+fn_name+'_for_'+field_data_name_str+'">'+message+'</div></div>');
                
                }else{
                    
                    $(input).parents(".form-group").addClass('has-error has-error-'+field_data_name_str);
                    $(input).parents(".form-group").find('.form-control-feedback').addClass('glyphicon-remove');
                    
                    if($(input).parents(".form-group").find('.help-block').length==0){
                        $(input).parents(".form-group")
                        .append('<div class="help-block help-block-for-'+field_data_name_str+'"><div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_'+fn_name+'_for_'+field_data_name_str+'">'+message+'</div></div>');
                    }else{
                    
                        $(input).parents(".form-group").find('.help-block').append('<div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_'+fn_name+'_for_'+field_data_name_str+'">'+message+'</div>');
                    
                    }
                }
            }
           
            
        }
        
        return true;
    }


    function codeigniterShowResponseMessage(input,input_str,message){
        console.log(message);
        var field_data_name     = $(input).attr("name") || '';
        var field_data_name_str = field_data_name.replace(/\[/g,"_").replace(/\]/g,"");
        field_data_name_str     = (field_data_name_str.substr(-1) =="_") ? field_data_name_str.substr(0,(field_data_name_str.length-1)) : field_data_name_str;
        console.log(field_data_name_str);
        //console.log(field_data_name_str);
        //console.log(input);
        if($(input).length == 0 ){

            console.log("No Input field found");

            var message = '<div class="'+field_data_name_str+'_error_message valigniter_error_message alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong></strong>'+message+'</div>';
            
            $('form[data-validation=true]').prepend(message);
            
            $("."+field_data_name_str+'_error_message').center();

            return true;

        }else{

            //console.log(field_data_name_str);

            if($(".help-block-for-"+field_data_name_str).length >0){

                if($(input).parent().get(0).tagName=='TD'){

                    $(input).parent(0)
                    .addClass('has-error has-error-'+field_data_name_str);

                    $(".help-block-for-"+field_data_name_str)
                    .append('<div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_ajax_for_'+field_data_name_str+'">'+message+'</div>');
               
                }else{
                   
                    $(input).parents(".form-group").addClass('has-error  has-error-'+field_data_name_str);
                    $(input).parents(".form-group").find('.form-control-feedback').addClass('glyphicon-remove');
                    $(".help-block-for-"+field_data_name_str).append('<div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_ajax_for_'+field_data_name_str+'">'+message+'</div>');
                
                }
            }else{

                console.log(field_data_name_str);

                if($(input).parent().get(0).tagName=='TD'){
                    
                    $(input).parent(0).addClass('has-error has-error-'+field_data_name_str);
                    $(input).parent(0).append('<div class="help-block help-block-for-'+field_data_name_str+'"><div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_ajax_for_'+field_data_name_str+'">'+message+'</div></div>');
                
                }else{
                    
                    $(input).parents(".form-group").addClass('has-error has-error-'+field_data_name_str);
                    $(input).parents(".form-group").find('.form-control-feedback').addClass('glyphicon-remove');
                    
                    if($(input).parents(".form-group").find('.help-block').length==0){
                        $(input).parents(".form-group")
                        .append('<div class="help-block help-block-for-'+field_data_name_str+'"><div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_ajax_for_'+field_data_name_str+'">'+message+'</div></div>');
                    }else{
                    
                        $(input).parents(".form-group").find('.help-block').append('<div class="'+field_data_name_str+'_error_message valigniter_error_message" id="error_message_ajax_for_'+field_data_name_str+'">'+message+'</div>');
                    
                    }
                }
            }
           
            
            return true;
        }
        
    }


    function codeigniterRemoveMessage(fn_name,input,number){

        var field_data_name     = $(input).attr("name");
        var field_data_name_str = field_data_name.replace(/\[/g,"_").replace(/\]/g,"");
        field_data_name_str     = (field_data_name_str.substr(-1) =="_") ? field_data_name_str.substr(0,(field_data_name_str.length-1)) : field_data_name_str;
        console.log(field_data_name_str);
        if($(input).parent().get(0).tagName=='TD'){

            if(typeof $("."+field_data_name_str+"_error_message") !="undefined"){

                $("#error_message_"+fn_name+"_for_"+field_data_name_str).remove();
                $(".has-error-"+field_data_name_str).removeClass('has-error').removeClass('has-error-for-'+field_data_name_str);
            }
        }else{
            if(typeof $("."+field_data_name_str+"_error_message") !="undefined"){
                $("#error_message_"+fn_name+"_for_"+field_data_name_str).remove();
                $(input).parents(".form-group").removeClass('has-error').removeClass('has-error-for-'+field_data_name_str);
            }

        }
       
        return true;
    }


    function codeigniterShowAjaxLoader(fn_name,input,number){

        var field_data_name         = $(input).attr("name");
        var field_data_name_str = field_data_name.replace(/\[/g,"_").replace(/\]/g,"");
        field_data_name_str     = (field_data_name_str.substr(-1) =="_") ? field_data_name_str.substr(0,(field_data_name_str.length-1)) : field_data_name_str;
        if(typeof $("."+field_data_name_str+"_ajax_loader") =="undefined" || $("."+field_data_name_str+"_ajax_loader").length==0){
                
            var field_label_name    = $(input).attr("data-label");

            var message             = lang[fn_name].replace("%s",field_label_name).replace("%d",bn_number(number));

            $("body").append('<div class="'+field_data_name_str+'_ajax_loader '+field_data_name_str+'_error_message valigniter_ajax_loader_" id="ajax_loader_'+fn_name+'_for_'+field_data_name_str+'"><i class="fa fa-spinner fa-pulse fa-5x"></i></div>');
            $('#ajax_loader_'+fn_name+'_for_'+field_data_name_str).center();
        }


        return true;
    }

    function codeigniterRemoveAjaxLoader(fn_name,input,number){

        var field_data_name     = $(input).attr("name");
        var field_data_name_str = field_data_name.replace(/\[/g,"_").replace(/\]/g,"");
        field_data_name_str     = (field_data_name_str.substr(-1) =="_") ? field_data_name_str.substr(0,(field_data_name_str.length-1)) : field_data_name_str;
        if(typeof $("."+field_data_name_str+"_ajax_loader") !="undefined" || $("."+field_data_name_str+"_ajax_loader").length > 0){
                $('#ajax_loader_'+fn_name+'_for_'+field_data_name_str).remove();
        }

        return true;
    }

    function codeigniterProcessValidation(fn_name,input,var_name){

        var value = $(input).val();

        switch(fn_name){

                    case "required":
                        //console.log(value);
                        if($.trim(value)=="" || value==null){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                            //console.log(message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }

                        break;

                    case "matches":
                        if($.trim(value)==""){
                            break;
                        }

                        if($.trim(value)!=$.trim($("input[name="+var_name+"]").val())){
                            codeigniterValidatorShowMessage(fn_name,'[name='+var_name+']',$(input).attr('data-label'))
                            codeigniterValidatorShowMessage(fn_name,input,$("input[name="+var_name+"]").attr('data-label'));
                        }else{
                            codeigniterRemoveMessage(fn_name,'[name='+var_name+']',$('[name='+var_name+']').attr('data-label'));
                            codeigniterRemoveMessage(fn_name,input,$("input[name="+var_name+"]").attr('data-label'));
                        }
                        break;

                    case "is_unique":
                        if($.trim(value)==""){
                            break;
                        }
                        
                        var url = $(input).attr("data-ajax-url");
                        $.ajax({
                            url: url,
                            type: 'post',
                            dataType: 'json',
                            async: false,
                            data: {table: var_name,value:value},
                            beforeSend: function( xhr ) {
                                codeigniterShowAjaxLoader(fn_name,input,var_name);
                                return true;
                            }
                        })
                        .done(function(response) {
                            codeigniterRemoveAjaxLoader(fn_name,input,var_name);
                            if(typeof response!=null){
                                if(response.exists=='yes'){
                                    var message = $(input).attr('data-message-'+fn_name) || 0;
                                    codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                }
                            }
                            codeigniterRemoveAjaxLoader(fn_name,input,var_name);
                            return true;
                        })
                        .fail(function() {
                            codeigniterRemoveAjaxLoader(fn_name,input,var_name);
                            return true;
                        })
                        .always(function() {
                            codeigniterRemoveAjaxLoader(fn_name,input,var_name);
                            return true;
                        });
                        
                        break;

                    case "alpha":
                        if($.trim(value)==""){
                            break;
                        }
                        var alpha_reg = /^([a-z])+$/i;
                        if(!alpha_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "alpha_numeric":
                        if($.trim(value)==""){
                            break;
                        }
                        var alpha_numeric_reg = /^([a-z0-9])+$/i;
                        if(!alpha_numeric_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "alpha_dash":
                        if($.trim(value)==""){
                            break;
                        }
                        var alpha_dash_reg = /^([-a-z0-9_-])+$/i;
                        if(!alpha_dash_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "numeric":
                        if($.trim(value)==""){
                            break;
                        }
                        var numeric_reg = /^[\-+]?[0-9]*\.?[0-9]+$/;
                        if(!numeric_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "is_numeric":
                        if($.trim(value)==""){
                            break;
                        }
                        var numeric_reg = /^[\-+]?[0-9]*\.?[0-9]+$/;
                        if(!numeric_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "integer":
                        if($.trim(value)=="" || $(input).tagName=='SELECT'){
                            break;
                        }
                        var integer_reg = /^[\-+]?[0-9]+$/;
                        if(!integer_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "decimal" :
                        if($.trim(value)==""){
                            break;
                        }
                        var decimal_reg = /^[\-+]?[0-9]+\.[0-9]+$/;
                        if(!decimal_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "is_natural":
                        if($.trim(value)==""){
                            break;
                        }
                        var natural_reg = /^[0-9]+$/;
                        if(!natural_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "is_natural_no_zero":
                        if($.trim(value)==""){
                            break;
                        }
                        var natural_no_zero = /^[0-9]+$/;
                        if(!natural_no_zero.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "valid_email":
                        if($.trim(value)==""){
                            break;
                        }
                        var email_reg = /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/i;
                        if(! email_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }

                        break;

                    case "valid_emails" :
                        if($.trim(value)==""){
                            break;
                        }
                        var emails = value.split(",").split(" ");
                        var email_reg = /^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/i;
                        for (var i = 0; i < emails.length; i++) {
                           if(! email_reg.test(emails[i])){
                                var message = $(input).attr('data-message-'+fn_name) || 0;
                                codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                            }else{
                                codeigniterRemoveMessage(fn_name,input,var_name)
                            } 
                        };
                        
                        

                        break;

                    case "valid_ip":
                        if($.trim(value)==""){
                            break;
                        }
                        var ip_regex = /^(([1-9]?\d|1\d\d|2[0-5][0-5]|2[0-4]\d)\.){3}([1-9]?\d|1\d\d|2[0-5][0-5]|2[0-4]\d)$/;
                        if(!ip_regex.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "valid_base64":
                        if($.trim(value)==""){
                            break;
                        }
                        var base64_reg = /[^a-zA-Z0-9\/\+=]/;
                        if(!base64_reg.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "min_length":
                        // if($.trim(value)==""){
                        //     break;
                        // }
                        // if(value.length < eval(var_name)){
                        //     var message = $(input).attr('data-message-'+fn_name) || 0;
                        //     codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        // }else{
                        //     codeigniterRemoveMessage(fn_name,input,var_name)
                        // }
                        break;

                    case "max_length":
                        if($.trim(value)==""){
                            break;
                        }
                        console.log(eval(var_name));
                        if(value.length > eval(var_name)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "exact_length":
                        if($.trim(value)==""){
                            break;
                        }
                        if(value.length != eval(var_name)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "greater_than":
                        if($.trim(value)==""){
                            break;
                        }
                        var numeric_reg = /^[\-+]?[0-9]*\.?[0-9]+$/;
                        if(!numeric_reg.test(value) || value <= eval(var_name)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "less_than":
                        if($.trim(value)==""){
                            break;
                        }
                        var numeric_reg = /^[\-+]?[0-9]*\.?[0-9]+$/;
                        if(!numeric_reg.test(value) || value >= eval(var_name)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "regex_match":
                        if($.trim(value)==""){
                            break;
                        }
                        var regex   = new RegExp(var_name);
                        
                        if(!regex.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                            
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "is_date":
                        
                        var regex = /(^(((0[1-9]|[12][0-8])[\/](0[1-9]|1[012]))|((29|30|31)[\/](0[13578]|1[02]))|((29|30)[\/](0[4,6,9]|11)))[\/](19|[2-9][0-9])\d\d$)|(^29[\/]02[\/](19|[2-9][0-9])(00|04|08|12|16|20|24|28|32|36|40|44|48|52|56|60|64|68|72|76|80|84|88|92|96)$)/;
                        

                        if($.trim(value)==""){
                            break;
                        }
                       
                        
                        if(!regex.test(value)){
                            var message = $(input).attr('data-message-'+fn_name) || 0;
                            
                            codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                            
                        }else{
                            codeigniterRemoveMessage(fn_name,input,var_name)
                        }
                        break;

                    case "is_file":
                        if($.trim(value)==""){
                            break;
                        }

                        var supported_files = var_name.toLowerCase().replace(/ /g,'').split(",");
                        var files           = $(input)[0].files;
                        
                        
                        if(files.length > 0){
                            for(var i=0;i<files.length;i++){
                              var file_extension = $.trim(files[i].name.split(".")[(files[i].name.split(".").length-1)].toLowerCase());
                              
                              if($.inArray('*',supported_files) == -1 && $.inArray(file_extension,supported_files) == -1){
                                var message = $(input).attr('data-message-'+fn_name) || 0;
                                
                                codeigniterValidatorShowMessage(fn_name,input,var_name,message);

                                break;
                              }
                            }
                            break;
                        }

                        codeigniterRemoveMessage(fn_name,input,var_name);
                        
                        break;

                    case "max_file_size":
                        if($.trim(value)==""){
                            break;
                        }

                        var max_file_size   = parseFloat(var_name) || 0;
                        var files           = $(input)[0].files;
                        
                        
                        if(max_file_size > 0 && files.length > 0){
                            for(var i=0;i<files.length;i++){
                              var file_size = files[i].size/1024;
                              
                              if(file_size > max_file_size){
                                var message = $(input).attr('data-message-'+fn_name) || 0;
                                
                                codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                break;
                              }
                            }
                            break;
                        }

                        codeigniterRemoveMessage(fn_name,input,var_name);
                        break;

                    case "min_file_size":
                        if($.trim(value)==""){
                            break;
                        }

                        var min_file_size   = parseFloat(var_name) || 0;
                        var files           = $(input)[0].files;
                        
                        
                        if(min_file_size > 0 && files.length > 0){
                            for(var i=0;i<files.length;i++){
                              var file_size = files[i].size/1024;
                              
                              if(file_size < min_file_size){
                                var message = $(input).attr('data-message-'+fn_name) || 0;
                                
                                codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                break;
                              }
                            }
                            break;
                        }

                        codeigniterRemoveMessage(fn_name,input,var_name);
                        break;


                    case "numeric_calculation":
                            var expression    = var_name;
                            var form_elements = expression.match(/'([^']*)'/g);

                            $.each(form_elements, function (index, value) {
                                var cleaned_value = value.replace(/["']/g, "");
                                var input_value = $("[name="+ cleaned_value + "]").val();
                                expression = expression.replace(value, parseFloat(input_value));
                            });
                           
                            try {
                                if(eval(expression)==true){
                                    codeigniterRemoveMessage(fn_name,input,var_name);
                                }else{
                                    var message = $(input).attr('data-message-'+fn_name) || 0;
                                    //console.log(message);
                                    codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                }
                                
                            } catch (e) {
                                if (e instanceof SyntaxError) {
                                    
                                    var message = $(input).attr('data-message-'+fn_name) || 0;
                                    
                                    codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                }
                            }
                            break;



                    case "required_if":
                            var expression    = var_name;
                            var form_elements = expression.match(/'([^']*)'/g);
                            $.each(form_elements, function (index, value) {
                                var cleaned_value = value.replace(/["']/g, "");
                                var input_value = $("[name="+ cleaned_value + "]").val();

                                expression = expression.replace(value, parseFloat(input_value));
                            });
                            try {
                                if(eval(expression)==true && $.trim($(input).val())==''){
                                    var message = $(input).attr('data-message-'+fn_name) || 0;
                                    codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                }else{
                                    codeigniterRemoveMessage(fn_name,input,var_name);
                                }
                                
                            } catch (e) {
                                //console.log(e);
                                if (e instanceof SyntaxError) {
                                    
                                    var message = $(input).attr('data-message-'+fn_name) || 0;
                                    
                                    codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                }
                            }
                            break;
                    case "date_calculation":
                            var expression    = var_name;
                            var form_elements = expression.match(/'([^']*)'/g);
                            
                            $.each(form_elements, function (index, value) {
                                var cleaned_value = value.replace(/["']/g, "");
                                var input_value   = $("[name="+ cleaned_value + "]").val();
                                if (parseInt(input_value) > 0) {
                                    expression    = expression.replace(value, input_value);
                                }
                            });
                            
                            try {
                                if(eval(expression)==true){
                                    codeigniterRemoveMessage(fn_name,input,var_name);
                                }else{
                                    var message = $(input).attr('data-message-'+fn_name) || 0;
                                    
                                    codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                }
                                
                            } catch (e) {
                                if (e instanceof SyntaxError) {
                                    
                                    var message = $(input).attr('data-message-'+fn_name) || 0;
                                    
                                    codeigniterValidatorShowMessage(fn_name,input,var_name,message);
                                }
                            }
                            break;

                    default: 
                        
                        break;
        }
        return true;
    }


    function codeigniterValidateSingleInput(input){
        
        if(typeof $(input).attr("data-validation")=="undefined"){
            return true;
        }
        
        if(typeof $(input).attr("data-validation")!="undefined" && $(input).attr("data-validation")=="false"){
            console.log($(input).attr("name")+"="+$(input).attr("data-validation"));
            return true;
        }

        var validation_rules = $(input).attr("data-validation").split("|");
        
        for(var i=0; i<validation_rules.length; i++){
            var fn_name  = validation_rules[i].split("[")[0];
            var var_name = validation_rules[i].substring(fn_name.length+1,validation_rules[i].length-1);
            codeigniterProcessValidation(fn_name,input,var_name);
        }
        return true;
    }


    function codeigniterSubmitFunction(formObj){

        var ajaxSubmit  = $(formObj).attr("data-ajax-submit");

        if(typeof $(formObj).attr("data-ajax-submit")=="undefined" || $(formObj).attr("data-ajax-submit")!="true"){

            $(formObj).unbind("submit");
            $(formObj).submit();
            return true;
        }
        //var form_data = $(formObj).serialize();
        var form_data = new FormData($(formObj)[0]);
        /*
         var formData = new FormData();
         formData.append('file', $('input[type=file]')[0].files[0]);
         formData.append($(formObj).getAttribute('modelAttribute'),form_data);
         */

        $.ajax({
            url: $(formObj).attr('action') || document.URL,
            type: $(formObj).attr('method') || 'post',
            data: form_data,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function( xhr ) {
                $(formObj).find('input[type=submit],button[type=submit],input[type=button]').attr('disabled', 'disabled');
                $("#pageContent").css({
                    opacity: 0.30
                });
                $("#pageContent").append('<div class="valignator_ajax_loader" style="position:absolute;background:#FFF;padding:10px;text-align:center;width:auto;color:#33A;height:auto;border:1px solid #526A90;border-radius:15px;z-index:999999;"><i class="fa fa-spinner fa-pulse fa-5x"></i></div>');
                $(".valignator_ajax_loader").center();
            }
        })
        .done(function(response) {
            //console.log("test");

            $("#pageContent").html(response);
            $("#pageContent").css({
                opacity: 1.0
            });
            $(document).trigger("childPageReload");
        })
        .fail(function() {
            $(formObj).find('input[type=submit],button[type=submit],input[type=button]').removeAttr('disabled');

            $(".valignator_ajax_loader").remove();
            var message = '<div class="valignator_ajax_error_message alert alert-danger alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong></strong>অভ্যন্তরিন সমস্যা দেখা দিয়েছে, অনুগ্রহ করে কিছুক্ষণ পরে আবার চেষ্টা করুন :(</div>';
            $('form[data-validation=true]').prepend(message);
            $(".valignator_ajax_error_message").center();

            setTimeout(function(){
                $(".valignator_ajax_error_message").remove();
                return true;
            },4000);
        })
        .always(function() {
            $(formObj).find('input[type=submit],button[type=submit],input[type=button]').removeAttr('disabled');
            setTimeout(function(){
                $(".valignator_ajax_loader").remove();
                $("#pageContent").css({
                    opacity: 1.0
                });
                return true;
            },100)
        });
        return true;
    }

    function codeigniterFormValidation(formObj,e){
        e.preventDefault();

        var inputs = $(formObj).find('input, select, textarea').not('input[type=button], input[type=submit], input[type=image],[disabled=disabled],[disabled]');
        
        $(inputs).each(function(index,input){
            codeigniterValidateSingleInput(input);
        });
        
        if(typeof $(".valigniter_error_message")=="undefined" || $(".valigniter_error_message").length ==0 ){
            codeigniterSubmitFunction(formObj);
            return false;
        }
    }

    function selectValidation(formObj,e){
        $("body").find('.valigniter_error_message').remove();
        //console.log( $(formObj).find("[data-validation=false]").length);
        var inputs = $(formObj).find('input, select, textarea').not('input[type=button], input[type=submit], input[type=image],[data-validation=false],[disabled=disabled],[disabled]');
        //console.log(inputs.length);
        $(inputs).each(function(index,input){
            codeigniterValidateSingleInput(input);
        });
        
        if(typeof $(".valigniter_error_message")=="undefined" || $(".valigniter_error_message").length ==0 ){
            codeigniterSubmitFunction(formObj);
            return false;
        }else{
           console.log($(".valigniter_error_message:first").parents('.has-error').find('input,select,textarea').first().focus());
        }
    }
   


    $(function(){

        $(document).on("submit","form[data-validation=true]",function(e){
            e.preventDefault();
            selectValidation(this);
        });

        $("form[data-validation=true] input, form[data-validation=true] select, form[data-validation=true] textarea").not('input[type=button], input[type=submit], input[type=image],[data-validation=false],[disabled=disabled],[disabled]').on("change keyup data-attribute-changed",function(e){
            //console.log($(this));
            //console.log($(this).val());
            try{
                var field_name_str = $(this).attr('name').replace(/\[/g,"_").replace(/\]/g,"");
                //console.log(field_name_str);
                field_name_str     = (field_name_str.substr(-1) =="_") ? field_name_str.substr(0,(field_name_str.length-1)) : field_name_str;
                $("body").find('.'+field_name_str+'_error_message').remove();
                codeigniterValidateSingleInput(this);
            }catch(error){

            }
            
        });  
    })