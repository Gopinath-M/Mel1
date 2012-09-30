// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function(){
    $(function() {
        $("input").watermark({
            placeholder: function() {
                return $(".formRow label[for=" + this.id + "]").hide().text();
            }
        });
        $("input[type='text']").watermark({
            placeholder: function() {
                return $(".formRow label[for=" + this.id + "]").hide().text();
            }
        });
        $("input[type='password']").watermark({
            placeholder: function() {
                return $(".formRow label[for=" + this.id + "]").hide().text();
            }
        });
        $("textarea").watermark({
            placeholder: function() {
                return $(".formRow label[for=" + this.id + "]").hide().text();
            }
        });
    });
    $("#standard_department_id").live("change",function(){
        $.get("/users/",{
            department_id: $("#standard_department_id").val()
        }, function(data){
            $("#department_id").val($("#standard_department_id").val())
            $("#div_ajax").html(data)
        });

    })

    /* LEFT NAVIGATION HIDE & SHOW STARTS HERE*/

//    $(document).ready(function(){
////        $('#div_department').hide();
////        $('#div_admin').hide();
////        $('#div_user').hide();
//    });
    $("#lnk_department").live('click',function(){
        if ($("#lnk_department").hasClass("selected"))
        {
            $("#lnk_department").removeClass("selected")
        }
        else
        {
            $("#lnk_department").addClass("selected")
        }
        $('#div_department').toggle("fast");
    });
    $("#lnk_admin").live('click',function(){
        if ($("#lnk_admin").hasClass("selected"))
        {
            $("#lnk_admin").removeClass("selected")
        }
        else
        {
            $("#lnk_admin").addClass("selected")
        }
        $('#div_admin').toggle("fast");
    });
    $("#lnk_user").live('click',function(){
        if ($("#lnk_user").hasClass("selected"))
        {
            $("#lnk_user").removeClass("selected")
        }
        else
        {
            $("#lnk_user").addClass("selected")
        }
        
        $('#div_user').toggle("fast");
    });
    $("#lnk_cms").live('click',function(){
        if ($("#lnk_cms").hasClass("selected"))
        {
            $("#lnk_cms").removeClass("selected")
        }
        else
        {
            $("#lnk_cms").addClass("selected")
        }

        $('#div_cms').toggle("fast");
    });

/* LEFT NAVIGATION HIDE & SHOW ENDS HERE*/


})