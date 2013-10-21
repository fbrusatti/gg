$(document).ready(function() {
  $('#customers').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#customers').data('source')
  });  

  $("a.customer-save").click( function() {
    $("#new_customer, [id^=edit_customer_]").submit();
  });
})  