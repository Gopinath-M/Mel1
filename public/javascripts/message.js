$().ready(function (){

    $("#resource_transport_sub_category_id").live("change", function (){
      if($("#resource_transport_sub_category_id").val()!="")
      {
        $.get("/resource_transportation_bookings/get_vehicle_brands",{
          sub_category_id : $("#resource_transport_sub_category_id").val()
        }, function(data){
          if (data[0]!=null)
          {
            $('#resource_transport_vehicle_model_type_id').find('option').remove().end()
            $('#resource_transport_vehicle_model_type_id').append($("<option></option>").attr("value","").text("Select a Vehicle Brand"));
            for(var i=0; i<data[0].length;i++)
            {
              $('#resource_transport_vehicle_model_type_id').append($("<option></option>").attr("value",data[0][i].vehicle_model_type.id).text(data[0][i].vehicle_model_type.name));
            }
          }
        })
      }
    });

    $("#post_message").live("click", function (){
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

    $("#message_user_select").live("change", function (){			
      if($("#message_user_select").val() == "Select Agency" || $("#message_user_select").val() == "Select Department" || $("#message_user_select").val() == "Select Dept Admin" || $("#message_user_select").val() == "Select Unit" || $("#message_user_select").val() == "Select Unit Admin")
      {
        $.get("/messages/get_agencies",{
          value:$("#message_user_select").val()
        },
        function(data){
          $("#user_type_select_div").show();
          $("#user_type_select_div").html(data);
        });
      }
      else if ($("#message_user_select").val() == "Select Group")
      { 
      	$.get("/messages/get_groups",{          
        },
        function(data){
          $("#user_type_select_group_div").show();
          $("#user_type_select_group_div").html(data);
        });
      }
      else
      {
        $("#user_type_select_div").hide();
        $("#user_type_select_group_div").hide();
      }
    });

    /* Message Agency Type Select Combo Box */

    $("#std_agency").live("change", function (){

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

    $("#std_departments").live("change", function (){

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
      else if($("#message_user_select").val() == "Select Unit" || $("#message_user_select").val() == "Select Unit Admin")
      {
        $.get("/messages/get_units",{
          agency:$("#std_agency").val(),
          dept:$("#std_departments").val()
        },
        function(data){
          $("#user_type_select_div").html(data);
        });
      }

    });

    $("#std_units").live("change",function (){

      if($("#message_user_select").val() == "Select Unit Admin"){
        $.get("/messages/get_unit_admin",{
          agency:$("#std_agency").val(),
          dept:$("#std_departments").val(),
          unit:$("#std_units").val()
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
    tbl.innerHTML = '<div class="PM-cmts box"><div class="PM-cmts-post">\n\
    <p class="formRow">\n\
    <label for="cmts" class="ui-watermark-label-pass"></label>\n\
    <textarea class="" name="" rows="" cols="" id= "post_comment_'+s[1]+'"></textarea>  <p>  </div>'+ '<input type="submit" class="btn2 in-btn2" name="Post" value="Post" onclick=submit_post_comment('+s[1]+'); ></div>'
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

  function validateMessageForm(){
  	
    if ($("#message_message").val() == "")
    {
      alert("Looks like you didn't write anything in the message area.");
      return false;
    }    
    else if ($("#message_user_select").val() == "Please Select")
    {   	
      alert("Select User Level");
      return false;
    }
    else if ($("#std_agency").val() == ""){
      alert("Select Agency Level");
      return false;
    }
    else if ($("#std_departments").val() == ""){
      alert("Select Department Level");
      return false
    }
    else if ($("#std_units").val() == "SELECT AN UNIT"){
      alert("Select Unit Level");
      return false
    }  
    else if ($("#std_group").val() == "") {      
      if ($('#user_type_select_group_div').css('display') == 'block') 
          {
      	  	alert("Please Select Group");
		  	return false;
		  }
		  else
		  {
		  	return true;	
		  }      
		  }
    else
    {
      return true;
    }
  }

  function validate_ict_firewall_requests(){
    if ($("#source1").val() == "" || $("#source2").val() == "" || $("#source3").val() == "" || $("#source4").val() == "" )      
    {
      alert("Please Enter Source Ip Correctly");
      return false;
    }
    else if ($("#dest1").val() == "" || $("#dest2").val() == "" || $("#dest3").val() == "" || $("#dest4").val() == "")
     {
     	alert("Please Enter Destination Ip Correctly");
      return false;
     }
    else if ( $("#ict_facility_service_id").val() == "" )
    {
    	alert("Service Name Should not be Empty");
      return false;
    }
    else if ($("#ict_firewall_requested_from_date").val() == "")
    {
    	alert("From Date Should not be Empty");
      return false;
    }
    else if ($("#ict_firewall_requested_to_date").val() == "")
    {
    	alert("To Date Should not be Empty");
      return false;
    }
    else if ($("#ict_firewall_justification").val() == "")
    {
    	alert("Justification Should not be Empty");
      return false;
    }
    else {
    	return true;
    }
  }






