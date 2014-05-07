
  $(document).ready(function() {
    $("a.bank-save").click( function() {
        $("a.bank-save").attr("disabled", true);
        $("#new_bank, [id^=edit_bank_]").submit();
    });

  $('#openBtn-location').click(function(){
    $('#location_city').val('');
    $('#location_state').val('');
    $('#location_countri').val('');
    $("#error").html('');
    $('#location-modal').modal('show');
  });

  $(document).on('ajax:before', '#new_location', function(){
    if ($("#location_city").val() == '') {
      return false;
    }
  });

  $(document).on('ajax:error', '#new_location', function(event, xhr, status) {
    var errors = jQuery.parseJSON(xhr.responseText)
    $("#error").html(errors.errors[0]);
  });

  $(document).on('ajax:success','#new_location', function(evt, data, status, xhr){
    $('#location-modal').modal('hide');
      $('#bank_location_id')
      .append($("<option></option>")
      .attr("value",data.id)
      .text(data.city + " ("+ data.state+")")
    );
    var sel = document.getElementById('bank_location_id');
    selectItemByValue(sel, data.city + " ("+ data.state+")");
  });


  $('#openBtn-bank-name').click(function(){
    $('#bank-modal').modal('show');
  });

  $('#add-new-name').click(function(){
    $('#bank-modal').modal('hide');
    var sel = document.getElementById('bank_name');
    var name = $('#new-name-bank').val().toUpperCase();
    if (notExistsName(sel, name)){
      $('#bank_name')
        .append($("<option></option>")
        .attr("value",name)
        .text(name)
      );
    }
    selectItemByValue(sel, name )
    $('#new-name-bank').val('');
  });

  function selectItemByValue(elmnt, value){

    for(var i=0; i < elmnt.options.length; i++)
    {
      if(elmnt.options[i].text == value)
        elmnt.selectedIndex = i;
    }
  }

  function notExistsName(elmnt, value){

    var aReturn = true

    for(var i=0; i < elmnt.options.length; i++)
    {
      if(elmnt.options[i].text == value)
        aReturn = false;
    }
    return aReturn;
  }
});