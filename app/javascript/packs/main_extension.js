(function ($) {
  "use strict";
  
  // Make request to change language
  $('body').delegate('#locale', 'change', function(e){
    var data = {
      locale: $(this).val(),
      authenticity_token: $('[name="csrf-token"]').get(0).content
    }
    
    $.ajax({ 
      type: "POST",
      url: "api/v1/configurations/change_locale",
      data: JSON.stringify(data), 
      contentType: 'application/json',
      success: function(res) {
        if(res.success){
          location.reload();
        }else{
          $(this).val(res.locale).change();
        };
      }.bind(this),
      error: function(xhr, status, err){
        console.error(xhr, status, err.toString());
      }.bind(this)
    });  
  })
  
})(jQuery);