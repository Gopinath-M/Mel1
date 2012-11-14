$().ready(function(){
    
    $("#post_message").live("click", function(){
        if($("#message_user_select").val() == "Sort by")
        {
            alert("Select the User Level");
        }
        else if ($("#msg").val() == "")
        {
            alert("Field should not be empty");
        }
        else if ($("#dept_admin_not_available").val() == 1)
        {
            alert("There is no admin available for the selected department. Please select some other department.");
        }
        else
        {
            if($("#message_user_select").val() == "Select Department"){

                if ($("#std_departments").val() != '')
                {
                    $.get("/messages/post_messages",{
                        agency : $("#std_agency").val(),
                        dept : $("#std_departments").val(),
                        message : $("#msg").val()
                    },
                    function(data){
                        $("#message_section").html(data);
                        alert("Message Posted");
                    });
                }
                else
                {
                    alert("Please Select Department");
                }
            }
            else if($("#message_user_select").val() == "Select Agency")
            {
                if ($("#std_agency").val() != '')
                {
                    $.get("/messages/post_messages",{
                        agency : $("#std_agency").val(),
                        message : $("#msg").val()
                    },
                    function(data){
                        $("#message_section").html(data);
                        alert("Message Posted");
                    });
                }
                else
                {
                    alert("Please Select Agency");
                }
            }
            else if ($("#message_user_select").val() == "All Admins")
            {
                $.get("/messages/post_messages",{
                    all_admins : 1,
                    message : $("#msg").val()
                },
                function(data){
                    $("#message_section").html(data);
                    alert("Message Posted");
                });
            }
            else if ($("#message_user_select").val() == "Select Dept Admin")
            {
                $.get("/messages/post_messages",{
                    dept_admin : 1,
                    department : $("#std_departments").val(),
                    message : $("#msg").val()
                },
                function(data){
                    $("#message_section").html(data);
                    alert("Message Posted");
                });
            }
            else
            {
                $.get("/messages/post_messages",{
                    dept : $("#std_departments").val(),
                    message : $("#msg").val()
                },
                function(data){
                    $("#message_section").html(data);
                    alert("Message Posted");
                });
               
               
            }
        }
    });

    /* Message User Type Select Combo Box */

    $("#message_user_select").live("change", function(){

        if($("#message_user_select").val() == "Select Agency" || $("#message_user_select").val() == "Select Department" || $("#message_user_select").val() == "Select Dept Admin")
        {
            $.get("/messages/get_agencies",{
                value:$("#message_user_select").val()
            },
            function(data){
                $("#user_type_select_div").show();
                $("#user_type_select_div").html(data);
            });
        }
        else
            {
                $("#user_type_select_div").hide();

            }
    });

    /* Message Agency Type Select Combo Box */

    $("#std_agency").live("change", function(){

        if($("#message_user_select").val() != "Select Agency")
        {
            $.get("/messages/get_departments",{
                value:$("#std_agency").val()
            },
            function(data){
                $("#user_type_select_div").html(data);
            });
        }
    });

    $("#std_departments").live("change", function(){

        if($("#message_user_select").val() == "Select Dept Admin")
        {
            $.get("/messages/get_department_admin",{
                agency:$("#std_agency").val(),
                dept:$("#std_departments").val()
            },
            function(data){
                $("#user_type_select_div").html(data);
            });
        }
    });

})


function insert_text_field(val){
    var tbl = document.getElementById("comments_section_"+val);
    s = val.split("_")
    tbl.innerHTML = '<input type="text"  size = "50" maxlength= "50" name= "post_comments" id= comments_section_'+ s[1]  + '>' + '<input type="submit" name="Go" value="Go" onclick=submit_post('+s[1]+'); >'
}


function submit_post(val)
{
    s = $("#comments_section_"+val).val();
    if (s != ""){
        $.get("/messages/post_comments",{
            id : val,
            msg : s
        },
        function(data){
            $("#post_message_"+val).html(data);
        });
    }
    else
    {
        alert("Enter something");
    }
}

function submit_post_comment(val){
    s = $("#post_comment_"+val).val();

    if (s != ""){
        $.get("/messages/post_comments",{
            id : val,
            msg : s
        },
        function(data){
            $("#post_message_"+val).html(data);
        });
    }
    else
    {
        alert("Enter something");
    }
}