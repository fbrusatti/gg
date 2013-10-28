  $(document).ready(function() {
    $("a.bank-save").click( function() {
        $("#new_bank, [id^=edit_bank_]").submit();
    });

  $('#openBtn-bank').click(function(){
    $('#bank-modal').modal('show')
  });

  $('.btn-modal-submit').click(function(){
    $('#bank-modal').modal('hide');
    $('#bank_name')
      .append($("<option></option>")
      .attr("value",$('#new-name-bank').val().toUpperCase())
      .text($('#new-name-bank').val().toUpperCase())
    );
     console.log($('#new-name-bank').val());
  });

});