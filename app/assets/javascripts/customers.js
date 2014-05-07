$(document).ready(function() {
  $('#customers-table').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    bAutoWidth: false,
    "aaSorting": [[ 0, "desc" ]],
    sAjaxSource: $('#customers-table').data('source')
  });  

  $("a.customer-save").click( function() {
    $("#new_customer, [id^=edit_customer_]").submit();
  });

  $("#customer_dni").on("change", function(){
    var dni = $("#customer_dni").val();
    $("#customer_cuit_cuil").val("XX-" + dni + "-X");
  });

})  