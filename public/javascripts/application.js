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
            $("#div_ajax").html(data)
        });

    })

    /* LEFT NAVIGATION HIDE & SHOW STARTS HERE*/

    $(document).ready(function(){
        $('#div_selected_department').hide();
        $('#div_selected_admin').hide();
        $('#div_selected_user').hide();
    });
    $("#selected_department").live('click',function(){
        if ($("#selected_department").hasClass("selected"))
        {
            $("#selected_department").removeClass("selected")
        }
        else
        {
            $("#selected_department").addClass("selected")
        }
        $('#div_selected_department').toggle("fast");
    });
    $("#selected_admin").live('click',function(){
        if ($("#selected_admin").hasClass("selected"))
        {
            $("#selected_admin").removeClass("selected")
        }
        else
        {
            $("#selected_admin").addClass("selected")
        }
        $('#div_selected_admin').toggle("fast");
    });
    $("#selected_user").live('click',function(){
        if ($("#selected_user").hasClass("selected"))
        {
            $("#selected_user").removeClass("selected")
        }
        else
        {
            $("#selected_user").addClass("selected")
        }
        
        $('#div_selected_user').toggle("fast");
    });

/* LEFT NAVIGATION HIDE & SHOW ENDS HERE*/


})