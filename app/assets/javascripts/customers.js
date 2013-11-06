$(document).ready(function() {
  $('#customers-table').dataTable({
    oLanguage: {
      sUrl: "/datatables/spanish.txt"
    },
    sPaginationType: "full_numbers",
    bJQueryUI: true,
    bProcessing: true,
    bServerSide: true,
    sAjaxSource: $('#customers-table').data('source'),
  });  

  $("a.customer-save").click( function() {
    $("#new_customer, [id^=edit_customer_]").submit();
  });
})  