  $(document).ready(function() {
    $("a.bank-save").click( function() {
        $("#new_bank, [id^=edit_bank_]").submit();
    });

  $('#openBtn-bank').click(function(){
    $('#bank-modal').modal('show')
  });

  $('.btn-modal-submit').click(function(){
    $('#bank-modal').modal('hide');
    var sel = document.getElementById('bank_name');
    var name = $('#new-name-bank').val().toUpperCase();
    if (not_exists_name(sel, name)){
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