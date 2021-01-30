(function ($) {
  "use strict";
  
  /*==================================================================
  [ Validate ]*/

  $('body').delegate('.validate-form', 'submit', function(e){
    var input = $('.validate-input .input100');
    var check = true;
    hideValidate(input);

    for(var i = 0; i < input.length; i++){
      if(validate(input[i]) == false){
        showValidate(input[i]);
        check = false;
      }
    }
    $('#flash-box').html('');
    if(check){
      var formData = $(this).serializeArray()
      var data = {
        message: objectifyForm(formData),
        authenticity_token: $('[name="csrf-token"]').get(0).content
      }
      $.ajax({ 
        type: "POST",
        url: "api/v1/messages",
        data: JSON.stringify(data), 
        contentType: 'application/json',
        success: function(res){
          show_flash_box(res.success, res.message);
          if(res.success){
            $(this).get(0).reset()
          };
        }.bind(this),
        error: function(xhr, status, err){
          console.error(xhr, status, err.toString());
        }.bind(this)
      });  
    }
    e.preventDefault();
    return false;
  });
    
  // Convert Array of FormData to Object for Ajax
  function objectifyForm(formArray){
    var formData = {};
    for (var i = 0; i < formArray.length; i++){
      formData[formArray[i]['name']] = formArray[i]['value'];
    }
    return formData;
  }
    
  // Show success and failed
  function show_flash_box(success, message){
    $('#flash-box').html('');
    var state = success ? 'success' : 'danger';
    $('<div/>', {
      class: `alert alert-${state}`,
      role: 'alert'
    }).appendTo('#flash-box');
    $('<ul/>', {}).appendTo('#flash-box div');
    for (var i = 0; i < message.length; ++i){
      $('<li/>', {
        html: message[i]
      }).appendTo('#flash-box div ul');
    }
    window.scrollTo(0, 0);
  }

  $('.validate-form .input100').each(function(){
    $(this).focus(function(){
      hideValidate(this);
    });
  });


  function validate (input) {
    if($(input).attr('type') == 'email' || $(input).attr('name') == 'email'){
      if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null){
        return false;
      }
    }else{
      if($(input).val().trim() == ''){
        return false;
      }
    }
  }

  function showValidate(input){
    var thisAlert = $(input).parent();
    $(thisAlert).addClass('alert-validate');
  }

  function hideValidate(input) {
    var thisAlert = $(input).parent();
    $(thisAlert).removeClass('alert-validate');
  }
})(jQuery);