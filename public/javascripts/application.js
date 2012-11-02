// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$().ready(function(){
    $(function() {
        if ($("#tabs").length==1)
        {
            $("#tabs").tabs();
        }
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
    $("#transfer_department_id").live("change",function(){
        if ( $("#transfer_department_id").val()=="")
        {
            $.get("/department_users/",{
                department_id: $("#transfer_department_id").val()
            }, function(data){
                $("#department_id").val($("#transfer_department_id").val())
                $("#div_ajax").html(data)
            });
        }

    })
    $("#transfer_department").live("click",function(){
        var selected = new Array();
        $('#div_dept_users input:checked').each(function() {
            var text=$(this).attr('id')
            text= text.replace("transfer_users_", "")
            selected.push(text);
        });
        if ($("#transfer_department_id").val()!="")
        {
            if (selected.length==0)
            {
                alert("Select atleast one user to transfer")
            }
            else
            {
                $.post("/department_users/transfer",{
                    department_id: $("#transfer_department_id").val(),
                    users: selected
                }, function(data){
                    if (data && data.to_s!="Error_code1" &&  data.to_s!="Error_code2")
                    {
                        $("#div_ajax").html(data)
                    }
                    else if (data && data.to_s=="Error_code1")
                    {
                        alert("Selected users cannot be transfered")
                    }
                    else if (data && data.to_s=="Error_code2")
                    {
                        alert("Either department or user is not selected")

                    }
                });
            }
        }
        else
        {
            alert("Select A Department")
        }
    })

    /* LEFT NAVIGATION HIDE & SHOW STARTS HERE*/
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
    $("#lnk_agency").live('click',function(){
        if ($("#lnk_agency").hasClass("selected"))
        {
            $("#lnk_agency").removeClass("selected")
        }
        else
        {
            $("#lnk_agency").addClass("selected")
        }
        $('#div_agency').toggle("fast");
    });
    $("#lnk_unit").live('click',function(){
        if ($("#lnk_unit").hasClass("selected"))
        {
            $("#lnk_unit").removeClass("selected")
        }
        else
        {
            $("#lnk_unit").addClass("selected")
        }
        $('#div_unit').toggle("fast");
    });
     $("#lnk_resources").live('click',function(){
        if ($("#lnk_resources").hasClass("selected"))
        {
            $("#lnk_resources").removeClass("selected")
        }
        else
        {
            $("#lnk_resources").addClass("selected")
        }
        $('#div_resources').toggle("fast");
    });

    /* LEFT NAVIGATION HIDE & SHOW ENDS HERE*/
    
    /*Update Department based on agency*/
    $("#users_agency").live("change", function(){
        if($("#users_agency").val()!="")
        {
            $.get("/department_users/get_departments",{
                agency_id : $("#users_agency").val()
            }, function(data){
                if (data[0]!=null)
                {
                    $('#users_department').find('option').remove().end()
                    $('#users_unit').find('option').remove().end()
                    $('#users_unit').append($("<option></option>").attr("value","").text("SELECT AN UNIT"));
                    $('#users_department').append($("<option></option>").attr("value","").text("SELECT A DEPARTMENT"));
                    for(var i=0; i<data[0].length;i++)
                    {
                        $('#users_department').append($("<option></option>").attr("value",data[0][i].department.id).text(data[0][i].department.name));
                    }
                }             
            })
        }
        else
        {
            $('#users_department').find('option').remove().end()
            $('#users_unit').find('option').remove().end()
            $('#users_unit').append($("<option></option>").attr("value","").text("SELECT AN UNIT"));
            $('#users_department').append($("<option></option>").attr("value","").text("SELECT A DEPARTMENT"));
        }
    });
    /*Update Unit based on  Department*/
     $("#users_department").live("change", function(){
        if($("#users_department").val()!="")
        {
            $.get("/department_users/get_units",{
                department_id : $("#users_department").val()
            }, function(data){
                if (data[0]!="")
                {
                    $("#unit_display").show();
                    $('#users_unit').find('option').remove().end()
                    $('#users_unit').append($("<option></option>").attr("value","").text("SELECT AN UNIT"));
                    for(var i=0; i<data[0].length;i++)
                    {
                        $('#users_unit').append($("<option></option>").attr("value",data[0][i].unit.id).text(data[0][i].unit.name));
                    }
                }
                else
                {
                    $("#unit_display").hide();
                }
            })
        }
    });
    /* UNIT Master Screen index page list */
    $("#id_agency").live("change", function(){
        if($("#id_agency").val()!="")
        {
            $.get("/department_users/get_departments",{
                agency_id : $("#id_agency").val()
            }, function(data){
                if (data[0]!=null)
                {
                    $('#standard1_department_id').find('option').remove().end()
                    $('#standard1_department_id').append($("<option></option>").attr("value","").text("SELECT A DEPARTMENT"));
                    for(var i=0; i<data[0].length;i++)
                    {

                        $('#standard1_department_id').append($("<option></option>").attr("value",data[0][i].department.id).text(data[0][i].department.name));
                    }
                }
            })
        }
    });
    $("#standard1_department_id").live("change",function(){
        $.get("/units/",{
            department_id: $("#standard1_department_id").val()
        }, function(data){
            $("#department_id").val($("#standard1_department_id").val())
            $("#div_ajax").html(data)
        });
    })

    /* create */
    $("#units_agency").live("change", function(){
        if($("#units_agency").val()!="")
        {
            $.get("/department_users/get_departments",{
                agency_id : $("#units_agency").val()
            }, function(data){
                if (data[0]!=null)
                {
                    $('#unit_department_id').find('option').remove().end()
                    $('#unit_department_id').append($("<option></option>").attr("value","").text("SELECT A DEPARTMENT"));
                    for(var i=0; i<data[0].length;i++)
                    {
                        $('#unit_department_id').append($("<option></option>").attr("value",data[0][i].department.id).text(data[0][i].department.name));
                    }
                }
            })
        }
    });

    /*units Master screen end */
    /* Transfer Department */
    /*Transfer Departmnet Js Starts*/

   $("#from_department_id").live("change",function(){
        if($("#from_department_id").val()!="")
        {
            $.get("/users/transfer/",{
                department_id: $("#from_department_id").val()
            }, function(data){
                if (data[0]!=null)
                {
                    $('#transfer_username').find('option').remove().end()
                    $('#transfer_username').append($("<option></option>").attr("value","").text("SELECT AN USER"));
                    for(var i=0; i<data[0].length;i++)
                    {
                        $('#transfer_username').append($("<option></option>").attr("value",data[0][i].user.ic_number).text(data[0][i].user.first_name));
                    }
                }
            })
        }
    });

    $("#to_department_id").live("change",function(){

        $.get("/users/update_transfer/",{
            depart_id: $("#to_department_id").val()
        }, function(data){
            $("#department_id").val($("#to_department_id").val())
            $("#div_ajax").html(data)
        });
    })

    $("#transfer_from_agency").live("change", function(){
        if($("#transfer_from_agency").val()!="")
        {
            $.get("/department_users/get_departments",{
                agency_id : $("#transfer_from_agency").val()
            }, function(data){
                if (data[0]!=null)
                {
                    $('#from_department_id').find('option').remove().end()
                    $('#from_department_id').append($("<option></option>").attr("value","").text("SELECT A DEPARTMENT"));
                    for(var i=0; i<data[0].length;i++)
                    {
                        $('#from_department_id').append($("<option></option>").attr("value",data[0][i].department.id).text(data[0][i].department.name));
                    }
                }
            })
        }
    });

    $("#transfer_to_agency").live("change", function(){
        if($("#transfer_to_agency").val()!="")
        {
            $.get("/department_users/get_departments",{
                agency_id : $("#transfer_to_agency").val()
            }, function(data){
                if (data[0]!=null)
                {
                    $('#to_department_id').find('option').remove().end()
                    $('#to_department_id').append($("<option></option>").attr("value","").text("SELECT A DEPARTMENT"));
                    for(var i=0; i<data[0].length;i++)
                    {
                        $('#to_department_id').append($("<option></option>").attr("value",data[0][i].department.id).text(data[0][i].department.name));
                    }
                }
            })
        }
    });

$("#transfer_username").live("change",function(){
        $.get("/users/get_dept_for_users/",{
            ic_number: $("#transfer_username").val()
        }, function(data){
            if(data[0]!=null)
            {
                $("#user_id").val($("#transfer_username").val())
                var content="<table><tr><td><u><b>List of Existing Departments :</b></u></td></tr><tr><td><br/></td></tr>";
                content+=""
                for(i=0; i<data[0].length; i++)
                {
                    content+="<tr><td>"+data[0][i]+"</td></tr>"
                }
                content+="</table>"
                $("#div_dept_transfer").html(content)
            }
            else
            {
                content+="No Departments Found"
                $("#div_dept_transfer").html(content)
            }

        });
    })


/*Transfer Departmnet Js Ends*/



    /* Transfer ends here */
    /* User list left navigation link */
    $("#user_list_department_id").live("change",function(){
        $.get("/departments/depart_user_list/",{
            department_id: $("#user_list_department_id").val()
        }, function(data){
            $("#department_id").val($("#user_list_department_id").val())
            $("#div_ajax").html(data)
        });
    })
    /* Assign Depart starts*/
    $("#standard_user_id").live("change",function(){
        $.get("/department_users/get_departments_for_user/",{
            user_id: $("#standard_user_id").val()
        }, function(data){
            if(data[0]!=null)
            {
                $("#user_id").val($("#standard_user_id").val())
                var content="<table><tr><td><u><b>List of Existing Departments :</b></u></td></tr><tr><td><br/></td></tr>";
                content+=""
                for(i=0; i<data[0].length; i++)
                {
                    content+="<tr><td>"+data[0][i]+"</td></tr>"
                }
                content+="</table>"
                $("#div_dept_name").html(content)
            }
            else
            {
                content+="No Departments Found"
                $("#div_dept_name").html(content)
            }

        });
    })
    $("#assign_department_id").live("change",function(){
        $.post("/users/update_assign/",{
            department_id: $("#assign_department_id").val()
        }, function(data){
            $("#department_id").val($("#assign_department_id").val())
            $("#depart_name").html(data)
        });
    })
    /* Assign Depart ends*/
    $("#standard4_department_id").live("change",function(){
        $.get("/users/",{
            department_id: $("#standard4_department_id").val()
        }, function(data){
            $("#department_id").val($("#standard4_department_id").val())
            $("#div_ajax").html(data)
        });
    })
    /* Dept list page select box */
    $("#agency_list_depart").live("change",function(){
        $.get("/departments/",{
            agency_id: $("#agency_list_depart").val()
        }, function(data){
            $("#department_id").val($("#agency_list_depart").val())
            $("#div_ajax").html(data)
        });
    })

     $("#admin_user_department_id").live("change",function(){
        $.get("/users/admin",{
            department_id: $("#admin_user_department_id").val()
        }, function(data){
            $("#department_id").val($("#admin_user_department_id").val())
            $("#div_ajax").html(data)
        });
    })
    /* User List based on Depart & Agency Starts */
    $("#transfer_agency").live("change", function(){
        if($("#transfer_agency").val()!="")
        {
            $.get("/department_users/get_departments",{
                agency_id : $("#transfer_agency").val()
            }, function(data){
                if (data[0]!=null)
                {
                    $('#standard4_department_id').find('option').remove().end()
                    $('#standard4_department_id').append($("<option></option>").attr("value","").text("SELECT A DEPARTMENT"));
                    for(var i=0; i<data[0].length;i++)
                    {
                        $('#standard4_department_id').append($("<option></option>").attr("value",data[0][i].department.id).text(data[0][i].department.name));
                    }
                }
            })
        }
    });
/* User List based on Depart & Agency Ends */
/* For create user form validation */
    $("#sub_user_link").live("click",function(){
        if ($("#user_first_name").val() == ""){
            alert("Please Enter First Name");
            return false;
        }
        else if ($("#user_last_name").val() == ""){
            alert("Please Enter Last Name");
            return false;
        }
        else if ($("#user_email").val() == ""){
            alert("Please Enter Email");
            return false;
        }
        else if ($("#num1").val() == ""){
            alert("Enter Ic Number in Box1");
            return false;
        }
        else if ($("#num1").val().length != "6"){
            alert("Enter 6 digits in box1");
            return false;
        }
        else if ($("#num2").val() == ""){
            alert("Enter Ic Number in Box2");
            return false;
        }
        else if ($("#num2").val().length != "2"){
            alert("Enter 2 digits in box2");
            return false;
        }
        else if ($("#num3").val() == ""){
            alert("Enter Ic Number in Box3");
            return false;
        }
        else if ($("#num3").val().length != "4"){
            alert("Enter 4 digits in box3");
            return false;
        }
        else if ($("#user_username").val() == ""){
            alert("Please Enter Display Name");
            return false;
        }
        else if ($("#user_state").val() == ""){
            alert("Please Enter State");
            return false;
        }
        else if ($("#role_id").val() == ""){
            alert("Please Choose Role Value");
            return false;
        }
        else if ($("#users_agency").val() == ""){
            alert("Please Choose Agency Value" );
            return false;
        }
        else if ($("#users_department").val() == ""){
            alert("Please Choose Department Name");
            return false;
        }

//        if ($("#users_unit").val() == true){
//            if ($("#users_unit").val() == ""){
//                alert("Please Choose Unit Name");
//                return false;
//            }
//        }
    });
    /*user validation ends */
})

/*Javascripts Starts*/

/*Number Validation*/
function isNumberKey(evt)   {
    var charCode = (evt.which) ? evt.which : evt.keyCode
    if ((charCode >= 48 &&  charCode <= 57) ||  charCode == 8  || charCode==9 || charCode==46)
        return true;
    return false;
}

/*Auto tab functionality in create user*/
function autoTab(e, element, nextElement)
{
    var code;
    if (!e) var e = window.event;
    if (e.which) code = e.which;
    else if (e.keyCode) code = e.keyCode;
    if ((code > 47 && code < 91) || (code > 95 && code < 105))
    {
        if (element.value.length == element.maxLength && nextElement != null)
        {
            nextElement.focus();
        }
    }
}

/*Javascripts Ends*/