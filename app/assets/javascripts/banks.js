
  $(document).ready(function() {
    $("a.bank-save").click( function() {
        $("#new_bank, [id^=edit_bank_]").submit();
    });

  $('#openBtn-location').click(function(){
    $('#location-modal').modal('show');
  });

  $(document).on('ajax:before', '#new_location', function(){
    if ($("#location_city").val() == '') {
      return false;
    }
  });

  $(document).on('ajax:error', '#new_location', function(xhr, status, error){
    // var errors = $.parseJSON(xhr.responseText).errors
    // $(this).append(status.responseText)
    console.log(status.responseText);
    console.log(error);
    console.log(xhr);
  });

  $(document).on('ajax:success','#new_location', function(evt, data, status, xhr){
    $('#location-modal').modal('hide');
    console.log(data);
    $('#bank_location_id')
      .append($("<option></option>")
      .attr("value",data.id)
      .text(data.city + " ("+ data.state+")")
    );
    var sel = document.getElementById('bank_location_id');
    selectItemByValue(sel, data.city + " ("+ data.state+")");
  });

  // $('.btn-modal-submit').click(function(){
  //   $('#location-modal').modal('hide');
  //   var sel = document.getElementById('bank_location_id');
  //   var name = $('#location_city').val();
  //   $('#bank_location_id')
  //       .append($("<option></option>")
  //       .attr("value",name)
  //       .text(name)
  //     );
    // selectItemByValue(sel, name )
    // $('#location_city').val('');
    // $('#location_state').val('');
    // $('#location_countri').val('');
  // });


  $('#openBtn-bank').click(function(){
    $('#bank-modal').modal('show');
  });

  $('.btn-modal-submit').click(function(){
    $('#bank-modal').modal('hide');
    var sel = document.getElementById('bank_name');
    var name = $('#new-name-bank').val().toUpperCase();
    if (not_exists_name(sel, name)){
      $('#bank_name')
        .append($("<option></option>")
        .attr("value",complete_name)
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

  function not_exists_name(elmnt, value){

    var aReturn = true

    for(var i=0; i < elmnt.options.length; i++)
    {
      if(elmnt.options[i].text == value)
        aReturn = false;
    }
    return aReturn;
  }
});